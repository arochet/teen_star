import 'package:teenstar/PRESENTATION/auth/auth_connexion/auth_connexion_page.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthInitPage extends StatelessWidget {
  const AuthInitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      //Application Mobile
      return Scaffold(
        body: Container(
          width: 1050,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 76, 157, 215),
                /* Color.fromARGB(255, 39, 45, 215) */ actioncolor['primary']!,
              ],
            ),
          ),
          child: SafeArea(
            child: Container(
              width: 90,
              child: ShowEnvironment(
                  child: ShowComponentFile(title: 'auth/auth_init/auth_init.dart', child: PanelInit())),
            ),
          ),
        ),
      );
    } else {
      //Web
      return Scaffold(
        backgroundColor: colorpanel(800),
        body: ShowEnvironment(
          child: ShowComponentFile(
            title: 'auth/auth_init/auth_init.dart',
            child: Row(
              children: [
                Expanded(child: PanelInit()),
                Expanded(child: PanelConnexion()),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class PanelInit extends StatelessWidget {
  const PanelInit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Bienvenue sur",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: colorpanel(900))),
              SizedBox(height: 3),
              Text("Kyklos",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(color: colorpanel(900))),
              SizedBox(height: 20),
              Image.asset(AssetsPath.main_flower, height: 320),
            ],
          ),
        ),
        if (!kIsWeb)
          Container(
              constraints: BoxConstraints(maxWidth: 400),
              height: MediaQuery.of(context).size.height / 5,
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => context.router.push(LangueRoute()),
                    style: buttonBigPrimary,
                    child: Container(
                      height: 40,
                      child: Row(
                        children: [
                          Text(AppLocalizations.of(context)!.commencer),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
      ],
    );
  }
}
