import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Principes_de_basePage extends StatelessWidget {
  const Principes_de_basePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Principes de base',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/principes_de_base/principes_de_base_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            Placeholder(),
            Placeholder(),
            SpaceH20(),

            //BOUTON DE VALIDATION
            _BoutonDeValidation(),
            SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}

class _BoutonDeValidation extends StatelessWidget {
  const _BoutonDeValidation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text("PDF"),
          style: buttonPrimaryHide,
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            context.router.push(Condition_utilisationRoute());
          },
          child: Text("OK"),
          style: buttonNormalPrimary,
        ),
      ],
    );
  }
}
