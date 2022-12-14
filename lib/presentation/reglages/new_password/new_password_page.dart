import 'package:another_flushbar/flushbar.dart';
import 'package:teenstar/APPLICATION/account/new_password_form_notifier.dart';
import 'package:teenstar/PRESENTATION/core/_components/contrained_box_max_width.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';

final mdpupdate = StateProvider<bool>((ref) => false);

class NewPasswordPage extends ConsumerWidget {
  final bool isMotDePasseAppli;
  const NewPasswordPage({Key? key, required this.isMotDePasseAppli}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<NewPasswordFormData>(newPasswordFormNotifierProvider, (prev, newPasswordInState) {
      newPasswordInState.authFailureOrSuccessOption.fold(() {}, (either) {
        //Authentification réussie !
        ref.read(mdpupdate.notifier).state = true;
        Future.delayed(Duration(seconds: 1), () {
          ref.read(mdpupdate.notifier).state = false;
          context.router.replaceAll([
            MainNavigationRoute(children: [AccountRoute()])
          ]);
        });
      });
    });
    return MainScaffold(
      child: ShowComponentFile(
          title: 'account/new_password/new_password_page.dart', child: FormReauthenticate(isMotDePasseAppli)),
    );
  }
}

class FormReauthenticate extends ConsumerWidget {
  final bool isMotDePasseAppli;
  const FormReauthenticate(
    this.isMotDePasseAppli, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(newPasswordFormNotifierProvider);
    final okmdpupdate = ref.watch(mdpupdate.notifier).state;

    if (okmdpupdate)
      return Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Text(AppLocalizations.of(context)!.motdepassemisajouravecsucces,
              style: Theme.of(context).textTheme.headline4),
        ),
      );

    return ContrainedBoxMaxWidth(
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(padding: const EdgeInsets.all(18), children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
            child: Text(
              "${AppLocalizations.of(context)!.votrenouveaumotdepasse} ${isMotDePasseAppli ? 'Appli' : 'PDF'}",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          const SizedBox(height: 14),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: AppLocalizations.of(context)!.motdepasse,
            ),
            autocorrect: false,
            autofocus: true,
            textInputAction: TextInputAction.next,
            obscureText: true,
            onChanged: (value) => ref.read(newPasswordFormNotifierProvider.notifier).passwordChanged(value),
            validator: (_) {
              final data = ref.read(newPasswordFormNotifierProvider);
              if (data.showErrorMessages) {
                return data.password.value.fold(
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
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: AppLocalizations.of(context)!.motdepasseconfirmation,
            ),
            autocorrect: false,
            textInputAction: TextInputAction.done,
            obscureText: true,
            onChanged: (value) =>
                ref.read(newPasswordFormNotifierProvider.notifier).passwordConfirmationChanged(value),
            validator: (_) {
              final data = ref.read(newPasswordFormNotifierProvider);
              if (data.showErrorMessages) {
                return data.passwordConfirmation.value.fold(
                  (f) => f.maybeMap(
                    confirmationPasswordFail: (_) =>
                        AppLocalizations.of(context)!.motdepasseconfirmationdifferent,
                    shortPassword: (_) => AppLocalizations.of(context)!.motdepassetropcourt,
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              } else
                return null;
            },
          ),
          const SizedBox(height: 8),
          //BOUTON VALIDER
          Align(
            child: ElevatedButton(
              onPressed: () {
                ref.read(newPasswordFormNotifierProvider.notifier).newPasswordPressed(isMotDePasseAppli);
              },
              style: buttonNormalPrimary,
              child: Text(AppLocalizations.of(context)!.valider),
            ),
          ),
          const SizedBox(height: 12),
          //BARRE DE CHARGEMENT
          if (ref.watch(newPasswordFormNotifierProvider).isSubmitting) ...[
            const SizedBox(height: 8),
            const LinearProgressIndicator(value: null)
          ],
          const SizedBox(height: 12),
        ]),
      ),
    );
  }
}
