import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/reglages/account/widget/diplay_title.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Guide_avancePage extends StatelessWidget {
  const Guide_avancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Guide Avancé',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/guide_avance/guide_avance_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              DisplayTitle(title: "1. Bases scientifiques"),
              DefaultPanel(
                  child: RichText(
                text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                  TextSpan(
                      text:
                          "L'auto-observation proposée ici est en lien avec la sécrétion de mucus produit par le col utérin (appelé aussi 'glaire cervicale') qui s'écoule à la vulve."
                          "Ses propriétés ont été découvertes en 1953... [A complété]")
                ]),
              )),
              DisplayTitle(title: "2. Complément info onglet (Calendrier)"),
              DefaultPanel(
                  child: RichText(
                text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                  TextSpan(
                      text:
                          "Si après un certain temps, l'utilisatrice réalise qu'elle avait démarré un nouveau cycle par erreur ...")
                ]),
              )),
              DisplayTitle(title: "3. Complément info onglet (Sensation/Observation)"),
              DefaultPanel(
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Icon", style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(
                        child: Text("Explication", style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Icon", style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(
                        child: Text("Explication", style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                ]),
              ),
              DisplayTitle(title: "4. Complément info onglet (Résumé)"),
              DefaultPanel(
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Icon", style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(
                        child: Text("Explication", style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Icon", style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(
                        child: Text("Explication", style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                ]),
              ),
              DisplayTitle(title: "5. Complément info onglet (Analyse)"),
              DefaultPanel(
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Icon", style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(
                        child: Text("Explication", style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Icon", style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(
                        child: Text("Explication", style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                ]),
              ),
              DisplayTitle(title: "6. Complément info onglet (Historique)"),
              DefaultPanel(
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Icon", style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(
                        child: Text("Explication", style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Icon", style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(
                        child: Text("Explication", style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                ]),
              ),
              DisplayTitle(title: "7. Sécurité / Protection des données"),
              DefaultPanel(
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Icon", style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(
                        child: Text("Explication", style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Icon", style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Expanded(
                        child: Text("Explication", style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
