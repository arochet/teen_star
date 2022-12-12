import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoriquePage extends ConsumerWidget {
  const HistoriquePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: './lib/PRESENTATION/historique/historique_page.dart',
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: ElevatedButton(
            onPressed: () async {},
            child: Text("--"),
            style: buttonNormalPrimary,
          ),
        ),
      ),
    );
  }
}
