import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/APPLICATION/cycle/add_observation_form_notifier.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';
import 'package:teenstar/PRESENTATION/core/_utils/text_utils.dart';
import 'package:teenstar/PRESENTATION/cycle/cycles_page.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'choix_form_field.dart';

final isFirstPage = StateProvider<bool>((ref) => true);

class ObservationFormProvider extends ConsumerWidget {
  Cycle? cycle;
  Observation? observation;
  DateTime date;
  ObservationFormProvider(
    this.cycle,
    this.date, {
    Key? key,
    this.observation,
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
                //Création réussie !
                Future.delayed(Duration.zero, () async {
                  //L'observation a été ajoutée, on recharge les données
                  ref.invalidate(allCycleProvider);
                  ref.invalidate(lastCycleId);
                  ref.invalidate(rangeDisplayObservation);

                  await Future.delayed(Duration(milliseconds: 50));
                  final async = await ref.read(allCycleProvider.future);
                  async.fold((l) => showSnackbarCycleFailure(context, l), (listCycleDTO) {
                    final idLastCycle = Cycle.lastId(listCycleDTO.map((e) => e.toDomain([])).toList());
                    if (idLastCycle != null) {
                      //On recharge le cycle courant
                      ref.invalidate(cycleProvider(idLastCycle));
                      ref.read(idCycleCourant.notifier).state = idLastCycle;
                      context.router.pop();
                    }
                  });
                });
              }));
    });
    return ObservationForm(
      cycle,
      date,
      observation: observation,
    );
  }
}

class ObservationForm extends ConsumerStatefulWidget {
  Cycle? cycle; //Le cycle est null si c'est la première observation
  Observation? observation;
  DateTime date;
  ObservationForm(this.cycle, this.date, {Key? key, this.observation}) : super(key: key);

  @override
  _ObservationFormState createState() => _ObservationFormState();
}

