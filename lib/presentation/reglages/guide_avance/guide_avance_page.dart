import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/cycle/shared/icon_observation.dart';
import 'package:teenstar/PRESENTATION/reglages/account/widget/diplay_title.dart';

class Guide_avancePage extends StatelessWidget {
  const Guide_avancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleBold = Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold);
    final styleUnderline =
        Theme.of(context).textTheme.bodyText1!.copyWith(decoration: TextDecoration.underline);
    final styleBlue = Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue);
    return MainScaffold(
      title: 'Guide Avancé',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/guide_avance/guide_avance_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              _DisplayTitle(title: "1. Bases scientifiques"),
              DefaultPanel(
                  child: RichText(
                text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                  TextSpan(
                      text:
                          "L'auto-observation proposée ici est en lien avec la sécrétion de mucus produit par le col utérin (appelé aussi 'glaire cervicale') qui s'écoule à la vulve."
                          "Ses propriétés ont été découvertes en 1953 et étudiées de manière scientifique par 2 médecins (Professor Erik Odeblad, specialist in medical bio-physics at Umea University, Sweden ; Professor James B. Brown, professor of endocrinology, New Zealand). \n\n"),
                  TextSpan(
                      text:
                          "Il n’est pas recommandé de rechercher cette glaire à l’intérieur du vagin, ce qui aurait pour conséquence, entre autres, de fausser l’observation ou la sensation.")
                ]),
              )),
              _DisplayTitle(title: "2. Complément info Observation du mucus"),
              DefaultPanel(
                  child: Column(
                children: [
                  Line(1, AssetsPath.icon_vide, "Aucun mucus observé", ""),
                  Line(
                      2,
                      AssetsPath.icon_mucus_opaque_blanc_jaune,
                      "Opaque blanc ou jaune ; épais, pâteux ou grumeleux ; collant (non étirable) ",
                      "Mucus de type non oestrogénique"),
                  Line(
                    3,
                    AssetsPath.icon_mucus_opaque_transparent,
                    "Opaque avec transparent ; un peu étirable",
                    "Mucus de type intermédiaire, ni franchement opaque collant ni franchement de type œstrogénique. Correspond la plupart du temps à un début de changement lors d’une poussée œstrogénique, mais peut aussi apparaître d’emblée, sans observation autre au préalable.",
                  ),
                  Line(
                    4,
                    AssetsPath.icon_mucus_nuageux,
                    "Nuageux (blanc) à transparent",
                    "Mucus de type œstrogénique, qui peut être en partie blanc. Franchement élastique",
                  ),
                  Line(
                    5,
                    AssetsPath.icon_mucus_transparent_filant,
                    "Transparent ; filant (≈ blanc d’œuf) ou très fluide (≈ eau)",
                    "Mucus filant, complètement transparent, qui peut même s’écouler comme un ruban d’eau à la vulve.",
                  ),
                  Line(
                    6,
                    AssetsPath.icon_mucus_depot_seche_blanc,
                    "Dépôt séché, blanc ou jaune",
                    "Dépôt sec dans le sous-vêtement, en grande ou faible quantité. Peut correspondre à de simples pertes vaginales, mais aussi à de la glaire séchée, raison pour laquelle elle est considérée par défaut comme un mucus observé, jusqu’à éventuelle preuve du contraire après discussion avec l’accompagnatrice (N.B. la distinction entre les 2 est difficile).",
                  ),
                  Line(7, null, "Autre observation",
                      "En cas de doute sur l’observation, ou pour toute observation inhabituelle, qui pourrait être autre chose que de la glaire, voire traduire une infection (sexuellement transmissible ou non)"),
                ],
              )),
              _DisplayTitle(title: "3. Complément info  Résumé du cycle"),
              DefaultPanel(
                  child: RichText(
                text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                  TextSpan(text: "Les couleurs dans la 3e colonne, automatiques selon la combinaison "),
                  TextSpan(text: "sensation à la vulve + observation", style: styleUnderline),
                  TextSpan(text: " choisie, sont appliquées "),
                  TextSpan(
                      text: " par défaut en attendant l’interprétation manuelle du cycle ", style: styleBold),
                  TextSpan(text: " (bouton "),
                  TextSpan(text: " Analyser le cycle ", style: styleBlue),
                  TextSpan(text: " ) : \n\n"),
                ]),
              )),
              _DisplayTitle(title: "4. Complément info onglet (Résumé)"),
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
              _DisplayTitle(title: "5. Complément info onglet (Analyse)"),
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
              _DisplayTitle(title: "6. Complément info onglet (Historique)"),
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
              _DisplayTitle(title: "7. Sécurité / Protection des données"),
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

class Line extends StatelessWidget {
  final int num;
  final String? iconPath;
  final String titre1;
  final String titre2;
  const Line(this.num, this.iconPath, this.titre1, this.titre2, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(" $num ", style: Theme.of(context).textTheme.bodyText1),
            SizedBox(width: 5),
            if (iconPath != null)
              IconObservation(
                iconPath: iconPath!,
                iconSize: 30,
              ),
            if (iconPath == null) SizedBox(width: 30),
            SizedBox(width: 5),
            Expanded(
              child: Text(titre1, style: Theme.of(context).textTheme.bodyText1),
            ),
            Expanded(
              flex: 2,
              child: Text(titre2, style: Theme.of(context).textTheme.bodyText1),
            ),
          ],
        ),
      ),
    );
  }
}

class _DisplayTitle extends StatelessWidget {
  final String title;
  const _DisplayTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Text(title, style: Theme.of(context).textTheme.headline5!.copyWith(color: colorpanel(50))),
    );
  }
}
