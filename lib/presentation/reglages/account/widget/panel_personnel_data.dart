import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_form.dart';
import 'panel_list.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PanelPersonnelData extends StatelessWidget {
  UserData? userData;
  LanguageApp languageApp;

  PanelPersonnelData(
    this.userData,
    this.languageApp, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelList(
      title: 'PanelPersonnelData',
      list: [
        ItemPanelList(
          title: '${AppLocalizations.of(context)!.username} : ${userData?.userName.getOrCrash() ?? '--'}',
          icon: Icons.account_circle_rounded,
        ),
        ItemPanelList(
          title:
              '${AppLocalizations.of(context)!.year_of_first_period}: ${userData?.anneePremiereRegle ?? '--'}',
          icon: Icons.local_florist,
        ),
        ItemPanelList(
          title:
              '${AppLocalizations.of(context)!.date_of_birth}: ${AppDateUtils.formatDate(userData?.dateNaissance, 'dd.MM.yyyy')}',
          icon: Icons.child_friendly,
        ),
        ItemPanelList(
          title: '${AppLocalizations.of(context)!.language}: ${languageApp.name}',
          icon: Icons.flag,
        ),
        ItemPanelList(
          title:
              '${AppLocalizations.of(context)!.theme}: ${ThemeAppExtension.fromIndex(userData?.theme).name(context)}',
          icon: Icons.palette,
        ),
      ],
      //Bouton modifier
      button: ElevatedButton(
        onPressed: () {
          context.router.push(ModifyAccountRoute());
        },
        style: buttonPrimaryHide,
        child: Text(AppLocalizations.of(context)!.modifier),
      ),
    );
  }
}
