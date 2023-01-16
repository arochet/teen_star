import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_historique.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_historique_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_error.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:teenstar/PRESENTATION/resume/pdf/generate_cycle_pdf.dart';
import 'package:teenstar/PRESENTATION/resume/widget/app_bar_cycle.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../resume/resume_page.dart';

class BottomBarNavigation extends ConsumerStatefulWidget {
  final listRoute;
  final List listMenu;
  const BottomBarNavigation({Key? key, required this.listRoute, required this.listMenu}) : super(key: key);

  @override
  _BottomBarNavigationState createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends ConsumerState<BottomBarNavigation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Color? colorScaffoldBar = colorpanel(900);
    Color? colorScaffoldBarReglage = colorpanel(800);
    final env = ref.watch(environment.notifier).state.name;
    final showTabAnalyse = ref.watch(showAnalyse);
    _tabController.index = showTabAnalyse ? 1 : 0;

    return DefaultTabController(
      length: 2,
      child: AutoTabsScaffold(
        appBarBuilder: (_, tabsRouter) => AppBar(
            backgroundColor: tabsRouter.activeIndex == 2 ? colorScaffoldBarReglage : colorScaffoldBar,
            title: _buildAppBar(context, ref, tabsRouter.activeIndex),
            centerTitle: true,
            bottom: tabsRouter.activeIndex == 0 ? _buildTabBarCycle(ref) : null,
            elevation: tabsRouter.activeIndex == 0 ? 4 : 0,
            actions: [
              if (env == Environment.dev)
                InkWell(
                  onTap: () {
                    final notifier = ref.read(showFilePath.notifier);
                    notifier.state = !ref.read(showFilePath);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.remove_red_eye, size: 25, color: colorpanel(200)),
                  ),
                ),
              if (tabsRouter.activeIndex == 0)
                InkWell(
                  onTap: () => _showActionSheetCycle(context, ref),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.more_vert, size: 25, color: colorpanel(200)),
                  ),
                ),
              if (tabsRouter.activeIndex == 1)
                InkWell(
                  onTap: () => _showActionSheetHistorique(context, ref),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.more_vert, size: 25, color: colorpanel(200)),
                  ),
                ),
              SizedBox(width: 10),
            ]),
        backgroundColor: colorpanel(900),
        routes: widget.listRoute,
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
              backgroundColor: tabsRouter.activeIndex == 2 ? colorScaffoldBarReglage : colorScaffoldBar,
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: actioncolor["primary"],
              unselectedItemColor: colorpanel(100),
              elevation: 0,
              onTap: (id) {
                printDev("Page: ${widget.listMenu[id]["title"]}");
                ref.read(isSelection.notifier).state = false;
                if (id == 0) {
                  ref.refresh(allCycleProvider);
                  final id = ref.read(idCycleCourant);
                  if (id != null) ref.refresh(cycleProvider(id));
                }
                if (id == 1) {
                  ref.refresh(allCycleHistoriqueProvider);
                }
                tabsRouter.setActiveIndex(id);
              },
              selectedLabelStyle: TextStyle(
                fontFamily: Theme.of(context).textTheme.headline3?.fontFamily,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: Theme.of(context).textTheme.headline3?.fontFamily,
                fontWeight: FontWeight.w600,
              ),
              items: widget.listMenu
                  .map(
                    (element) => BottomNavigationBarItem(
                      icon: Icon(element["icon"]),
                      label: element["title"],
                    ),
                  )
                  .toList());
        },
      ),
    );
  }

  TabBar _buildTabBarCycle(WidgetRef ref) {
    return TabBar(
        controller: _tabController,
        unselectedLabelColor: colorpanel(100),
        labelColor: actioncolor["primary"],
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        indicatorColor: actioncolor["primary"],
        onTap: (index) {
          if (index == 0) {
            ref.read(showAnalyse.notifier).state = false;
          } else {
            ref.read(showAnalyse.notifier).state = true;
          }
        },
        tabs: [
          Tab(text: 'Résumé'),
          Tab(text: 'Analyse'),
        ]);
  }

  _buildAppBar(BuildContext context, WidgetRef ref, int index) {
    //PAGE RESUME
    if (index == 0) {
      //Id du cycle en cours
      UniqueId? idCourant = ref.watch(idCycleCourant);
      AsyncValue<Either<CycleFailure, List<CycleDTO>>> listAsync = ref.watch(allCycleProvider);
      final selection = ref.watch(isSelection);

      //LIST CYCLE DTO
      final listCycleWidget = listAsync.when(
        data: (data) {
          return data.fold(
            (error) => ShowError(error.toString()),
            (List<CycleDTO> listCyclesDTO) {
              if (listCyclesDTO.length == 0) {
                //PAGE : Pas de cycle
                return Text("Cycle",
                    style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white));
              } else {
                if (idCourant == null) {
                  //PAGE : Erreur sur l'id du cycle courant
                  return Center(child: Text("...", style: Theme.of(context).textTheme.headline4));
                } else {
                  if (selection)
                    return Center(
                        child: Text("Cycle ${idCourant.getOrCrash()}",
                            style: Theme.of(context).textTheme.headline4));
                  else
                    return AppBarCycle(listCyclesDTO: listCyclesDTO, idCycle: idCourant);
                }
              }
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text(err.toString()),
      );

      return listCycleWidget;
    } else if (index == 1) {
      return Text(widget.listMenu[index]["title"], style: Theme.of(context).textTheme.headline4);
    } else if (index == 2) {
      return Text(widget.listMenu[index]["title"], style: Theme.of(context).textTheme.headline4);
    } else {
      return Container();
    }
  }

  void _showActionSheetCycle(BuildContext context, WidgetRef ref) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        // title: const Text('Title'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(context);
              final listeCycleEither = await ref.read(allCycleProvider.future);

              listeCycleEither.fold(
                (l) => showSnackbarCycleFailure(context, l),
                (List<CycleDTO> listeCycle) async {
                  final listCycleAsync = await ref
                      .read(cycleRepositoryProvider)
                      .readListCycles(listeCycle.first.id!, listeCycle.last.id!);

                  final userData = await ref.read(currentUserData.future);
                  listCycleAsync.fold(
                      (l) => showSnackbarCycleFailure(context, l), (list) => generatePDF(userData, list));
                },
              );
            },
            child: const Text('Exporter en PDF'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              ref.read(isSelection.notifier).state = !ref.read(isSelection);
            },
            child: const Text('Modifier Cycle'),
          ),
        ],
      ),
    );
  }

  void _showActionSheetHistorique(BuildContext context, WidgetRef ref) {
    AsyncValue<Either<CycleFailure, List<ObservationHistoriqueDTO>>> listAsync =
        ref.watch(allCycleHistoriqueProvider);

    listAsync.whenData(
      (data) {
        return data.fold(
          (error) => showSnackbarCycleFailure(context, error),
          (List<ObservationHistoriqueDTO> listObservation) {
            if (listObservation.length == 0) {
              //Pas de cycle
              return null;
            } else {
              //Conversion des observations en Cycle
              List<CycleHistorique> listCycle = [];

              //Créer une liste de Cycle avec les observations
              for (var observation in listObservation) {
                bool found = false;
                for (var cycle in listCycle) {
                  if (found == false) {
                    if (observation.idCycle == cycle.id.getOrCrash()) {
                      found = true;
                    }
                  }
                }

                if (found == false) {
                  listCycle
                      .add(CycleHistorique.fromListDTOwithEmptyDays(listObservation, observation.idCycle));
                }
              }
              listCycle = listCycle.reversed.toList();

              showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) => CupertinoActionSheet(
                  // title: const Text('Title'),
                  actions: <CupertinoActionSheetAction>[
                    CupertinoActionSheetAction(
                      onPressed: () async {
                        final onRenvoie = await showDialogChoix(context,
                            'Etes-vous sûr de vouloir renvoyer le cycle ${listCycle.length} vers ${listCycle.length - 1} ?',
                            positiveText: 'Renvoyer', negativeText: 'Annuler');
                        if (onRenvoie == true) {
                          final result = await ref.read(cycleRepositoryProvider).renvoieDernierCycle();
                          result.fold((l) => showSnackbarCycleFailure(context, l),
                              (_) => ref.refresh(allCycleHistoriqueProvider));
                        }
                        Navigator.pop(context);
                      },
                      child: Text('Renvoyer Cycle ${listCycle.length} vers ${listCycle.length - 1}'),
                    ),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}
