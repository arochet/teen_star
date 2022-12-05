import 'package:another_flushbar/flushbar.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/APPLICATION/observation/add_observation_form_notifier.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';
import 'package:teenstar/PRESENTATION/core/_utils/text_utils.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

import 'choix_form_field.dart';

class ObservationFormProvider extends ConsumerWidget {
  const ObservationFormProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AddObservationFormData>(cycleFormNotifierProvider, (prev, myRegisterState) {
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
                  ref.refresh(allCycleProvider);
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
    final form = ref.watch(cycleFormNotifierProvider);
    final notifierForm = ref.read(cycleFormNotifierProvider.notifier);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
        Center(child: Text("Cycle 3", style: Theme.of(context).textTheme.headline3)),
        const SizedBox(height: 8),
        Row(
          children: [
            Text("Date:", style: Theme.of(context).textTheme.headline4),
            Expanded(child: Container()),
            DefaultPanel(
              child: Text(
                  AppDateUtils.isToday(form.date) ? 'Aujourd\'hui' : AppDateUtils.formatDate(form.date),
                  style: Theme.of(context).textTheme.headline5),
            )
          ],
        ),
        SpaceH30(),

        //SENSATION
        Text("Sensation", style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 5),
        ChoixFormField(
          choix: SensationState.values.where((state) => state != SensationState.none).toList(),
          onSelect: (state) => notifierForm.sensationChanged(Sensation(state as SensationState)),
          currentState: form.sensation.getOrCrash(),
          titre: (state) => TextUtils.toFirstLettersUpperCase((state as SensationState).toDisplayString()),
        ),
        if (form.sensation.getOrCrash() == SensationState.autre)
          TextFormField(
            autocorrect: false,
            onChanged: (String value) => notifierForm.sensationsAutreChanged(value),
          ),
        SpaceH10(),

        //SANG
        Text("Sang", style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 5),
        ChoixFormField(
          choix: SangState.values.where((state) => state != SangState.none).toList(),
          onSelect: (state) => notifierForm.sangChanged(Sang(state as SangState)),
          currentState: form.sang.getOrCrash(),
          titre: (state) => TextUtils.toFirstLettersUpperCase((state as SangState).toDisplayString()),
        ),
        SpaceH10(),

        //MUCUS
        Text("Mucus", style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 5),
        ChoixFormField(
          choix: MucusState.values.where((state) => state != MucusState.none).toList(),
          onSelect: (state) => notifierForm.mucusChanged(Mucus(state as MucusState)),
          currentState: form.mucus.getOrCrash(),
          titre: (state) => (state as MucusState).toDisplayString(),
        ),
        if (form.mucus.getOrCrash() == MucusState.autre)
          TextFormField(
            autocorrect: false,
            onChanged: (String value) => notifierForm.mucusAutreChanged(value),
          ),
        SpaceH10(),

        //DOULEURS
        Text("Douleurs", style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 5),
        ChoixMultipleFormField(
          choix: DouleurState.values.where((state) => state != DouleurState.none).toList(),
          onSelect: (state) => notifierForm.douleursChanged(state as DouleurState),
          currentStates: form.douleurs.map((e) => e.getOrCrash()).toList(),
          titre: (state) => (state as DouleurState).toDisplayString(),
        ),
        SpaceH10(),

        //EVENEMENTS
        Text("Evénements", style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 5),
        ChoixMultipleFormField(
          choix: EvenementState.values.where((state) => state != EvenementState.none).toList(),
          onSelect: (state) => notifierForm.evenementsChanged(state as EvenementState),
          currentStates: form.evenements.map((e) => e.getOrCrash()).toList(),
          titre: (state) => (state as EvenementState).toDisplayString(),
        ),
        SpaceH10(),

        //TEMPERATURE BASALE
        Row(
          children: [
            Text("Température Basale", style: Theme.of(context).textTheme.headline5),
            Expanded(child: Container()),
            Container(
              width: 60,
              child: TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                onChanged: (value) => notifierForm.temperatureBasaleChanged(int.parse(value)),
              ),
            ),
          ],
        ),
        SpaceH20(),

        //HUMEUR
        Text("Humeur", style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 5),
        ChoixFormField(
          choix: HumeurState.values.where((state) => state != HumeurState.none).toList(),
          onSelect: (state) => notifierForm.humeurChanged(Humeur(state as HumeurState)),
          currentState: form.humeur.getOrCrash(),
          titre: (state) => (state as HumeurState).toDisplayString(),
        ),
        if (form.humeur.getOrCrash() == HumeurState.autre)
          TextFormField(
            autocorrect: false,
            onChanged: (String value) => notifierForm.humeurAutreChanged(value),
          ),
        SpaceH10(),

        //NOTES CONFIDENTIELLES
        Text("Notes Confidentielles", style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 5),
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          maxLength: 500,
          onChanged: (String value) => notifierForm.notesConfidentiellesChanged(value),
        ),

        //insert-field-complete

        const SizedBox(height: 14),
        Align(
          child: ElevatedButton(
            onPressed: () {
              notifierForm.addObservationPressed();
            },
            style: buttonNormalConfirm,
            child: const Text("Enregistrer l'Observation"),
          ),
        ),
        const SizedBox(height: 12),
        if (ref.read(cycleFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ]
      ]),
    );
  }
}
