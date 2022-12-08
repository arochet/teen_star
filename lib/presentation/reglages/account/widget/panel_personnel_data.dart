import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:flutter/material.dart';
import 'panel_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PanelPersonnelData extends StatelessWidget {
  const PanelPersonnelData({
    Key? key,
    required this.nameUser,
    required this.email,
    required this.typeAccount,
  }) : super(key: key);

  final String nameUser;
  final String? email;
  final TypeAccountState typeAccount;

  @override
  Widget build(BuildContext context) {
    String typeAc = "";
    switch (typeAccount) {
      case TypeAccountState.google:
        typeAc = AppLocalizations.of(context)!.connecteeavecgoogle;
        break;
      default:
        typeAc = "";
        break;
    }
    return PanelList(
      title: 'PanelPersonnelData',
      list: [
        ItemPanelList(
          title: 'Pseudo : $nameUser',
          icon: Icons.account_circle_rounded,
          onTap: () {},
        ),
        ItemPanelList(
          title: 'Année des 1ères règles: 2013',
          icon: Icons.mail_rounded,
          onTap: () {},
        ),
        ItemPanelList(
          title: 'Date de naissance: 2013',
          icon: Icons.mail_rounded,
          onTap: () {},
        ),
        ItemPanelList(
          title: 'Langue: Français',
          icon: Icons.mail_rounded,
          onTap: () {},
        ),
        ItemPanelList(
          title: 'Thème: Bleu',
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
