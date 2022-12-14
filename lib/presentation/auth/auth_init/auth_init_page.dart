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
        backgroundColor: colorpanel(900),
        body: SafeArea(
          child: ShowEnvironment(
              child: ShowComponentFile(title: 'auth/auth_init/auth_init.dart', child: PanelInit())),
        ),
      );
    } else {
      //Web
      return Scaffold(
        backgroundColor: colorpanel(900),
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
              Text("TeenSTAR", style: Theme.of(context).textTheme.headline2),
              SizedBox(height: 20),
              Image(
                image: AssetImage(AssetsPath.icon),
                height: 160,
              ),
            ],
          ),
        ),
        if (!kIsWeb)
          Container(
              constraints: BoxConstraints(maxWidth: 400),
              height: MediaQuery.of(context).size.height / 3,
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => context.router.push(LangueRoute()),
                    style: buttonBigPrimary,
                    child: Text(AppLocalizations.of(context)!.commencer),
                  ),
                ),
              ))
      ],
    );
  }
}
