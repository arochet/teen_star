import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:teenstar/PRESENTATION/auth/widget/check_connexion_widget.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_core/app_widget.dart';
import 'package:teenstar/PRESENTATION/core/_main_navigation/bottom_bar_navigation.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_form.dart';
import 'package:teenstar/providers.dart';
import 'side_bar_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainNavigationPage extends ConsumerStatefulWidget {
  MainNavigationPage({Key? key}) : super(key: key);

  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends ConsumerState<MainNavigationPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      if (/* ref.read(environment).name == Environment.prod */ false)
        await showDialogPassword(context: context, ref: ref, dissmissable: false);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listRoute = [
      CyclesRoute(),
      HistoriqueRoute(),
      AccountRoute(),
    ];

    return Builder(builder: (context) {
      final listMenu = [
        {
          "title": "Cycles",
          "icon": Icons.radio_button_checked,
          "id": 0,
        },
        {
          "title": AppLocalizations.of(context)!.history,
          "icon": Icons.assessment_outlined,
          "id": 1,
        },
        {
          "title": AppLocalizations.of(context)!.reglages,
          "icon": Icons.settings,
          "id": 2,
        },
      ];
      return InitNotifications(
        child: CheckUserConnected(
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
        ),
      );
    });
  }
}
