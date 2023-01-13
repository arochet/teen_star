import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';
import 'package:teenstar/providers.dart';

import 'modifier_couleur_dialog.dart';
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
    return Container(
      height: 420,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${AppDateUtils.formatDate(observation.date, "EEEE d MMMM yyyy")}",
              style: Theme.of(context).textTheme.headline5?.copyWith(color: colorpanel(400))),
          SpaceH10(),
          ElevatedButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return ModifierCouleurDialog(observation);
                },
              );
            },
            child: Text("Modifier couleur"),
            style: buttonNormalPrimaryFull,
          ),
          SpaceH10(),
          ElevatedButton.icon(
            onPressed: () async {
              await ref.read(cycleRepositoryProvider).marquerJourSommet(cycle, observation.id);
              refreshAndPop(context, ref);
            },
            label: Text("Marquer comme jour Sommet"),
            icon: Image(image: AssetImage(AssetsPath.icon_fleur_sommet), height: 24),
            style: buttonNormalPrimaryFull,
          ),
          SpaceH10(),
          Text("Marquer comme", style: Theme.of(context).textTheme.headline5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await ref.read(cycleRepositoryProvider).marquerComme(observation, 0);
                  refreshAndPop(context, ref);
                },
                child: Icon(Icons.do_not_disturb, size: 16),
                style: buttonNormalPrimary,
              ),
              ElevatedButton(
                onPressed: () async {
                  await ref.read(cycleRepositoryProvider).marquerComme(observation, 1);
                  refreshAndPop(context, ref);
                },
                child: Text("1"),
                style: buttonNormalPrimary,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await ref.read(cycleRepositoryProvider).marquerComme(observation, 2);
                  refreshAndPop(context, ref);
                },
                child: Text("2"),
                style: buttonNormalPrimary,
              ),
              ElevatedButton(
                onPressed: () async {
                  await ref.read(cycleRepositoryProvider).marquerComme(observation, 3);
                  refreshAndPop(context, ref);
                },
                child: Text("3"),
                style: buttonNormalPrimary,
              ),
            ],
          ),
          SpaceH10(),
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
            style: buttonNormalPrimaryFull,
          ),
          SpaceH10(),
          ElevatedButton(
            onPressed: () async {
              final res = await showDialogChoix(context, "Voulez-vous vraiment supprimer cette observation ?",
                  positiveText: 'Supprimer', negativeText: 'Annuler', isDanger: true);

              if (res == true) {
                await ref.read(cycleRepositoryProvider).delete(observation.id);
                refreshAndPop(context, ref);
              }
            },
            child: Text("Supprimer"),
            style: buttonNormalRemove,
          ),
        ],
      ),
    );
  }

  refreshAndPop(BuildContext context, WidgetRef ref) {
    ref.refresh(allCycleProvider);
    final id = ref.read(idCycleCourant);
    if (id != null) ref.refresh(cycleProvider(id));
    Navigator.of(context).pop();
  }
}
