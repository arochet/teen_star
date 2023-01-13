import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_error.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:teenstar/PRESENTATION/resume/widget/app_bar_cycle.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../resume/resume_page.dart';

class BottomBarNavigation extends ConsumerWidget {
  const BottomBarNavigation({Key? key, required this.listRoute, required this.listMenu}) : super(key: key);
  final listRoute;
  final List listMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color? colorPanel = colorpanel(700);
    final env = ref.watch(environment.notifier).state.name;

    return DefaultTabController(
      length: 2,
      child: AutoTabsScaffold(
        appBarBuilder: (_, tabsRouter) => AppBar(
            backgroundColor: colorPanel,
            title: _buildAppBar(context, ref, tabsRouter.activeIndex),
            centerTitle: true,
            bottom: tabsRouter.activeIndex == 0 ? _buildTabBarCycle(ref) : null,
            actions: env == Environment.dev
                ? [
                    InkWell(
                      onTap: () {
                        final notifier = ref.read(showFilePath.notifier);
                        notifier.state = !ref.read(showFilePath);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.remove_red_eye, size: 25),
                      ),
                    ),
                  ]
                : null),
        backgroundColor: colorpanel(900),
        routes: listRoute,
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
              backgroundColor: colorPanel,
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: actioncolor["primary"],
              unselectedItemColor: colorpanel(100),
              onTap: (id) {
                printDev("Page: ${listMenu[id]["title"]}");
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
              items: listMenu
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
      return Text(listMenu[index]["title"], style: Theme.of(context).textTheme.headline4);
    } else if (index == 2) {
      return Text(listMenu[index]["title"], style: Theme.of(context).textTheme.headline4);
    } else {
      return Container();
    }
  }
}
