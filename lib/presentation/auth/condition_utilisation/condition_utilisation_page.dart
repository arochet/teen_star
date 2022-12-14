import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
  final bool doitEtreAccepte;
  const Condition_utilisationPage(this.doitEtreAccepte, {Key? key}) : super(key: key);

  @override
  _Condition_utilisationPageState createState() => _Condition_utilisationPageState();
}

class _Condition_utilisationPageState extends ConsumerState<Condition_utilisationPage> {
  bool conditionAccecpte = false;
  @override
  Widget build(BuildContext context) {
    final currentUserDataAsync = ref.watch(currentUserData);
    return MainScaffold(
      title: 'Principe d\'utilisation',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/auth/condition_utilisation/condition_utilisation_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            SpaceH20(),
            SpaceH20(),
            if (widget.doitEtreAccepte)
              ElevatedButton.icon(
                icon: Icon(Icons.access_alarm),
                onPressed: () {
                  context.router.push(Principes_de_baseRoute());
                },
                label: Text("Principe de base"),
                style: buttonNormalPrimary,
              ),
            SpaceH20(),
            SpaceH20(),
            Text(
                "J???ai lu les points ci-dessus et j???ai compris que cette application m???aidera ?? enregistrer mes observations quotidiennes au cours des cycles menstruels, mais ne peut absolument pas me suffire telle quelle pour ??viter (ou favoriser) une grossesse. Je comprends que si tel ??tait mon objectif, je devrais imp??rativement suivre une formation approfondie avec une monitrice sp??cialis??e en m??thode naturelle de r??gulation des naissances.",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.justify),
            SpaceH20(),
            //CONDITION D'UTILISATION ACCEPTATION
            ...currentUserDataAsync.when(
              data: (data) {
                if (data != null) return [];
                return [
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
                          Icon(conditionAccecpte ? Icons.check_box : Icons.check_box_outline_blank),
                          SizedBox(width: 20),
                          Flexible(
                            child: Text("J'ai lu et j'accepte les conditions d'utilisations",
                                style: Theme.of(context).textTheme.headline5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SpaceH20(),
                  Container(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        if (conditionAccecpte) {
                          context.router.push(AuthRegisterRoute());
                        } else {
                          showSnackbar(context, 'Vous devez accepter les conditions d\'utilisation');
                        }
                      },
                      child: Text("Continuer"),
                      style: buttonNormalPrimary,
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
