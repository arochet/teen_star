import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Info_applicationPage extends StatelessWidget {
  const Info_applicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Info Application',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/info_application/info_application_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text("TeenSTAR - Application de test", style: Theme.of(context).textTheme.headline4),
          ),
        ),
      ),
    );
  }
}
