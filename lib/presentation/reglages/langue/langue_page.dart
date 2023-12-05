import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_form.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguePage extends ConsumerStatefulWidget {
  const LanguePage({Key? key}) : super(key: key);

  @override
  _LanguePageState createState() => _LanguePageState();
}

class _LanguePageState extends ConsumerState<LanguePage> {
  int currentLanguage = 1;
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: AppLocalizations.of(context)!.language,
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/langue/langue_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Container(
              width: 280,
              child: Column(
                children: [
                  Text("Etape 1/3", style: Theme.of(context).textTheme.titleSmall),
                  Expanded(child: Container()),
                  //CHOIX DES LANGUES
                  InkWell(
                    child: _ChoixLangue("Français", currentLanguage == 0),
                    onTap: () async {
                      await ref.read(authRepositoryProvider).setLanguage(LanguageApp.francais);
                      ref.refresh(languageApp);
                      setState(() {
                        currentLanguage = 0;
                      });
                    },
                  ),
                  SpaceH10(),
                  InkWell(
                    child: _ChoixLangue("English ", currentLanguage == 1),
                    onTap: () async {
                      await ref.read(authRepositoryProvider).setLanguage(LanguageApp.anglais);
                      ref.refresh(languageApp);
                      setState(() {
                        currentLanguage = 1;
                      });
                    },
                  ),
                  SpaceH40(),
                  SpaceH40(),
                  //BOUTON VALIDATON
                  ElevatedButton(
                    onPressed: () {
                      context.router.push(Condition_utilisationRoute());
                    },
                    child: Text(AppLocalizations.of(context)!.commencer),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(enable ? Icons.check_box : Icons.check_box_outline_blank, color: actioncolor['primary']),
        SizedBox(width: 10),
        Flexible(
          child: Text(
            langue,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: enable ? actioncolor['primary'] : colorpanel(600)),
          ),
        ),
      ],
    );
  }
}
