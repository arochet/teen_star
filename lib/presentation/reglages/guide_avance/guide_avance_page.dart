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
                          "L'auto-observation proposée ici est en lien avec la sécrétion de mucus produit par le col utérin (appelé aussi 'glaire cervicale'), et qui s'écoule à la vulve."
                          "Ses propriétés ont été découvertes en 1953 et étudiées de manière scientifique par 2 médecins (Professor Erik Odeblad, specialist in medical bio-physics at Umea University, Sweden ; Professor James B. Brown, professor of endocrinology, New Zealand). \n\n"),
                  TextSpan(
                      text:
                          "Il n’est pas recommandé de rechercher cette glaire à l’intérieur du vagin, ce qui aurait pour conséquence, entre autres, de fausser l’observation ou la sensation.",
                      style: styleBold)
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
                  TextSpan(text: " -> par défaut en "),
                  TextSpan(text: " BLEU ", style: styleBold),
                  TextSpan(text: "  (“eau”) =  toute présence d’humidité (SENSATION ou OBSERVATION) \n"),
                  TextSpan(text: " -> par défaut en "),
                  TextSpan(text: " JAUNE ", style: styleBold),
                  TextSpan(text: "  (“sable”) =  Sec + mucus de type non-œstrogénique \n"),
                  TextSpan(text: " -> par défaut en "),
                  TextSpan(text: " BRUN ", style: styleBold),
                  TextSpan(text: "  (“terre”) =  Sec + aucun mucus  \n"),
                  TextSpan(text: " -> par défaut en "),
                  TextSpan(text: " INCOLORE avec  un ? ", style: styleBold),
                  TextSpan(
                      text:
                          "  = doute sur l’observation ou la sensation. Ex. sensation « Non perçue »  ou mucus « Dépôt séché » (perte vaginale ou mucus séché ?) ou sélection « Autre ».  \n"),
                  TextSpan(text: " ->"),
                  TextSpan(text: " ROUGE DENSE ", style: styleBold),
                  TextSpan(text: " = saignement franc (règles ou autre) \n"),
                  TextSpan(text: " ->"),
                  TextSpan(text: " ROUGE LEGER ", style: styleBold),
                  TextSpan(text: " = saignement moins abondant (début/fin des règles ; autre) \n"),
                  TextSpan(text: " ->"),
                  TextSpan(text: " TRACES ", style: styleBold),
                  TextSpan(text: " = traces de sang, rouges ou brunes \n"),
                ]),
              )),
              _DisplayTitle(title: "4. Complément info bouton Analyser le cycle"),
              DefaultPanel(
                child: RichText(
                  text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                    TextSpan(
                        text:
                            "La colonne ANALYSE, duplication de la colonne COULEUR, permet l’interprétation manuelle du cycle en cliquant sur une ou plusieurs cases à modifier. Facultatif, laissé au discernement de l’accompagnatrice ou pour utilisatrices avancées.  \n\n"),
                    TextSpan(text: "- Fleur ", style: styleBold),
                    TextSpan(
                        text:
                            "sommet du cycle, maximum de fertilité, ovulation imminente (reconnu a posteriori le jour du tarissement de la montée fertile)\n"),
                    TextSpan(text: "- 1, 2, 3", style: styleBold),
                    TextSpan(
                        text: " : jours après sommet (ou après un épisode de changement dans le PIB) \n"),
                    TextSpan(text: "- hachures ", style: styleBold),
                    TextSpan(
                        text:
                            ": périodes infertiles (PIB pré-ovulatoire, période infertile de phase lutéale)\n"),
                    TextSpan(text: "- BLEU ", style: styleBold),
                    TextSpan(text: ": poussée œstrogénique (aboutissant ou non à un sommet)\n"),
                    TextSpan(text: "- JAUNE ", style: styleBold),
                    TextSpan(text: "Sec + opaque non élastique ou"),
                    TextSpan(text: "ou situation évoquant un profil infertile de type sécrétoire"),
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
                text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                  TextSpan(text: "Toutes les cases sont blanches avec ?", style: styleUnderline),
                  TextSpan(
                      text:
                          " car  l'utilisatrice n’arrive jamais à reconnaître les sensations (sensation « Non perçue »). Si elle se repère facilement grâce à des profils de sécrétions très caractéristiques et très francs, elle pourrait colorer les cases en fonction du mucus seul, en faisant abstraction de la sensation (tout en continuant à s’exercer à la ressentir) : BLEU pour les poussées de mucus œstrogénique, JAUNE pour mucus non œstrogénique et BRUN pour absence de mucus.\n"),
                  TextSpan(text: "Une case blanche avec ?", style: styleUnderline),
                  TextSpan(
                      text:
                          " car l'utilisatrice a enregistré « Autre » (sensation ou observation). L'échange avec l’accompagnatrice permettra de préciser la nature de cette \"autre\" situation et de colorer la case en conséquence. De même lors de « Dépôt séché », pour éventuellement distinguer des sécrétions vaginales d’une sécrétion de glaire cervicale de tel ou tel type.\n"),
                  TextSpan(text: "PIB pré-ovulatoire et hachurage", style: styleUnderline),
                  TextSpan(
                      text:
                          " l’utilisatrice avancée en auto-observation peut arriver à repérer son PIB. Rappel : PIB = Profil Infertile de Base = séquence non changeante jour après jour en pré-ovulatoire (sensation et aspect visuel qui restent identiques, témoignant de l’inactivité du col)"),
                  TextSpan(
                      text: "Il peut être de type :\n"
                          "- non sécrétoire  sec + aucun mucus (cases brunes, à hachurer)\n"
                          "- sécrétoire  sec + mucus opaque (cases jaunes, à hachurer) ou sensation d’humidité + mucus opaque (cases bleues par défaut, qu’elle pourra colorer en jaune, et hachurer).\n"
                          "N.B. Cas d’un PIB  sec + dépôt séché (cases blanches avec ?)\n"
                          "a) Le dépôt séché est identifié clairement comme "
                          "glaire cervicale séchée à cases blanches à colorer en jaune et hachurer"
                          "pertes vaginales séchées (sans glaire cervicale) à cases blanches à colorer en brun et hachurer\n"
                          "b) Le dépôt n’est pas identifié clairement à laisser blanc, enlever le ? et hachurer "),
                ]),
              )),
              _DisplayTitle(title: "5. Onglet Historique "),
              DefaultPanel(
                  child: RichText(
                text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                  TextSpan(
                      text:
                          "Récapitule les colonnes ANALYSE (ou COULEUR, par défaut) de chacun des cycles. Cliquer sur le numéro du cycle pour accéder à son Résumé et pouvoir le (ré)analyser si besoin."
                          "Un cycle n de plus de 35 jours s’affichera en plusieurs colonnes de 35 jours, de gauche à droite :  ..., n.3, n.2, n.1."
                          " \n\n"),
                  TextSpan(text: "Le bouton"),
                  TextSpan(text: " Renvoi vers cycle précédent ", style: styleBlue),
                  TextSpan(
                      text:
                          " permet d'annuler la création par erreur d'un nouveau cycle, par ex. lors d'un saignement qui avait été confondu avec des règles.  "),
                ]),
              )),
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
