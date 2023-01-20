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

class LanguePage extends StatelessWidget {
  const LanguePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Langue',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/langue/langue_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Container(
              width: 280,
              child: Column(
                children: [
                  Expanded(child: Container()),
                  //CHOIX DES LANGUES
                  _ChoixLangue("Français", true),
                  SpaceH10(),
                  _ChoixLangue("English (Not available yet)", false),
                  SpaceH40(),
                  SpaceH40(),
                  //BOUTON VALIDATON
                  ElevatedButton(
                    onPressed: () {
                      context.router.push(Condition_utilisationRoute());
                    },
                    child: Text("Continuer"),
                    style: buttonNormalPrimary,
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChoixLangue extends StatelessWidget {
  String langue;
  bool enable;
  _ChoixLangue(
    this.langue,
    this.enable, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(enable ? Icons.check_box : Icons.check_box_outline_blank,
            color: enable ? colorpanel(50) : colorpanel(600)),
        SizedBox(width: 10),
        Flexible(
          child: Text(
            langue,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: enable ? colorpanel(50) : colorpanel(600)),
          ),
        ),
      ],
    );
  }
}
