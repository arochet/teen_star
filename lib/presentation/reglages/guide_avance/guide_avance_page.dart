import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/cycle/shared/icon_observation.dart';
import 'package:teenstar/PRESENTATION/reglages/account/widget/diplay_title.dart';
import 'package:flutter/services.dart' show rootBundle;

class Guide_avancePage extends StatelessWidget {
  const Guide_avancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleBold = Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);
    final styleBoldItalic = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
    final styleUnderline =
        Theme.of(context).textTheme.bodyMedium!.copyWith(decoration: TextDecoration.underline);
    final styleBlue = Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.blue);
    return MainScaffold(
      title: 'Guide Avancé',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/guide_avance/guide_avance_page.dart',
        child: Padding(
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
              future: rootBundle.loadString('assets/html/guide_avance_en.html'),
              builder: (context, async) {
                if (async.hasData) {
                  return SingleChildScrollView(
                      child: HtmlWidget(
                    async.data.toString(),
                  ));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ) /* ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image(
                    width: 30,
                    height: 30,
                    image: AssetImage(AssetsPath.icon_principe_de_base),
                  ),
                ),
              ),
              _DisplayTitle(title: "1. Bases scientifiques"),
              DefaultPanel(
                  child: RichText(
                text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                  TextSpan(
                      text:
                          "L'auto-observation proposée ici est en lien avec la sécrétion de mucus produit par le col utérin (appelé aussi 'glaire cervicale'), et qui s'écoule à la vulve."
                          "Ses propriétés ont été découvertes en 1953 et étudiées de manière scientifique par 2 médecins (Professor Erik Odeblad, specialist in medical bio-physics at Umea University, Sweden ; Professor James B. Brown, professor of endocrinology, New Zealand). \n\n"),
                  TextSpan(
                      text:
                          "Il n’est pas recommandé de rechercher cette glaire à l’intérieur du vagin, ce qui aurait pour conséquence, entre autres, de fausser l’observation ou la sensation.",
                      style: styleBold)
                ]),
              )),
              _DisplayTitle(title: "2. Observation du mucus"),
              DefaultPanel(
                  child: Column(
                children: [
                  Line(1, AssetsPath.icon_mucus_visible, "Aucun mucus observé", ""),
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
                    "Mucus de type œstrogénique, qui peut être en partie blanc (du blanc mélangé à du transparents). Franchement élastique",
                  ),
                  Line(
                    5,
                    AssetsPath.icon_mucus_transparent_filant,
                    "Transparent ; filant (≈ blanc d’œuf) ou très fluide (≈ eau)",
                    "Mucus filant, complètement transparent, qui peut même s’écouler comme un ruban d’eau à la vulve.",
                  ),
                  LineDE_FDP(),
                  Line(
                    6,
                    AssetsPath.icon_mucus_depot_seche_blanc,
                    "Dépôt séché, blanc ou jaune",
                    "Dépôt sec dans le sous-vêtement, en grande ou faible quantité. Peut correspondre à de simples pertes vaginales, mais aussi à du mucus séché, raison pour laquelle elle est considérée par défaut comme un mucus observé, jusqu’à éventuelle preuve du contraire après discussion avec l’accompagnatrice (N.B. la distinction entre les 2 est difficile).",
                  ),
                  Line(7, AssetsPath.icon_autre, "Autre\nobservation",
                      "En cas de doute sur l’observation, ou pour toute observation inhabituelle, qui pourrait être autre chose que du mucus, voire traduire une infection (sexuellement transmissible ou non)"),
                ],
              )),
              _DisplayTitle(title: "3.  Onglets cycles (tableau récapitulatif, résumé du cycle)"),
              DefaultPanel(
                  child: RichText(
                text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                  TextSpan(text: "Les couleurs dans la 3e colonne, automatiques selon la combinaison "),
                  TextSpan(text: "sensation à la vulve + observation", style: styleUnderline),
                  TextSpan(text: " choisie, sont appliquées "),
                  TextSpan(
                      text: " par défaut en attendant l’interprétation manuelle du cycle. \n",
                      style: styleBold),
                  TextSpan(text: " -> par défaut en "),
                  TextSpan(text: " BLEU ", style: styleBold),
                  TextSpan(
                      text: "  (“couleur eau”) =  toute présence d’humidité (SENSATION ou OBSERVATION) \n"),
                  TextSpan(text: " -> par défaut en "),
                  TextSpan(text: " JAUNE ", style: styleBold),
                  TextSpan(text: "  (“couleur sable”) =  Sec + mucus de type non-œstrogénique \n"),
                  TextSpan(text: " -> par défaut en "),
                  TextSpan(text: " BRUN ", style: styleBold),
                  TextSpan(text: "  (“couleur terre”) =  Sec + aucun mucus  \n"),
                  TextSpan(text: " -> par défaut en "),
                  TextSpan(text: " INCOLORE", style: styleBold),
                  TextSpan(text: " = autres situations\n ->"),
                  TextSpan(text: " Avec  un ? ", style: styleBold),
                  TextSpan(text: "  = sensation ou observation «Autre».  \n"),
                  TextSpan(text: " ->"),
                  TextSpan(text: " ROUGE DENSE ", style: styleBold),
                  TextSpan(text: " = saignement franc (règles ou autre) \n"),
                  TextSpan(text: " ->"),
                  TextSpan(text: " ROUGE FONCE ", style: styleBold),
                  TextSpan(text: " = saignement moins abondant (début/fin des règles ; autre) \n"),
                  TextSpan(text: " ->"),
                  TextSpan(text: " ROUGE PÂLE ", style: styleBold),
                  TextSpan(text: " = traces de sang, rouges ou brunes \n"),
                ]),
              )),
              _DisplayTitle(title: "4. Analyser le cycle"),
              DefaultPanel(
                child: RichText(
                  text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                    TextSpan(
                        text:
                            "La colonne ANALYSE, duplication de la colonne COULEUR, permet l’interprétation manuelle du cycle en cliquant sur une ou plusieurs cases à modifier."),
                    TextSpan(text: " Facultatif", style: styleBold),
                    TextSpan(
                        text:
                            ", laissé au discernement de l’accompagnatrice ou pour utilisatrices avancées.  \n\n"),
                    TextSpan(text: "- Fleur ", style: styleBold),
                    TextSpan(
                        text:
                            "sommet du cycle, maximum de fertilité, ovulation imminente (reconnu a posteriori le jour du tarissement de la montée fertile du mucus)\n"),
                    TextSpan(text: "- 1, 2, 3", style: styleBold),
                    TextSpan(
                        text: " : jours après sommet (ou après un épisode de changement dans le PIB) \n"),
                    TextSpan(text: "- hachures ", style: styleBold),
                    TextSpan(
                        text:
                            ": périodes infertiles (PIB pré-ovulatoire; période infertile de phase lutéale)\n"),
                    TextSpan(text: "- BLEU ", style: styleBold),
                    TextSpan(text: ": poussée œstrogénique (aboutissant ou non à un sommet)\n"),
                    TextSpan(text: "- JAUNE ", style: styleBold),
                    TextSpan(text: "Sec + opaque non élastique "),
                    TextSpan(text: "ou", style: styleUnderline),
                    TextSpan(
                        text: " situation évoquant un profil infertile de type sécrétoire", style: styleBold),
                    TextSpan(text: "(voir \"cas particuliers\")\n"),
                    TextSpan(text: "- BRUN ", style: styleBold),
                    TextSpan(text: "Sec + aucun mucus"),
                    TextSpan(
                        text: " ou situation évoquant un profil infertile de type non sécrétoire",
                        style: styleBold),
                  ]),
                ),
              ),
              _DisplayTitle(title: "CAS PARTICULIERS"),
              DefaultPanel(
                  child: RichText(
                text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                  TextSpan(text: "Nombreuses cases incolores ", style: styleUnderline),
                  TextSpan(
                      text:
                          " car  l'utilisatrice n’arrive jamais à reconnaître les sensations (sensation « Non perçue »). Si elle se repère facilement grâce à des profils de sécrétions très caractéristiques et très francs, elle pourrait colorer les cases en fonction du mucus seul, en faisant abstraction de la sensation (tout en continuant à s’exercer à la ressentir) : BLEU pour les poussées de mucus œstrogénique, JAUNE pour mucus non œstrogénique et BRUN pour absence de mucus.\n\n"),
                  TextSpan(text: "Une case avec ?", style: styleUnderline),
                  TextSpan(
                      text:
                          " car l'utilisatrice a enregistré « Autre » (sensation ou observation). L'échange avec l’accompagnatrice permettra de préciser la nature de cette \"autre\" situation et de colorer la case en conséquence. De même lors de « Dépôt séché », pour éventuellement distinguer des sécrétions vaginales d’une sécrétion de mucus cervical de tel ou tel type.\n\n"),
                  TextSpan(text: "PIB pré-ovulatoire et hachurage", style: styleUnderline),
                  TextSpan(
                      text:
                          " l’utilisatrice avancée en auto-observation peut arriver à repérer son PIB. Rappel : PIB = Profil Infertile de Base = séquence non changeante jour après jour en pré-ovulatoire (sensation et aspect visuel qui restent identiques, témoignant de l’inactivité du col)\n"),
                  TextSpan(text: "Il peut être de type :\n\n"),
                  TextSpan(text: "- non sécrétoire:", style: styleUnderline),
                  TextSpan(text: " sec + aucun mucus ", style: styleBoldItalic),
                  TextSpan(text: " (cases brunes, à hachurer)\n\n"),
                  TextSpan(text: "- sécrétoire: ", style: styleUnderline),
                  TextSpan(text: " sec + mucus opaque ", style: styleBoldItalic),
                  TextSpan(text: " (cases jaunes, à hachurer) "),
                  TextSpan(text: "ou", style: styleUnderline),
                  TextSpan(text: " sensation "),
                  TextSpan(text: "d’humidité + mucus opaque", style: styleBoldItalic),
                  TextSpan(
                      text: " (cases bleues par défaut, qu’elle pourra colorer en jaune, et hachurer).\n"),
                  TextSpan(text: "N.B. Cas d’un PIB "),
                  TextSpan(text: "sec + dépôt séché", style: styleBoldItalic),
                  TextSpan(text: ""),
                  TextSpan(text: ""),
                  TextSpan(
                      text: " (cases incolores)\n\n"
                          "a) Le dépôt séché est identifié clairement comme : \n"
                          " - mucus séchée → cases incolores à colorer en jaune et hachurer\n"
                          " - pertes vaginales séchées (sans mucus) → cases incolores à colorer en brun et hachurer\n\n"
                          "b) Le dépôt n’est pas identifié clairement → à laisser incolore et hachurer \n"),
                ]),
              )),
              _DisplayTitle(title: "5. Onglet Historique "),
              DefaultPanel(
                  child: RichText(
                text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                  TextSpan(
                      text:
                          "Récapitule les colonnes ANALYSE de chacun des cycles. Cliquer sur le numéro du cycle pour accéder à son Résumé et pouvoir le (ré)analyser si besoin."
                          " \n\n"),
                  TextSpan(text: "Le bouton"),
                  TextSpan(text: " Renvoi vers cycle précédent ", style: styleBlue),
                  TextSpan(
                      text:
                          " permet d'annuler la création par erreur d'un nouveau cycle, par ex. lors d'un saignement qui avait été confondu avec des règles.  "),
                ]),
              )),
            ],
          ), */
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
            Text(" $num ", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(width: 5),
            if (iconPath != null)
              IconObservation(
                iconPath: iconPath!,
                iconSize: 30,
              ),
            if (iconPath == null) SizedBox(width: 30),
            SizedBox(width: 5),
            Expanded(
              child: Text(titre1, style: Theme.of(context).textTheme.bodyMedium),
            ),
            Expanded(
              flex: 2,
              child: Text(titre2, style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}

class LineDE_FDP extends StatelessWidget {
  const LineDE_FDP({Key? key}) : super(key: key);

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
            SizedBox(width: 5),
            Expanded(
              child: Text(
                  'Les mucus 3 à 5 évoquent une imprégnation œstrogénique dominante (débutante ou établie) :\n'
                  ' - poussée œstrogénique pré-ovulatoire, avec ou sans montée vers une ovulation\n'
                  ' - épisode de dominance œstrogénique en post-ovulatoire (parfois observée en milieu ou fin de phase lutéale)',
                  style: Theme.of(context).textTheme.bodyMedium),
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
      child:
          Text(title, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: actioncolor['primary'])),
    );
  }
}
