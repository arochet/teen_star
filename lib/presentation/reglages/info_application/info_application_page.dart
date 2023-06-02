import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:url_launcher/url_launcher.dart';

class Info_applicationPage extends StatelessWidget {
  const Info_applicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Informations',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/info_application/info_application_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            DefaultPanel(
              child: RichText(
                text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                  TextSpan(
                    text: "Cette application créée en 2020 par des médecins est :\n"
                        "-  utilisable par toute femme\n"
                        "-  spécialement adaptée aux jeunes filles pubères ou pré-pubères\n"
                        "-  utilisable hors-ligne (données internes à l'application)\n"
                        "-  confidentielle : aucun lien avec site traceur, serveur ou banque de données ; ne divulgue"
                        " AUCUNE donnée à des tiers à l'insu de l'utilisatrice *. N.B. pour une confidentialité la"
                        " plus grande possible dans la sphère numérique de ces données de santé qui sont"
                        " intimes, privilégier l’envoi des PDF des cycles via Bluetooth ou messagerie chiffrée, et"
                        " leur archivage sur un disque dur personnel plutôt qu’un Cloud.\n"
                        "-  gratuite \n*sans aucune source de revenus ! Faites-la perdurer sur les stores par un don ! Merci ! (",
                  ),
                  TextSpan(
                    text: "www.teenstar.fr",
                    style: TextStyle(color: Colors.blue),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final _url = Uri.parse('https://www.teenstar.fr');
                        if (!await launchUrl(_url)) {
                          throw 'Could not launch $_url';
                        }
                      },
                  ),
                  TextSpan(text: ", onglet \"nous aider\").\n"),
                ]),
              ),
            ),
            DefaultPanel(
              child: Column(children: [
                RichText(
                  text: TextSpan(style: Theme.of(context).textTheme.bodyMedium, children: [
                    TextSpan(text: "Fondamentaux :", style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(
                        text:
                            " Drs GD, BdN, AJ et autre, médecins et animatrices au CEPP/TeenSTAR France \n"),
                    TextSpan(
                        text: "Conception et maquette :",
                        style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: " A.J.\n"),
                    TextSpan(
                        text: "Illustrations et créations graphiques : \n",
                        style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: "Inès de Chefdebien (Paris)\n"),
                    TextSpan(text: "Contact :", style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: " app@teenstar.fr\n", style: TextStyle(color: Colors.blue)),
                    TextSpan(
                      text: "Tous droits réservés",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ]),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
