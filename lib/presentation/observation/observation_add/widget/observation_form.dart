import 'package:another_flushbar/flushbar.dart';
import 'package:teenstar/APPLICATION/auth/register_form_notifier.dart';
import 'package:teenstar/PRESENTATION/auth/widget/flushbar_auth_failure.dart';
import 'package:teenstar/APPLICATION/observation/add_observation_form_notifier.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

class ObservationFormProvider extends ConsumerWidget {
  const ObservationFormProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AddObservationFormData>(observationFormNotifierProvider, (prev, myRegisterState) {
      myRegisterState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                Flushbar(
                  duration: const Duration(seconds: 3),
                  icon: const Icon(Icons.warning),
                  messageColor: Colors.red,
                  message: failure.map(
                      insufficientPermission: (_) => AppLocalizations.of(context)!.permissioninsuffisante,
                      unableToUpdate: (_) => "Unable to update",
                      unexpected: (_) => "Unexpected"),
                ).show(context);
              }, (_) {
                //Création réussie !
                Future.delayed(Duration.zero, () async {
                  context.router.pop();
                });
              }));
    });
    return ObservationForm();
  }
}

class ObservationForm extends ConsumerWidget {
  const ObservationForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(observationFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'couleur'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(observationFormNotifierProvider.notifier).couleurChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(observationFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.observation.couleur.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'couleur invalide',
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
          decoration: const InputDecoration(labelText: 'analyse'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(observationFormNotifierProvider.notifier).analyseChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(observationFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.observation.analyse.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'analyse invalide',
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
          decoration: const InputDecoration(labelText: 'sensation'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(observationFormNotifierProvider.notifier).sensationChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(observationFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.observation.sensation.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'sensation invalide',
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
          decoration: const InputDecoration(labelText: 'sang'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(observationFormNotifierProvider.notifier).sangChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(observationFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.observation.sang.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'sang invalide',
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
          decoration: const InputDecoration(labelText: 'mucus'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(observationFormNotifierProvider.notifier).mucusChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(observationFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.observation.mucus.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'mucus invalide',
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
          decoration: const InputDecoration(labelText: 'douleurs'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(observationFormNotifierProvider.notifier).douleursChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(observationFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return null;
            } else
              return null;
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'evenements'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(observationFormNotifierProvider.notifier).evenementsChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(observationFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return null;
            } else
              return null;
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'humeur'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(observationFormNotifierProvider.notifier).humeurChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(observationFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.observation.humeur.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'humeur invalide',
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        const SizedBox(height: 8), //insert-field-complete
        const SizedBox(height: 14),
        Align(
          child: ElevatedButton(
            onPressed: () {
              ref.read(observationFormNotifierProvider.notifier).addObservationPressed();
            },
            style: buttonNormalConfirm,
            child: const Text("Enregistrer l'observation"),
          ),
        ),
        const SizedBox(height: 12),
        if (ref.read(observationFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ]
      ]),
    );
  }
}
