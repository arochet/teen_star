import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/providers.dart';

import '../../../core/_core/router.gr.dart';
import 'panel_list.dart';

class PanelDevelopper extends ConsumerWidget {
  const PanelDevelopper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PanelList(
      title: 'PanelDevelopper',
      list: [
        ItemPanelList(
          title: 'Components',
          icon: Icons.view_day,
          onTap: () {
            context.router.push(ComponentsRoute());
          },
        ),
        ItemPanelList(
          title: 'Couleurs',
          icon: Icons.colorize,
          onTap: () {
            context.router.push(ColorsRoute());
          },
        ),
        ItemPanelList(
          title: 'Boutons',
          icon: Icons.smart_button,
          onTap: () {
            context.router.push(ButtonsRoute());
          },
        ),
        ItemPanelList(
          title: 'Style de texte',
          icon: Icons.font_download,
          onTap: () {
            context.router.push(TextStyleRoute());
          },
        ),
        ItemPanelList(
          title: 'Utils',
          icon: Icons.settings,
          onTap: () {
            context.router.push(UtilsRoute());
          },
        ),
        ItemPanelList(
          title: 'Show Tables',
          icon: Icons.table_bar,
          onTap: () {
            ref.read(cycleRepositoryProvider).showTables();
          },
        ),
      ],
    );
  }
}
