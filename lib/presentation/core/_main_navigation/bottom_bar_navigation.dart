import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_error.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:teenstar/PRESENTATION/cycle/widget/app_bar_cycle.dart';
import 'package:teenstar/PRESENTATION/cycle/widget/dialog_pdf.dart';
import 'package:teenstar/injection.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../cycle/cycles_page.dart';

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
            bottom: /* tabsRouter.activeIndex == 0 ? _buildTabBarCycle(ref)  :*/ null,
            elevation: /* tabsRouter.activeIndex == 0 ? 4 : */ 0,
            actions: [
              if (env == Environment.dev)
                InkWell(
                  onTap: () {
                    final notifier = ref.read(showFilePath.notifier);
                    notifier.state = !ref.read(showFilePath);
                    getIt<AppLog>().can = ref.read(showFilePath);
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
          return ShowComponentFile(
            title: 'core/_main_navigation/bottom_bar_navigation.dart',
            child: BottomNavigationBar(
                backgroundColor: tabsRouter.activeIndex == 2 ? colorScaffoldBarReglage : colorScaffoldBar,
                currentIndex: tabsRouter.activeIndex,
                selectedItemColor: actioncolor["primary"],
                unselectedItemColor: colorpanel(100),
                elevation: 0,
                onTap: (id) {
                  printDev();
                  ref.read(isSelection.notifier).state = false;
                  if (id == 0) {
                    ref.invalidate(allCycleProvider);
                    ref.invalidate(lastCycleId);
                    ref.invalidate(rangeDisplayObservation);
                    final id = ref.read(idCycleCourant);
                    if (id != null) ref.invalidate(cycleProvider(id));
                  }
                  if (id == 1) {
                    ref.invalidate(allCycleFullProvider);
                  }
                  tabsRouter.setActiveIndex(id);
                },
                selectedLabelStyle: TextStyle(
                  fontFamily: Theme.of(context).textTheme.titleLarge?.fontFamily,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: Theme.of(context).textTheme.titleLarge?.fontFamily,
                  fontWeight: FontWeight.w600,
                ),
                items: widget.listMenu
                    .map(
                      (element) => BottomNavigationBarItem(
                        icon: Icon(element["icon"]),
                        label: element["title"],
                      ),
                    )
                    .toList()),
          );
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
    //PAGE CYCLE
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
                return Text("CEPP", style: Theme.of(context).textTheme.titleMedium);
              } else {
                if (idCourant == null) {
                  //PAGE : Erreur sur l'id du cycle courant
                  return Center(child: Text("...", style: Theme.of(context).textTheme.titleMedium));
                } else {
                  if (selection)
                    return Center(
                        child: Text("Cycle ${idCourant.getOrCrash()}",
                            style: Theme.of(context).textTheme.titleMedium));
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
      return Text(widget.listMenu[index]["title"], style: Theme.of(context).textTheme.titleMedium);
    } else if (index == 2) {
      return Text(widget.listMenu[index]["title"], style: Theme.of(context).textTheme.titleMedium);
    } else {
      return Container();
    }
  }

  void _showActionSheetCycle(BuildContext context, WidgetRef ref) {
    UniqueId? idCourant = ref.watch(idCycleCourant);

    if (idCourant == null) {
      showSnackbar(context, "Aucun cycle pour le moment !");
      return;
    }

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
                  final passwordPdf = await ref.read(authRepositoryProvider).getPasswordPDF();

                  showDialogApp(
                    context: context,
                    titre: "Exporter PDF",
                    child: DialogPDF(listeCycle),
                  );
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
            child: Text('Modifier Cycle ${idCourant?.getOrCrash()}'),
          ),
        ],
      ),
    );
  }

  void _showActionSheetHistorique(BuildContext context, WidgetRef ref) async {
    //TEST
    final result = await ref.read(cycleRepositoryProvider).readAllCycles();
    result.fold((l) => showSnackbarCycleFailure(context, l), (listCycle) async {
      final idDernierCycle = Cycle.lastId(listCycle.map((e) => e.toDomain([])).toList())?.getOrCrash();

      if (idDernierCycle == 1 || idDernierCycle == null) {
        showSnackbar(context, "Il n'y a qu'un seul cycle : pas de renvoi possible");
        return;
      }
      if (idDernierCycle == 0) {
        showSnackbar(context, "Il n'y a pas de cycle : pas de renvoi possible");
        return;
      }
      await showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              onPressed: () async {
                final onRenvoie = await showDialogChoix(context,
                    'Etes-vous sûr de vouloir renvoyer le cycle $idDernierCycle vers ${idDernierCycle - 1} ?',
                    positiveText: 'Renvoyer', negativeText: 'Annuler');
                if (onRenvoie == true) {
                  final result = await ref.read(cycleRepositoryProvider).renvoieDernierCycle();
                  print('renvoie derneir cycle');
                  result.fold((l) => showSnackbarCycleFailure(context, l),
                      (_) => ref.invalidate(allCycleFullProvider));
                }
                Navigator.pop(context);
              },
              child: Text('Renvoyer Cycle $idDernierCycle vers ${idDernierCycle - 1}'),
            ),
          ],
        ),
      );

      ref.invalidate(lastCycleId);
      ref.invalidate(idCycleCourant);
      final async = await ref.read(lastCycleId.future);
      async.fold((l) => showSnackbarCycleFailure(context, l), (id) {
        ref.read(idCycleCourant.notifier).state = id;
      });
    });
  }
}
