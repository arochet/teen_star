import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Condition_utilisationPage extends ConsumerStatefulWidget {
  const Condition_utilisationPage({Key? key}) : super(key: key);

  @override
  _Condition_utilisationPageState createState() => _Condition_utilisationPageState();
}

class _Condition_utilisationPageState extends ConsumerState<Condition_utilisationPage> {
  bool conditionAccecpte = false;
  @override
  Widget build(BuildContext context) {
    final currentUserDataAsync = ref.watch(currentUserData);
    return MainScaffold(
      title: AppLocalizations.of(context)!.principeutilisation,
      child: ShowComponentFile(
        title: './lib/PRESENTATION/auth/condition_utilisation/condition_utilisation_page.dart',
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: ListView(children: [
            //CONDITION D'UTILISATION ACCEPTATION
            ...currentUserDataAsync.when(
              data: (data) {
                if (data != null) return [];
                return [
                  Center(
                      child: Text("${AppLocalizations.of(context)!.etape} 2/3",
                          style: Theme.of(context).textTheme.titleSmall)),
                  SpaceH40(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.library_books),
                      onPressed: () {
                        context.router.push(Principes_de_baseRoute());
                      },
                      label: Text(AppLocalizations.of(context)!.basic_guide),
                      style: buttonLittleSecondary,
                    ),
                  ),
                  SpaceH40(),
                  DefaultPanel(
                      child: Column(
                    children: [
                      SpaceH20(),
                      Text(AppLocalizations.of(context)!.jailulespoints,
                          style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.justify),
                      SpaceH20(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              conditionAccecpte = !conditionAccecpte;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(conditionAccecpte ? Icons.check_box : Icons.check_box_outline_blank,
                                  color: actioncolor['primary']),
                              SizedBox(width: 15),
                              Flexible(
                                child: Text("J'ai lu et j'accepte les \nconditions d'utilisation", //azer
                                    style: Theme.of(context).textTheme.labelMedium),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                  SpaceH20(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (conditionAccecpte) {
                          context.router.push(AuthRegisterRoute());
                        } else {
                          showSnackbar(context, 'Vous devez accepter les conditions d\'utilisation'); //azer
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.continuer),
                      style: conditionAccecpte ? buttonNormalPrimary : buttonNormalDesactivate,
                    ),
                  ),
                ];
              },
              loading: () => [CircularProgressIndicator()],
              error: (err, stack) => [Text(err.toString())],
            ),
          ]),
        ),
      ),
    );
  }
}
