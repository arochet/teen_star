import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:teenstar/providers.dart';

import '../resume_page.dart';

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
                printDev("ButtonAnnulerObservation onPressed");
                ref.watch(isSelection.notifier).state = !ref.read(isSelection);
              },
              child: Text("Annuler"),
              style: buttonNormalSecondary,
            ),
            ElevatedButton(
              onPressed: () async {
                printDev("ButtonModificationObservation onPressed");
                final int nombreObservation = ref.read(observationSectionne).length;
                //DIALOG pour la modification du cycle
                await showDialogApp(
                  context: context,
                  titre: "Modifier $nombreObservation observation${nombreObservation > 1 ? 's' : ''}",
                  child: _DialogModificationCycle(),
                );
              },
              child: Text("Modifier"),
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
        height: 180,
        child: Column(
          children: [
            SpaceH20(),
            ElevatedButton(
              onPressed: () {
                ref.watch(isSelection.notifier).state = false;
                final listObservationSelectionnee = ref.read(observationSectionne);
                ref.read(cycleRepositoryProvider).marquerJourFertile(listObservationSelectionnee, false);
                _rafraichirPage(ref);
                Navigator.of(context).pop();
              },
              child: Text("Enlever infertile"),
              style: buttonNormalSecondaryFull,
            ),
            SpaceH5(),
            ElevatedButton(
              onPressed: () {
                ref.watch(isSelection.notifier).state = false;
                final listObservationSelectionnee = ref.read(observationSectionne);
                ref.read(cycleRepositoryProvider).marquerJourFertile(listObservationSelectionnee, true);
                _rafraichirPage(ref);
                Navigator.of(context).pop();
              },
              child: Text("Marquer infertile"),
              style: buttonNormalSecondaryFull,
            ),
            SpaceH5(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Enlever ?"),
              style: buttonNormalSecondaryFull,
            ),
          ],
        ),
      ),
    );
  }

  _rafraichirPage(WidgetRef ref) {
    //Vider la selection
    ref.read(observationSectionne.notifier).state = [];
    //Rafraichir les données de la page Cycle
    ref.refresh(allCycleProvider);
    final id = ref.read(idCycleCourant);
    if (id != null) ref.refresh(cycleProvider(id));
  }
}
