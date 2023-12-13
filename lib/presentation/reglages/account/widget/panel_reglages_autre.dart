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
          title: AppLocalizations.of(context)!.basic_guide,
          icon: Icons.library_books,
          onTap: () {
            context.router.push(Principes_de_baseRoute());
          },
        ),
        ItemPanelList(
          title: AppLocalizations.of(context)!.advanced_guide,
          icon: Icons.account_balance,
          onTap: () {
            context.router.push(Guide_avanceRoute());
          },
        ),
        /* ItemPanelList(
          title: 'Notification de rappel',
          icon: Icons.notifications,
          onTap: () {},
          enable: false,
        ), */
        /* ItemPanelList(
          title: 'Lire mes notes confidentielles',
          icon: Icons.mail_rounded,
          onTap: () {},
          enable: false,
        ), */
        ItemPanelList(
          title: AppLocalizations.of(context)!.app_info,
          icon: Icons.info,
          onTap: () => context.router.push(Info_applicationRoute()),
        ),
        ItemPanelList(
          title: 'Notifications',
          icon: Icons.notifications,
          onTap: () => context.router.push(NotificationsRoute()),
        ),
      ],
    );
  }
}
