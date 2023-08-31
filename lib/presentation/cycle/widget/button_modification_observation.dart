import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:teenstar/PRESENTATION/cycle/widget/modifier_couleur_dialog.dart';
import 'package:teenstar/providers.dart';

import '../cycles_page.dart';

class ButtonModificationObservation extends ConsumerWidget {
  Cycle? cycle;
  ButtonModificationObservation(
    this.cycle, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      alignment: Alignment.bottomCenter,
      child: ShowComponentFile(
        title: 'ButtonModificationObservation',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                printDev();
                ref.watch(isSelection.notifier).state = !ref.read(isSelection);
              },
              child: Text("Annuler"),
              style: buttonNormalSecondary,
            ),
            ElevatedButton(
              onPressed: () async {
                printDev();
                final int nombreObservation = ref.read(observationSectionne).length;
                //DIALOG pour la modification du cycle
                await showDialogApp(
                  context: context,
                  titre: "Analyser $nombreObservation observation${nombreObservation > 1 ? 's' : ''}",
                  child: _DialogModificationCycle(),
                );
              },
              child: Text("Analyser"),
              style: buttonNormalPrimary,
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogModificationCycle extends ConsumerWidget {
  _DialogModificationCycle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int nombreObservation = ref.watch(observationSectionne).length;
    return ShowComponentFile(
      title: '_DialogModificationCycle',
      child: Container(
        height: 320,
        child: Column(
          children: [
            SpaceH20(),
            //MODIFIER COULEUR
            ElevatedButton(
              onPressed: () async {
                final listObservationSelectionnee = ref.read(observationSectionne);
                await showDialogApp<void>(
                  context: context,
                  child: ModifierCouleurDialog(listObservationSelectionnee),
                  titre: "Choisir une couleur",
                );

                ref.watch(isSelection.notifier).state = false;
                ref.watch(showAnalyse.notifier).state = true;
                _rafraichirPage(ref);
                Navigator.of(context).pop();
              },
              child: Text("Modifier couleur"),
              style: buttonNormalSecondaryFull,
            ),
            SpaceH5(),
            ElevatedButton(
              onPressed: () async {
                final listObservationSelectionnee = ref.read(observationSectionne);
                await ref
                    .read(cycleRepositoryProvider)
                    .marquerJourFertile(listObservationSelectionnee, false);
                ref.watch(isSelection.notifier).state = false;
                ref.watch(showAnalyse.notifier).state = true;
                _rafraichirPage(ref);
                Navigator.of(context).pop();
              },
              child: Text("Marquer infertile"),
              style: buttonNormalSecondaryFull,
            ),
            SpaceH5(),
            //EFFACER LE POINT D'INTERROGATION
            ElevatedButton(
              onPressed: () async {
                final listObservationSelectionnee = ref.read(observationSectionne);
                await ref
                    .read(cycleRepositoryProvider)
                    .enleverPointInterrogation(listObservationSelectionnee, true);
                ref.watch(isSelection.notifier).state = false;
                ref.watch(showAnalyse.notifier).state = true;
                _rafraichirPage(ref);
                Navigator.of(context).pop();
              },
              child: Text("Effacer le \"?\""),
              style: buttonNormalSecondaryFull,
            ),
            SpaceH5(),
            //ANNULER COULEUR
            ElevatedButton(
              onPressed: () async {
                final listObservationSelectionnee = ref.read(observationSectionne);
                listObservationSelectionnee.forEach((element) async {
                  await ref
                      .read(cycleRepositoryProvider)
                      .modifierCouleurAnalyse(element, CouleurAnalyseState.none);
                });
                ref.watch(isSelection.notifier).state = false;
                ref.watch(showAnalyse.notifier).state = true;
                _rafraichirPage(ref);
                Navigator.of(context).pop();
              },
              child: Text("Annuler couleur"),
              style: buttonNormalSecondaryFull,
            ),
            SpaceH5(),
            //ANNULER INFERTILE
            ElevatedButton(
              onPressed: () async {
                final listObservationSelectionnee = ref.read(observationSectionne);
                await ref.read(cycleRepositoryProvider).marquerJourFertile(listObservationSelectionnee, true);
                ref.watch(isSelection.notifier).state = false;
                ref.watch(showAnalyse.notifier).state = true;
                _rafraichirPage(ref);
                Navigator.of(context).pop();
              },
              child: Text("Annuler infertile"),
              style: buttonNormalSecondaryFull,
            ),
            SpaceH5(),
          ],
        ),
      ),
    );
  }

  _rafraichirPage(WidgetRef ref) {
    //Vider la selection
    ref.read(observationSectionne.notifier).state = [];
    //Rafraichir les données de la page Cycle
    ref.invalidate(allCycleProvider);
    final id = ref.read(idCycleCourant);
    if (id != null) ref.invalidate(cycleProvider(id));
  }
}
