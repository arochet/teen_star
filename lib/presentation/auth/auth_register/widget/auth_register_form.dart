import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:teenstar/APPLICATION/auth/register_form_notifier.dart';
import 'package:teenstar/PRESENTATION/auth/widget/flushbar_auth_failure.dart';
import 'package:teenstar/PRESENTATION/core/_components/contrained_box_max_width.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FormRegisterProvide extends ConsumerWidget {
  const FormRegisterProvide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<RegisterFormData>(registerFormNotifierProvider, (prev, myRegisterState) {
      myRegisterState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                FlushbarAuthFailure.show(context, failure);
              }, (_) {
                //Inscription réussie !
                Future.delayed(Duration.zero, () async {
                  ref.read(authNotifierProvider.notifier).authCheckRequested();
                  context.router.replaceAll([SplashRoute()]);
                });
              }));
    });
    return FormRegister();
  }
}

class FormRegister extends ConsumerStatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends ConsumerState<FormRegister> {
  late TextEditingController _controllerNom;
  late TextEditingController _controllerDateNaissance;
  late TextEditingController _controllerAnneeRegle;

  @override
  void initState() {
    super.initState();
    _controllerNom = TextEditingController();
    _controllerDateNaissance = TextEditingController();
    _controllerAnneeRegle = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(registerFormNotifierProvider);
    return ContrainedBoxMaxWidth(
      child: Center(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: ListView(padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
              Center(child: Text("Etape 3/3", style: Theme.of(context).textTheme.headline5)),
              SpaceH10(),
              if (ref.watch(environment).name == Environment.dev)
                ElevatedButton(
                  onPressed: () {
                    final _formatter = new DateFormat('dd/MM/yyyy');
                    ref.read(registerFormNotifierProvider.notifier).nomUtilisateurChanged('azer');
                    ref
                        .read(registerFormNotifierProvider.notifier)
                        .dateNaissanceChanged(_formatter.parse('03.01.97'));
                    ref.read(registerFormNotifierProvider.notifier).anneePremiereRegleChanged(2000);
                    ref.read(registerFormNotifierProvider.notifier).passwordAppliChanged('azerazer');
                    ref
                        .read(registerFormNotifierProvider.notifier)
                        .passwordAppliConfirmationChanged('azerazer');
                    ref.read(registerFormNotifierProvider.notifier).passwordPDFChanged('qsdfqsdf');
                    ref
                        .read(registerFormNotifierProvider.notifier)
                        .passwordPDFConfirmationChanged('qsdfqsdf');
                  },
                  child: Text("[DEV] fill form"),
                  style: buttonPrimaryHide,
                ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.nomutilisateur,
                ),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                controller: _controllerNom,
                onChanged: (value) {
                  ref.read(registerFormNotifierProvider.notifier).nomUtilisateurChanged(value);
                },
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);

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
              ),
              SpaceH10(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Date de naissance (jj/mm/aaaa)",
                ),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.datetime,
                controller: _controllerDateNaissance,
                onChanged: (value) {
                  final _formatter = new DateFormat('dd/MM/yyyy');
                  try {
                    ref
                        .read(registerFormNotifierProvider.notifier)
                        .dateNaissanceChanged(_formatter.parse(value));
                  } catch (e) {}
                },
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);

                  if (registerData.showErrorMessages) {
                    if (registerData.dateNaissance == null) {
                      return 'Date invalide';
                    } else {
                      return null;
                    }
                  } else
                    return null;
                },
              ),
              SpaceH10(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Année des 1ère règles",
                ),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: _controllerAnneeRegle,
                onChanged: (value) {
                  ref
                      .read(registerFormNotifierProvider.notifier)
                      .anneePremiereRegleChanged(int.tryParse(value) ?? 0);
                },
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);

                  if (registerData.showErrorMessages) {
                    if (registerData.annePremiereRegle < 1900 || registerData.annePremiereRegle > 3000)
                      return "Année invalide";
                    else
                      return null;
                  } else
                    return null;
                },
              ),
              SpaceH40(),
              Text("Ce mot de passe sera demandé à chaque ouverture d'application",
                  style: Theme.of(context).textTheme.bodyText1),
              SpaceH10(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mot de Passe Appli',
                ),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                obscureText: true,
                onChanged: (value) =>
                    ref.read(registerFormNotifierProvider.notifier).passwordAppliChanged(value),
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);
                  if (registerData.showErrorMessages) {
                    return registerData.passwordAppli.value.fold(
                      (f) => f.maybeMap(
                        shortPassword: (_) => AppLocalizations.of(context)!.motdepassetropcourt,
                        orElse: () => null,
                      ),
                      (_) => null,
                    );
                  } else
                    return null;
                },
              ),
              SpaceH10(),
              //MOT DE PASSE DE CONFIRMATION
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mot de Passe Appli Confirmation',
                ),
                autocorrect: false,
                textInputAction: TextInputAction.done,
                obscureText: true,
                onChanged: (value) =>
                    ref.read(registerFormNotifierProvider.notifier).passwordAppliConfirmationChanged(value),
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);
                  if (registerData.showErrorMessages) {
                    return registerData.passwordAppliConfirmation.value.fold(
                      (f) => f.maybeMap(
                        confirmationPasswordFail: (_) =>
                            AppLocalizations.of(context)!.motdepasseconfirmationdifferent,
                        orElse: () => null,
                      ),
                      (_) => null,
                    );
                  } else
                    return null;
                },
              ),
              SpaceH40(),
              Text("Ce mot de passe sera demandé à chaque ouverture d'un PDF",
                  style: Theme.of(context).textTheme.bodyText1),
              SpaceH10(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mot de Passe PDF',
                ),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                obscureText: true,
                onChanged: (value) =>
                    ref.read(registerFormNotifierProvider.notifier).passwordPDFChanged(value),
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);
                  if (registerData.showErrorMessages) {
                    return registerData.passwordPDF.value.fold(
                      (f) => f.maybeMap(
                        shortPassword: (_) => AppLocalizations.of(context)!.motdepassetropcourt,
                        orElse: () => null,
                      ),
                      (_) => null,
                    );
                  } else
                    return null;
                },
              ),
              SpaceH10(),
              //MOT DE PASSE DE CONFIRMATION
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mot de Passe PDF Confirmation',
                ),
                autocorrect: false,
                textInputAction: TextInputAction.done,
                obscureText: true,
                onChanged: (value) =>
                    ref.read(registerFormNotifierProvider.notifier).passwordPDFConfirmationChanged(value),
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);
                  if (registerData.showErrorMessages) {
                    return registerData.passwordPDFConfirmation.value.fold(
                      (f) => f.maybeMap(
                        confirmationPasswordFail: (_) =>
                            AppLocalizations.of(context)!.motdepasseconfirmationdifferent,
                        orElse: () => null,
                      ),
                      (_) => null,
                    );
                  } else
                    return null;
                },
              ),
              SpaceH30(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(registerFormNotifierProvider.notifier).registerWithEmailAndPasswordPressed();
                  },
                  style: buttonNormalPrimary,
                  child: Text("S'inscrire"),
                ),
              ),
              const SizedBox(height: 12),
              if (ref.read(registerFormNotifierProvider).isSubmitting) ...[
                SpaceH10(),
                const LinearProgressIndicator(value: null)
              ],
              SpaceH40()
            ]),
          ),
        ),
      ),
    );
  }
}