class _ObservationFormState extends ConsumerState<ObservationForm> {
  late TextEditingController _controllerTempBasale;
  late TextEditingController _controllerSensationAutre;
  late TextEditingController _controllerMucusAutre;
  late TextEditingController _controllerDouleursAutre;
  late TextEditingController _controllerEvenementAutre;
  late TextEditingController _controllerHumeurAutre;
  late TextEditingController _controllerNotesConfidentielles;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controllerTempBasale = TextEditingController();
    _controllerSensationAutre = TextEditingController();
    _controllerMucusAutre = TextEditingController();
    _controllerDouleursAutre = TextEditingController();
    _controllerEvenementAutre = TextEditingController();
    _controllerHumeurAutre = TextEditingController();
    _controllerNotesConfidentielles = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cycleFormNotifierProvider.notifier).dateChanged(widget.date);
      ref.read(cycleFormNotifierProvider.notifier).sangChanged(Sang(SangState.rien));

      if (widget.observation != null) {
        ref.read(cycleFormNotifierProvider.notifier).dateChanged(widget.observation!.date!);
        ref.read(cycleFormNotifierProvider.notifier).sensationChanged(widget.observation!.sensation!);
        ref
            .read(cycleFormNotifierProvider.notifier)
            .sensationsAutreChanged(widget.observation!.sensationsAutre!);
        ref.read(cycleFormNotifierProvider.notifier).sangChanged(widget.observation!.sang!);
        ref.read(cycleFormNotifierProvider.notifier).mucusChanged(widget.observation!.mucus!);
        ref.read(cycleFormNotifierProvider.notifier).mucusAutreChanged(widget.observation!.mucusAutre!);
        ref.read(cycleFormNotifierProvider.notifier).humeurChanged(widget.observation!.humeur!);
        ref.read(cycleFormNotifierProvider.notifier).humeurAutreChanged(widget.observation!.humeurAutre!);
        widget.observation!.douleurs!.forEach((douleur) {
          ref.read(cycleFormNotifierProvider.notifier).douleursChanged(douleur.getOrCrash());
        });
        ref.read(cycleFormNotifierProvider.notifier).douleursAutreChanged(widget.observation!.douleursAutre!);
        widget.observation!.evenements!.forEach((element) {
          ref.read(cycleFormNotifierProvider.notifier).evenementsChanged(element.getOrCrash());
        });
        ref
            .read(cycleFormNotifierProvider.notifier)
            .evenementsAutreChanged(widget.observation!.evenementsAutre!);
        ref
            .read(cycleFormNotifierProvider.notifier)
            .temperatureBasaleChanged(widget.observation!.temperatureBasale!);
        _controllerTempBasale.text = widget.observation!.temperatureBasale!.toString();
      }
    });
  }

  void _scrollUp() {
    _controller.jumpTo(_controller.position.minScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(cycleFormNotifierProvider);
    final notifierForm = ref.read(cycleFormNotifierProvider.notifier);
    TextStyle? styleTitre = Theme.of(context).textTheme.titleMedium?.copyWith(color: actioncolor['primary']);

    bool first = ref.watch(isFirstPage);
    //Formulaire de l'observation
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child:
            ListView(controller: _controller, padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
          SpaceH10(),
          //Bouton pour enregistrer l'observation en mode dev
          if (ref.watch(environment).name == Environment.dev && false)
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

                  //Vérification qu'il n'extiste pas déjà une observation pour cette journée

                  final List<Observation> obs = widget.cycle?.observations
                          .where((obs) => obs.date?.isSameDayAs(form.date) == true)
                          .toList() ??
                      [];

                  if (obs.length > 0) {
                    final ok = await showDialogChoix(context,
                        "Attention, une observation existe déjà pour cette date, voulez-vous la remplacer ?",
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
          if (/* first */ true) ...[
            //Date de l'observation
            Row(
              children: [
                Text("Date:", style: styleTitre),
                SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2071));
                    if (date != null) notifierForm.dateChanged(date);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 202, 82, 52), border: Border.all(color: colorpanel(50)!)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          AppDateUtils.isToday(form.date)
                              ? 'Aujourd\'hui'
                              : AppDateUtils.formatDate(form.date),
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
            SpaceH10(),
            //SENSATION
            Text("SENSATION", style: styleTitre),
            Divider(color: actioncolor['primary'], thickness: 1),
            const SizedBox(height: 5),
            ChoixFormField(
              choix: SensationState.values.where((state) => state != SensationState.none).toList(),
              onSelect: (state) => notifierForm.sensationChanged(Sensation(state as SensationState)),
              currentStates: [form.sensation.getOrCrash()],
              titre: (state) =>
                  TextUtils.toFirstLettersUpperCase((state as SensationState).toDisplayString()),
              iconPath: (state) => (state as SensationState).toIconPath(),
              iconTxt: null,
            ),
            if (form.sensation.getOrCrash() == SensationState.autre)
              TextFormField(
                autocorrect: false,
                onChanged: (String value) => notifierForm.sensationsAutreChanged(value),
                controller: _controllerSensationAutre,
                decoration: InputDecoration(labelText: 'Autre sensation'),
              ),

            //SANG
            Text("SANG", style: styleTitre),
            Divider(color: actioncolor['primary'], thickness: 1),
            const SizedBox(height: 5),
            ChoixFormField(
              choix: SangState.values.where((state) => state != SangState.none).toList(),
              onSelect: (state) => notifierForm.sangChanged(Sang(state as SangState)),
              currentStates: [form.sang.getOrCrash()],
              titre: (state) => TextUtils.toFirstLettersUpperCase((state as SangState).toDisplayString()),
              iconPath: (state) => (state as SangState).toIconPath(),
              isRed: true,
            ),

            //MUCUS
            Text("MUCUS", style: styleTitre),
            Divider(color: actioncolor['primary'], thickness: 1),
            const SizedBox(height: 5),
            ChoixFormField(
              choix: MucusState.values.where((state) => state != MucusState.none).toList(),
              onSelect: (state) => notifierForm.mucusChanged(Mucus(state as MucusState)),
              currentStates: [form.mucus.getOrCrash()],
              titre: (state) => (state as MucusState).toDisplayString(),
              iconPath: (state) => (state as MucusState).toIconPath(),
              height: (state) => (95 + ((state as MucusState).toDisplayString().length * 2.2)).toDouble(),
            ),
            if (form.mucus.getOrCrash() == MucusState.autre)
              TextFormField(
                autocorrect: false,
                onChanged: (String value) => notifierForm.mucusAutreChanged(value),
                controller: _controllerMucusAutre,
                decoration: InputDecoration(labelText: 'Autre observation'),
              ),
            /* //BUTON NEXT PAGE
            ElevatedButton(
              onPressed: () async {
                ref.read(isFirstPage.notifier).state = false;
                _scrollUp();
              },
              style: buttonNormalPrimary,
              child: Icon(Icons.arrow_forward_ios),
            ),
            SpaceH30(), */
          ],
          if (/* !first */ true) ...[
            //BUTON PREVIOUS PAGE
            /* Container(
              width: 30,
              child: ElevatedButton(
                onPressed: () async {
                  ref.read(isFirstPage.notifier).state = true;
                },
                style: buttonNormalPrimary,
                child: Icon(Icons.arrow_back_ios),
              ),
            ), */
            //SpaceH10(),

            //HUMEUR
            Text("HUMEUR", style: styleTitre),
            Divider(color: actioncolor['primary'], thickness: 1),
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
                decoration: InputDecoration(labelText: 'Autre humeur'),
              ),

            //SIGNE ASSOCIE
            Text("SIGNE ASSOCIÉ", style: styleTitre),
            Divider(color: actioncolor['primary'], thickness: 1),
            const SizedBox(height: 5),
            ChoixFormField(
              choix: DouleurState.values
                  .where((state) => state != DouleurState.none && state != DouleurState.aucune)
                  .toList(),
              onSelect: (state) => notifierForm.douleursChanged(state as DouleurState),
              currentStates: form.douleurs.map((e) => e.getOrCrash()).toList(),
              titre: (state) => (state as DouleurState).toDisplayString(),
              iconPath: (state) => (state as DouleurState).toIconPath(),
              iconTxt: (state) => (state as DouleurState).toDisplayShort(),
            ),
            if (/* form.douleurs.contains(Douleur(DouleurState.acne)) */ false)
              TextFormField(
                autocorrect: false,
                onChanged: (String value) => notifierForm.douleursAutreChanged(value),
                controller: _controllerDouleursAutre,
                decoration: InputDecoration(labelText: 'Autre douleurs'),
              ),

            //EVENEMENTS
            Text("ÉVÉNEMENT", style: styleTitre),
            Divider(color: actioncolor['primary'], thickness: 1),
            const SizedBox(height: 5),
            ChoixFormField(
              choix: EvenementState.values
                  .where((state) => state != EvenementState.none && state != EvenementState.medicament)
                  .toList(),
              onSelect: (state) => notifierForm.evenementsChanged(state as EvenementState),
              currentStates: form.evenements.map((e) => e.getOrCrash()).toList(),
              titre: (state) => (state as EvenementState).toDisplayString(),
              iconPath: (state) => (state as EvenementState).toIconPath(),
            ),
            if (form.evenements.where((evt) => evt.getOrCrash() == EvenementState.autre).length > 0)
              TextFormField(
                autocorrect: false,
                onChanged: (String value) => notifierForm.evenementsAutreChanged(value),
                controller: _controllerEvenementAutre,
                decoration: InputDecoration(labelText: 'Autre note'),
              ),

            //TEMPERATURE BASALE
            Row(
              children: [
                Text("TEMPERATURE ",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: actioncolor['primary'])),
                SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    autocorrect: false,
                    decoration: InputDecoration(labelText: '°C'),
                    onChanged: (value) {
                      try {
                        notifierForm
                            .temperatureBasaleChanged(double.parse(value.replaceAll(RegExp(r','), '.')));
                      } catch (e) {
                        print(e);
                      }
                    },
                    controller: _controllerTempBasale,
                  ),
                ),
              ],
            ),
            SpaceH10(),

            /* //NOTES CONFIDENTIELLES
            Text("NOTES CONFIDENTIELLES",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: actioncolor['primary'])),
            const SizedBox(height: 5),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              maxLength: 500,
              onChanged: (String value) => notifierForm.notesConfidentiellesChanged(value),
              controller: _controllerNotesConfidentielles,
            ), */

            //insert-field-complete

            const SizedBox(height: 14),
            SpaceH10(),
            //BOUTON VALIDATION
            Align(
              child: ElevatedButton(
                onPressed: () async {
                  ref.read(isFirstPage.notifier).state = true;
                  final List<Observation> obs = widget.cycle?.observations
                          .where((obs) => obs.date?.isSameDayAs(form.date) == true)
                          .toList() ??
                      [];

                  //Ajout de la vérification si la date ne se superpose pas avec les cycles précédents
                  if (widget.observation == null && widget.cycle == null) {
                    final lastCycleEither = await ref.read(lastCycleId.future);
                    bool dispAlertDate = false;
                    await lastCycleEither.fold((l) => showSnackbarCycleFailure(context, l),
                        (idLastCycle) async {
                      if (idLastCycle != null) {
                        final lastCycle = ref.read(cycleProvider(idLastCycle)); //Recupère le dernier cycle
                        lastCycle.whenData((cycleAsync) async {
                          cycleAsync.fold((l) => showSnackbarCycleFailure(context, l),
                              (Cycle lastCycle) async {
                            DateTime? lastDate = lastCycle.getDateOfLastObservation();

                            if (lastDate != null) {
                              if (form.date.toDate().isAfter(lastDate) == false) {
                                dispAlertDate = true;
                              }
                            }
                          });
                        });
                      }
                    });
                    if (dispAlertDate) {
                      //Affichage d'un dialog pour confirmer l'ajout de l'observation
                      final dateOK = await showDialogChoix(context,
                          "Attention cette date existe déjà dans le cycle précédent. Vous devrez supprimer manuellement le doublon",
                          positiveText: "Compris !", negativeText: "Annuler", isDanger: true);

                      if (dateOK != true) {
                        return;
                      }
                    }
                  }

                  //Vérification si la date n'existe pas déjà
                  if (obs.length > 0 && widget.observation == null) {
                    final ok = await showDialogChoix(context,
                        "Attention, une observation existe déjà pour cette date, voulez-vous la remplacer ?",
                        positiveText: "Remplacer", negativeText: "Annuler", isDanger: true);

                    if (ok == true) {
                      notifierForm.addObservationPressed(widget.cycle);
                    }
                  } else {
                    notifierForm.addObservationPressed(widget.cycle);
                  }
                },
                style: buttonNormalPrimary,
                child: const Text("ok"),
              ),
            ),
            const SizedBox(height: 12),
            if (ref.read(cycleFormNotifierProvider).isSubmitting) ...[
              const SizedBox(height: 8),
              const LinearProgressIndicator(value: null)
            ]
          ]
        ]),
      ),
    );
  }
}
