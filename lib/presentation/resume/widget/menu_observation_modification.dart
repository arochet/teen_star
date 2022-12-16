import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/providers.dart';

import 'show_observation_notes.dart';

class MenuObservationModification extends ConsumerWidget {
  final Cycle cycle;
  final Observation observation;
  const MenuObservationModification(
    this.cycle,
    this.observation, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'menu_observation_modification.dart',
      child: Container(
        height: 600,
        child: Column(
          children: [
            SpaceH10(),
            Text("Observation", style: Theme.of(context).textTheme.headline4),
            SpaceH10(),
            ElevatedButton(
              onPressed: () {},
              child: Text("Modifier couleur"),
              style: buttonNormalPrimary,
            ),
            SpaceH10(),
            ElevatedButton(
              onPressed: () async {
                await ref.read(cycleRepositoryProvider).marquerJourSommet(cycle, observation.id);
                ref.refresh(allCycleProvider);
                final id = ref.read(idCycleCourant);
                if (id != null) ref.refresh(cycleProvider(id));
                Navigator.of(context).pop();
              },
              child: Text("Marquer comme jour Sommet"),
              style: buttonNormalPrimary,
            ),
            SpaceH10(),
            ElevatedButton(
              onPressed: () {},
              child: Text("Marquer 1"),
              style: buttonNormalPrimary,
            ),
            SpaceH10(),
            ElevatedButton(
              onPressed: () {},
              child: Text("Marquer 2"),
              style: buttonNormalPrimary,
            ),
            SpaceH10(),
            ElevatedButton(
              onPressed: () {},
              child: Text("Marquer 3"),
              style: buttonNormalPrimary,
            ),
            SpaceH10(),
            ElevatedButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return ShowObservationNotes(observation: observation);
                  },
                );
              },
              child: Text("Voir les notes"),
              style: buttonNormalPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
