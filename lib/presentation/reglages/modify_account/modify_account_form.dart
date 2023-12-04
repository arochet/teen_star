// import 'package:another_flushbar/flushbar.dart';
import 'package:intl/intl.dart';
import 'package:teenstar/APPLICATION/account/modify_form_notifier.dart';
import 'package:teenstar/PRESENTATION/auth/widget/flushbar_auth_failure.dart';
import 'package:teenstar/PRESENTATION/core/_components/contrained_box_max_width.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';

import '../../core/_components/spacing.dart';

enum ThemeApp { blue, pink }

extension ThemeAppExtension on ThemeApp {
  //Retourne le theme en fonction de l'index
  static ThemeApp fromIndex(int? index) {
    switch (index) {
      case 0:
        return ThemeApp.blue;
      case 1:
        return ThemeApp.pink;
      default:
        return ThemeApp.blue;
    }
  }

  String get name {
    switch (this) {
      case ThemeApp.blue:
        return 'Bleu';
      case ThemeApp.pink:
        return 'Rose';
      default:
        return 'Bleu';
    }
  }

  Color get color {
    switch (this) {
      case ThemeApp.blue:
        return Color.fromARGB(255, 238, 246, 250);
      case ThemeApp.pink:
        return Colors.pink;
      default:
        return Color.fromARGB(255, 238, 246, 250);
    }
  }

  Color get color2 {
    switch (this) {
      case ThemeApp.blue:
        return Color.fromARGB(255, 230, 236, 238);
      case ThemeApp.pink:
        return const Color.fromARGB(255, 206, 50, 102);
      default:
        return Colors.blue;
    }
  }

  int get index {
    switch (this) {
      case ThemeApp.blue:
        return 0;
      case ThemeApp.pink:
        return 1;
      default:
        return 0;
    }
  }
}

class ModifyAccountForm extends ConsumerWidget {
  const ModifyAccountForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ModifyFormData>(modifyFormNotifierProvider, (prev, myRegisterState) {
      myRegisterState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                FlushbarAuthFailure.show(context, failure);
              }, (_) {
                //Authentification réussie !
                Future.delayed(Duration.zero, () async {
                  ref.refresh(currentUserData);
                  await context.router.replaceAll([
                    MainNavigationRoute(children: [AccountRoute()])
                  ]);
                });
              }));
    });
    return FormModifyAccount();
  }
}

class FormModifyAccount extends ConsumerStatefulWidget {
  const FormModifyAccount({
    Key? key,
  }) : super(key: key);

  @override
  _FormModifyAccountState createState() => _FormModifyAccountState();
}

