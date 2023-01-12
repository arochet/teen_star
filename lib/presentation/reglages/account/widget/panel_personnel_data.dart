import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';
import 'panel_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PanelPersonnelData extends StatelessWidget {
  UserData? userData;

  PanelPersonnelData(
    this.userData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelList(
      title: 'PanelPersonnelData',
      list: [
        ItemPanelList(
          title: 'Pseudo : ${userData?.userName.getOrCrash() ?? '--'}',
          icon: Icons.account_circle_rounded,
          onTap: () {},
        ),
        ItemPanelList(
          title: 'Année des 1ères règles: ${userData?.anneePremiereRegle ?? '--'}',
          icon: Icons.star_border,
          onTap: () {},
        ),
        ItemPanelList(
          title: 'Date de naissance: ${AppDateUtils.formatDate(userData?.dateNaissance)}',
          icon: Icons.mail_rounded,
          onTap: () {},
        ),
        ItemPanelList(
          title: 'Langue: Français',
          icon: Icons.mail_rounded,
          onTap: () {},
        ),
        ItemPanelList(
          title: 'Thème: Clair',
          icon: Icons.mail_rounded,
          onTap: () {},
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
