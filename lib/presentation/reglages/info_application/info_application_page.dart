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
                text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                  TextSpan(
                    text: "Cette application créée en 2020 par des médecins est :\n"
                        "-  utilisable par toute femme\n"
                        "-  spécialement adaptée aux jeunes filles\n"
                        "-  confidentielle : aucune donnée divulguée à des tiers ; fichiers exportables chiffrés\n"
                        "-  gratuite (mais sans aucune source de revenu). Pour la faire perdurer sur le store, merci pour votre don sur ",
                  ),
                  TextSpan(
                    text: "www.teenstar.fr !",
                    style: TextStyle(color: Colors.blue),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () async {
                        final _url = Uri.parse('https://www.teenstar.fr');
                        if (!await launchUrl(_url)) {
                          throw 'Could not launch $_url';
                        }
                      },
                  ),
                ]),
              ),
            ),
            DefaultPanel(
              child: Column(children: [
                RichText(
                  text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                    TextSpan(text: "Fondamentaux :", style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(
                        text: " Drs S.P., G.D., B. de N. et A.J., animatrices au CEPP/TeenSTAR France \n"),
                    TextSpan(
                        text: "Conception et maquette :",
                        style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: " A.J.\n"),
                    TextSpan(
                        text: "Illustrations et créations graphiques : \n",
                        style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: "Inès de Chefdebien (Paris)\n"),
                    TextSpan(
                        text: "Codage et developpement :",
                        style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: "Alban Rochet\n"),
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
