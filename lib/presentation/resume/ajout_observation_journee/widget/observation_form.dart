import 'package:another_flushbar/flushbar.dart';
import 'package:injectable/injectable.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/APPLICATION/cycle/add_observation_form_notifier.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
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
  Cycle? cycle;
  DateTime date;
  ObservationFormProvider(
    this.cycle,
    this.date, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Lorsque l'on clique sur le bouton enregistrer observation !
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
                //Cr??ation r??ussie !
                Future.delayed(Duration.zero, () async {
                  ref.refresh(allCycleProvider);
                  context.router.pop();
                });
              }));
    });
    return ObservationForm(cycle, date);
  }
}

class ObservationForm extends ConsumerStatefulWidget {
  Cycle? cycle; //Le cycle est null si c'est la premi??re observation
  DateTime date;
  ObservationForm(this.cycle, this.date, {Key? key}) : super(key: key);

  @override
  _ObservationFormState createState() => _ObservationFormState();
}

class _ObservationFormState extends ConsumerState<ObservationForm> {
  late TextEditingController _controllerTempBasale;
  late TextEditingController _controllerSensationAutre;
  late TextEditingController _controllerMucusAutre;
  late TextEditingController _controllerDouleursAutre;
  late TextEditingController _controllerHumeurAutre;
  late TextEditingController _controllerNotesConfidentielles;
  @override
  void initState() {
    super.initState();
    _controllerTempBasale = TextEditingController();
    _controllerSensationAutre = TextEditingController();
    _controllerMucusAutre = TextEditingController();
    _controllerDouleursAutre = TextEditingController();
    _controllerHumeurAutre = TextEditingController();
    _controllerNotesConfidentielles = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cycleFormNotifierProvider.notifier).dateChanged(widget.date);
    });
  }

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(cycleFormNotifierProvider);
    final notifierForm = ref.read(cycleFormNotifierProvider.notifier);
    //Formulaire de l'observation
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
          Center(
              child: Text(widget.cycle != null ? "Cycle ${widget.cycle!.id.getOrCrash()}" : "Nouveau cycle",
                  style: Theme.of(context).textTheme.headline3)),
          const SizedBox(height: 8),
          //Date de l'observation
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
          //Bouton pour enregistrer l'observation en mode dev
          if (ref.watch(environment).name == Environment.dev)
            Align(
              child: ElevatedButton(
                onPressed: () async {
                  notifierForm.sensationChanged(Sensation(SensationState.humide));
                  notifierForm.sangChanged(Sang(SangState.fluxP));
                  notifierForm.mucusChanged(Mucus(MucusState.depotSecheBlancOuJaune));
                  notifierForm.douleursChanged(DouleurState.malDeTete);
                  notifierForm.notesConfidentiellesChanged("Test note confidentielles");
                  notifierForm.evenementsChanged(EvenementState.fatigue);
                  notifierForm.humeurChanged(Humeur(HumeurState.humeurChangeante));

                  //V??rification qu'il n'extiste pas d??j?? une observation pour cette journ??e

                  final List<Observation> obs = widget.cycle?.observations
                          .where((obs) => obs.date?.isSameDayAs(form.date) == true)
                          .toList() ??
                      [];

                  if (obs.length > 0) {
                    final ok = await showDialogChoix(context,
                        "Attention, une observation existe d??j?? pour cette date, voulez-vous la remplacer ?",
                        positiveText: "Remplacer", negativeText: "Annuler", isDanger: true);

                    if (ok == true) {
                      notifierForm.addObservationPressed(widget.cycle);
                    }
                  } else {
                    notifierForm.addObservationPressed(widget.cycle);
                  }
                },
                style: buttonNormalConfirm,
                child: const Text("[DEV] Enregistrer l'Observation"),
              ),
            ),
          //SENSATION
          Text("Sensation", style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 5),
          ChoixFormField(
            choix: SensationState.values.where((state) => state != SensationState.none).toList(),
            onSelect: (state) => notifierForm.sensationChanged(Sensation(state as SensationState)),
            currentStates: [form.sensation.getOrCrash()],
            titre: (state) => TextUtils.toFirstLettersUpperCase((state as SensationState).toDisplayString()),
            iconPath: (state) => (state as SensationState).toIconPath(),
            iconTxt: (state) => (state as SensationState).toDisplayShort(),
          ),
          if (form.sensation.getOrCrash() == SensationState.autre)
            TextFormField(
              autocorrect: false,
              onChanged: (String value) => notifierForm.sensationsAutreChanged(value),
              controller: _controllerSensationAutre,
            ),
          SpaceH10(),

          //SANG
          Text("Sang", style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 5),
          ChoixFormField(
            choix: SangState.values.where((state) => state != SangState.none).toList(),
            onSelect: (state) => notifierForm.sangChanged(Sang(state as SangState)),
            currentStates: [form.sang.getOrCrash()],
            titre: (state) => TextUtils.toFirstLettersUpperCase((state as SangState).toDisplayString()),
            iconPath: (state) => (state as SangState).toIconPath(),
          ),
          SpaceH10(),

          //MUCUS
          Text("Mucus", style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 5),
          ChoixFormField(
            choix: MucusState.values.where((state) => state != MucusState.none).toList(),
            onSelect: (state) => notifierForm.mucusChanged(Mucus(state as MucusState)),
            currentStates: [form.mucus.getOrCrash()],
            titre: (state) => (state as MucusState).toDisplayString(),
            iconPath: (state) => (state as MucusState).toIconPath(),
          ),
          if (form.mucus.getOrCrash() == MucusState.autre)
            TextFormField(
              autocorrect: false,
              onChanged: (String value) => notifierForm.mucusAutreChanged(value),
              controller: _controllerMucusAutre,
            ),
          SpaceH10(),

          //DOULEURS
          Text("Douleurs", style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 5),
          ChoixFormField(
            choix: DouleurState.values.where((state) => state != DouleurState.none).toList(),
            onSelect: (state) => notifierForm.douleursChanged(state as DouleurState),
            currentStates: form.douleurs.map((e) => e.getOrCrash()).toList(),
            titre: (state) => (state as DouleurState).toDisplayString(),
            iconPath: (state) => (state as DouleurState).toIconPath(),
            iconTxt: (state) => (state as DouleurState).toDisplayShort(),
          ),
          if (form.douleurs.contains(Douleur(DouleurState.autre)))
            TextFormField(
              autocorrect: false,
              onChanged: (String value) => notifierForm.douleursAutreChanged(value),
              controller: _controllerDouleursAutre,
            ),
          SpaceH10(),

          //EVENEMENTS
          Text("Ev??nements", style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 5),
          ChoixFormField(
            choix: EvenementState.values.where((state) => state != EvenementState.none).toList(),
            onSelect: (state) => notifierForm.evenementsChanged(state as EvenementState),
            currentStates: form.evenements.map((e) => e.getOrCrash()).toList(),
            titre: (state) => (state as EvenementState).toDisplayString(),
            iconPath: (state) => (state as EvenementState).toIconPath(),
          ),
          SpaceH10(),

          //TEMPERATURE BASALE
          Row(
            children: [
              Text("Temp??rature Basale", style: Theme.of(context).textTheme.headline5),
              Expanded(child: Container()),
              Container(
                width: 60,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  onChanged: (value) => notifierForm.temperatureBasaleChanged(int.parse(value)),
                  controller: _controllerTempBasale,
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
            currentStates: [form.humeur.getOrCrash()],
            titre: (state) => (state as HumeurState).toDisplayString(),
            iconPath: (state) => (state as HumeurState).toIconPath(),
          ),
          if (form.humeur.getOrCrash() == HumeurState.autre)
            TextFormField(
              autocorrect: false,
              onChanged: (String value) => notifierForm.humeurAutreChanged(value),
              controller: _controllerHumeurAutre,
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
            controller: _controllerNotesConfidentielles,
          ),

          //insert-field-complete

          const SizedBox(height: 14),
          SpaceH10(),
          Align(
            child: ElevatedButton(
              onPressed: () async {
                final List<Observation> obs = widget.cycle?.observations
                        .where((obs) => obs.date?.isSameDayAs(form.date) == true)
                        .toList() ??
                    [];
                if (obs.length > 0) {
                  final ok = await showDialogChoix(context,
                      "Attention, une observation existe d??j?? pour cette date, voulez-vous la remplacer ?",
                      positiveText: "Remplacer", negativeText: "Annuler", isDanger: true);

                  if (ok == true) {
                    notifierForm.addObservationPressed(widget.cycle);
                  }
                } else {
                  notifierForm.addObservationPressed(widget.cycle);
                }
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
      ),
    );
  }
}
