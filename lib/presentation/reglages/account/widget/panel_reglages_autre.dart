import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:flutter/material.dart';
import 'panel_list.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PanelReglagesAutre extends StatelessWidget {
  const PanelReglagesAutre({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelList(
      title: 'PanelReglagesAutre',
      list: [
        ItemPanelList(
          title: AppLocalizations.of(context)!.basic_guide,
          icon: Icons.library_books,
          onTap: () {
            context.router.push(Guide_de_baseRoute());
          },
        ),
        ItemPanelList(
          title: AppLocalizations.of(context)!.advanced_guide,
          icon: Icons.account_balance,
          onTap: () {
            context.router.push(Guide_avanceRoute());
          },
        ),
        ItemPanelList(
          title: AppLocalizations.of(context)!.app_info,
          icon: Icons.info,
          onTap: () => context.router.push(Info_applicationRoute()),
        ),
        ItemPanelList(
          title: AppLocalizations.of(context)!.notification,
          icon: Icons.notifications,
          onTap: () => context.router.push(NotificationsRoute()),
        ),
      ],
    );
  }
}
