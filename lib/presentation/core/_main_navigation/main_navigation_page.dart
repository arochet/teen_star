import 'package:teenstar/PRESENTATION/auth/widget/check_connexion_widget.dart';
import 'package:teenstar/PRESENTATION/core/_main_navigation/bottom_bar_navigation.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'side_bar_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainNavigationPage extends StatelessWidget {
  MainNavigationPage({Key? key}) : super(key: key);

  final listRoute = [
    ResumeRoute(),
    HistoriqueRoute(),
    AccountRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    final listMenu = [
      {
        "title": "Résumé",
        "icon": Icons.radio_button_checked,
        "id": 0,
      },
      {
        "title": "Historique",
        "icon": Icons.graphic_eq,
        "id": 1,
      },
      {
        "title": "Réglages",
        "icon": Icons.settings,
        "id": 2,
      },
    ];
    return CheckUserConnected(
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600)
          return SideBarNavigation(
            listRoute: listRoute,
            listMenu: listMenu,
          );
        else
          return BottomBarNavigation(
            listRoute: listRoute,
            listMenu: listMenu,
          );
      }),
    );
  }
}
