import 'package:flutter/material.dart';

import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';

import 'widget/bouton_PDF.dart';

class Guide_de_basePage extends StatelessWidget {
  const Guide_de_basePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleBold = Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);
    final styleUnderline =
        Theme.of(context).textTheme.bodyMedium!.copyWith(decoration: TextDecoration.underline);
    final styleBlue = Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.blue);
    return MainScaffold(
      title: 'Guide de base',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/principes_de_base/guide_de_base_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            DefaultPanel(
                child: RichText(
              text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                TextSpan(text: "«  Mon corps c’est moi, j’écoute ce qu’il me dit ». ", style: styleBold),
                TextSpan(text: "Mieux le connaître, c’est découvrir la merveille que je suis !")
              ]),
            )),
            _DisplayTitle(title: "Objectifs"),
            DefaultPanel(
                child: RichText(
              text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                TextSpan(
                    text:
                        "Faciliter vos enregistrements quotidiens afin d'apprendre l’auto-observation pour découvrir votre fertilité et vos cycles (mise en place progressive du cycle à partir de la puberté, profil personnel des signes de fertilité, période de l’ovulation, date prévisible des prochaines règles, variation d’humeur et de forme physique en lien avec les changements hormonaux, impact de certains évènements sur le déroulement du cycle, anomalies éventuelles, ...).")
              ]),
            )),
            _DisplayTitle(title: "Comment s'observer"),
            DefaultPanel(
                child: RichText(
              text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                TextSpan(text: "Ce que je sens à la vulve sans regarder", style: styleUnderline),
                TextSpan(
                    text:
                        "(SENSATION) : pendant mes activités quotidiennes (marche, escaliers, …) ou en contractant/relâchant plusieurs fois le périnée (exercice de Kegel).\n\n"),
                TextSpan(text: "Ce que je vois ", style: styleUnderline),
                TextSpan(
                    text:
                        "(OBSERVATION) : ce qui s’écoule de la vulve, sur le sous-vêtement, aux toilettes, sur le papier toilette (que je peux replier /déplier pour évaluer l’élasticité d’une éventuelle sécrétion). "),
                TextSpan(text: "Ne rien rechercher à l’intérieur du vagin \n\n", style: styleBold),
                TextSpan(
                    text:
                        "Attention : en cas de pertes anormales (sales ou malodorantes) et/ou douleur, démangeaisons, petites plaies proches de la vulve, etc., consulter un médecin afin de ne pas méconnaître une infection (sexuellement transmissible ou autre) qui doit être soignée très rapidement."),
              ]),
            )),
            _DisplayTitle(title: "Comment noter"),
            DefaultPanel(
                child: RichText(
              text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                TextSpan(text: "Sélectionner "),
                TextSpan(text: "Débuter un nouveau cycle ", style: styleBlue),
                TextSpan(text: "dès le 1er jour des règles, sinon continuer le cycle en cours. \n\n"),
                TextSpan(text: "Observations de la journée ", style: styleBlue),
                TextSpan(text: "enregistrer "),
                TextSpan(text: "LE SOIR le signe le plus fertile de la journée ", style: styleBold),
                TextSpan(
                    text: "(SENSATION et OBSERVATION).\n\n"
                        "Parmi les NOTES possibles, #1 et #2 sont deux types d'évènements de votre choix toujours les "
                        "mêmes et --> correspond à voyage ou horaires inhabituels (décalage horaire, coucher tardif,"
                        "travail de nuit, ...). "),
              ]),
            )),
            _DisplayTitle(title: "Synthèse du cycle"),
            DefaultPanel(
                child: RichText(
              text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                TextSpan(text: "L’onglet "),
                TextSpan(text: "Cycle ", style: styleBlue),
                TextSpan(text: "récapitule le cycle, en y ajoutant des couleurs par défaut, mais qui "),
                TextSpan(
                    text:
                        "ne correspondent PAS à un repérage des périodes fertiles ou infertiles du cycle.\n\n",
                    style: styleBold),
                TextSpan(text: "Le bouton "),
                TextSpan(text: "Analyser le cycle ", style: styleBlue),
                TextSpan(
                  text:
                      "permet, avec l’aide de votre accompagnatrice, d'interpréter manuellement le cycle (cf Guide avancé § 4). ",
                ),
              ]),
            )),
            _DisplayTitle(title: "Conservation des enregistrements"),
            DefaultPanel(
                child: RichText(
              text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                TextSpan(text: "Les données ne figurent que sur votre appareil "),
                TextSpan(text: "(portable perdu = données perdues).\n\n", style: styleBold),
                TextSpan(
                    text:
                        "Conseil : exportez régulièrement vos cycles en PDF pour l’archivage sur un ordinateur (utile plus tard ou en cas de consultation médicale), l’impression sur papier ou l'envoi à votre accompagnatrice. \n\n"),
                TextSpan(text: "Les PDF sont protégés par votre mot de passe. "),
                TextSpan(text: "Attention ", style: styleUnderline),
                TextSpan(
                    text:
                        " : si vous l'oubliez, vous pourrez en choisir un nouveau pour les PDF à venir, mais ne pourrez plus lire les fichiers "),
                TextSpan(text: "déjà ", style: styleUnderline),
                TextSpan(text: "exportés.\n\n"),
                TextSpan(
                    text: "Conditions d'utilisation : J’ai lu les points ci-dessus et j’ai "
                        "compris que cette application m’aidera à enregistrer mes observations quotidiennes au cours "
                        "des cycles menstruels, mais ne peut absolument pas me suffire telle quelle pour éviter (ou "
                        "favoriser) une grossesse. Je comprends que si tel était mon objectif, je devrais impérativement "
                        "suivre une formation approfondie avec une monitrice spécialisée en méthode naturelle de "
                        "régulation des naissances. "),
              ]),
            )),
            SpaceH20(),

            //BOUTON PDF
            BoutonPDF(),
            SizedBox(height: 30),
          ]),
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
      child: Text(title, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
