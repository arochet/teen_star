import 'package:teenstar/APPLICATION/auth/sign_in_form_notifier.dart';
import 'package:teenstar/PRESENTATION/auth/widget/flushbar_auth_failure.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

class FormConnexionProvider extends ConsumerWidget {
  const FormConnexionProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInFormData>(signInFormNotifierProvider, (prev, mySignInState) {
      mySignInState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                FlushbarAuthFailure.show(context, failure);
              }, (_) {
                //Authentification réussie !
                Future.delayed(Duration.zero, () async {
                  ref.read(authNotifierProvider.notifier).authCheckRequested();
                  context.router.replaceAll([ResumeRoute()]);
                });
              }));
    });
    return FormConnexion();
  }
}

class FormConnexion extends ConsumerWidget {
  const FormConnexion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(signInFormNotifierProvider);
    final env = ref.watch(environment.notifier).state.name;
    final isSubmitting = ref.read(signInFormNotifierProvider).isSubmitting;
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Column(children: [
        const SizedBox(height: 8),
        if (env == Environment.dev)
          ElevatedButton(
            onPressed: () {
              ref.read(signInFormNotifierProvider.notifier).passwordChanged("azerazer");
            },
            child: Text("Fill form"),
            style: buttonPrimaryHide,
          ),
        const SizedBox(height: 14),
        //MOT DE PASSE
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: AppLocalizations.of(context)!.motdepasse,
          ),
          autocorrect: false,
          obscureText: true,
          textInputAction: TextInputAction.done,
          onChanged: (value) => ref.read(signInFormNotifierProvider.notifier).passwordChanged(value),
          validator: (_) {
            final signIn = ref.read(signInFormNotifierProvider);
            if (signIn.showErrorMessages) {
              return signIn.password.value.fold(
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
        //BARRE DE CHARGEMENT
        if (isSubmitting) ...[const SizedBox(height: 8), const LinearProgressIndicator(value: null)],
        //MOT DE PASSE OUBLIE
        const SpaceH10(),
        ElevatedButton(
          onPressed: () {
            context.router.push(AuthResetPasswordRoute());
          },
          child: Text(AppLocalizations.of(context)!.motdepasseoublie),
          style: buttonPrimaryHide,
        ),
        const SpaceH10(),
      ]),
    );
  }
}
