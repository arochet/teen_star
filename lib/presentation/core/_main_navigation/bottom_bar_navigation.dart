import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

class BottomBarNavigation extends ConsumerWidget {
  const BottomBarNavigation({Key? key, required this.listRoute, required this.listMenu}) : super(key: key);
  final listRoute;
  final List listMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final env = ref.watch(environment.notifier).state.name;
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
          backgroundColor: colorpanel(700),
          title: Text("TeenSTAR", style: Theme.of(context).textTheme.headline4),
          centerTitle: true,
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
            backgroundColor: colorpanel(700),
            currentIndex: tabsRouter.activeIndex,
            selectedItemColor: actioncolor["primary"],
            onTap: (id) {
              printDev("Page: ${listMenu[id]["title"]}");
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
    );
  }
}