class _FormModifyAccountState extends ConsumerState<FormModifyAccount> {
  //CONTROLLER DU FORMULAIRE POUR L'INITIALISATION DES VALEURS DES CHAMPS
  TextEditingController _controllerUserName = new TextEditingController(text: '');
  TextEditingController _controllerAnneePremiereRegle = new TextEditingController(text: '');
  TextEditingController _controllerDateNaissance = new TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => load(context));
  }

  load(BuildContext context) async {
    //Charge les données de l'utilisateur courant
    final dataAsync = ref.read(currentUserData);
    dataAsync.whenData(
      (dataUser) async {
        if (dataUser != null) {
          //Initialisation du Modify Form Notifier
          ref.read(modifyFormNotifierProvider.notifier).setValueWithUserData(dataUser);

          //Remplis le formulaire
          setState(() {
            _controllerUserName = new TextEditingController(text: dataUser.userName.getOrCrash());
            _controllerAnneePremiereRegle =
                new TextEditingController(text: dataUser.anneePremiereRegle.toString());
            _controllerDateNaissance = new TextEditingController(
                text: AppDateUtils.formatDate(dataUser.dateNaissance, 'dd.MM.yyyy'));
          });
          ref.read(modifyFormNotifierProvider.notifier).nomUtilisateurChanged(_controllerUserName.text);
          ref
              .read(modifyFormNotifierProvider.notifier)
              .anneePremiereRegleChanged(dataUser.anneePremiereRegle);
          ref.read(modifyFormNotifierProvider.notifier).dateNaissanceChanged(dataUser.dateNaissance);
          ref
              .read(modifyFormNotifierProvider.notifier)
              .themeChanged(ThemeAppExtension.fromIndex(dataUser.theme));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      ref.watch(modifyFormNotifierProvider); //Pour mettre à jour le validator !

      return ContrainedBoxMaxWidth(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: ListView(padding: const EdgeInsets.all(18), children: [
            const SizedBox(height: 8),
            //NOM UTILISATEUR
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.nomutilisateur,
              ),
              autocorrect: false,
              onChanged: (value) {
                ref.read(modifyFormNotifierProvider.notifier).nomUtilisateurChanged(value);
              },
              validator: (_) {
                final registerData = ref.read(modifyFormNotifierProvider);

                if (registerData.showErrorMessages) {
                  return registerData.nomUtilisateur.value.fold(
                    (f) => f.maybeMap(
                      exceedingLenghtOrNull: (_) => AppLocalizations.of(context)!.nominvalide,
                      orElse: () => null,
                    ),
                    (_) => null,
                  );
                } else
                  return null;
              },
              controller: _controllerUserName,
            ),
            const SizedBox(height: 8),
            //ANNEE PREMIERE REGLE
            TextFormField(
              decoration: InputDecoration(
                labelText: "Année des premières règles *",
              ),
              autocorrect: false,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ref
                    .read(modifyFormNotifierProvider.notifier)
                    .anneePremiereRegleChanged(int.tryParse(value) ?? 0);
              },
              validator: (_) {
                final registerData = ref.read(modifyFormNotifierProvider);

                if (registerData.showErrorMessages) {
                  return null;
                } else
                  return null;
              },
              controller: _controllerAnneePremiereRegle,
            ),
            const SizedBox(height: 8),
            //DATE DE NAISSANCE
            TextFormField(
              decoration: InputDecoration(
                labelText: "Date de naissance (jj.mm.aaaa) *",
              ),
              autocorrect: false,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                final _formatter = new DateFormat('dd.MM.yyyy');
                try {
                  ref.read(modifyFormNotifierProvider.notifier).dateNaissanceChanged(_formatter.parse(value));
                } catch (e) {
                  print('erreur de format de date');
                  print(e);
                }
              },
              validator: (_) {
                final registerData = ref.read(modifyFormNotifierProvider);

                if (registerData.showErrorMessages) {
                  return null;
                } else
                  return null;
              },
              controller: _controllerDateNaissance,
            ),
            SpaceH10(),
            DropdownButton(
                isExpanded: true,
                dropdownColor: Colors.white,
                value: ref.read(modifyFormNotifierProvider).themeApp,
                focusColor: Colors.black,
                iconEnabledColor: Colors.white,
                items: ThemeApp.values
                    .map((ThemeApp e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e,
                        ))
                    .toList(),
                onChanged: (ThemeApp? value) {
                  if (value != null) {
                    ref.read(modifyFormNotifierProvider.notifier).themeChanged(value);
                  }
                },
                icon: Icon(Icons.arrow_downward)),
            SpaceH10(),
            Text("* Champs optionnels", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            //BOUTON MODIFIER
            Align(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(modifyFormNotifierProvider.notifier).modifyPressed();
                  ref.refresh(themeApp);
                },
                style: buttonNormalPrimary,
                child: Text(AppLocalizations.of(context)!.modifier),
              ),
            ),
            const SizedBox(height: 12),
            //BARRE DE CHARGEMENT
            if (ref.read(modifyFormNotifierProvider).isSubmitting) ...[
              const SizedBox(height: 8),
              const LinearProgressIndicator(value: null)
            ],
            const SizedBox(height: 12),
          ]),
        ),
      );
    });
  }
}
