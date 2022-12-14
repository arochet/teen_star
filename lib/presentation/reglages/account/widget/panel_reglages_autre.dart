import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:flutter/material.dart';
import 'panel_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PanelReglagesAutre extends StatelessWidget {
  const PanelReglagesAutre({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelList(
      title: 'Panel Reglages Autre',
      list: [
        ItemPanelList(
          title: 'Principes d\'utilisation',
          icon: Icons.account_circle_rounded,
          onTap: () {
            context.router.push(Condition_utilisationRoute(doitEtreAccepte: false));
          },
        ),
        ItemPanelList(
          title: 'Guide avancé',
          icon: Icons.mail_rounded,
          onTap: () {
            context.router.push(Guide_avanceRoute());
          },
        ),
        ItemPanelList(
          title: 'Notification de rappel',
          icon: Icons.mail_rounded,
          onTap: () {},
          enable: false,
        ),
        ItemPanelList(
          title: 'Lire mes notes confidentielles',
          icon: Icons.mail_rounded,
          onTap: () {},
        ),
        ItemPanelList(
          title: 'Info sur l\'application',
          icon: Icons.mail_rounded,
          onTap: () => context.router.push(Info_applicationRoute()),
        ),
      ],
    );
  }
}
