import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/_core/router.gr.dart';
import '../cycles_page.dart';
import 'modifier_couleur_dialog.dart';
import 'show_observation_notes.dart';

afficherModalModificationObservation(
    BuildContext context, WidgetRef ref, Observation observation, Cycle cycle) {
  printDev();
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: Text(
          "${AppLocalizations.of(context)!.observation_of_d}${cycle.getDayOfObservation(observation, cycle.getDateObservationFirstDay())}"),
      message: Text("${AppDateUtils.formatDate(observation.date, "EEEE d MMMM yyyy")}"),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () async {
          Navigator.pop(context);
        },
        child: Text(AppLocalizations.of(context)!.cancel),
      ),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context)!.read_the_notes),
          onPressed: () async {
            await showDialogApp<void>(
              context: context,
              titre:
                  "${AppLocalizations.of(context)!.observation_of} ${AppDateUtils.formatDate(observation.date)}",
              child: ShowObservationNotes(observation: observation),
              actions: <Widget>[
                /* TextButton(
                  style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
                  child: const Text('Notes confidentielles'),
                  onPressed: () {
                    ouvrirNoteConfidentielles(context, ref, observation);
                  },
                ),
                SizedBox(width: 20), */
                TextButton(
                    style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            );
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            await ref.read(cycleRepositoryProvider).marquerJourSommet(cycle, observation.id);
            ref.read(showAnalyse.notifier).state = true;
            refreshAndPop(context, ref);
          },
          child: Text(AppLocalizations.of(context)!.mark_as_peak_day),
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            await showDialogApp<void>(
              context: context,
              child: ModifierCouleurDialog([observation]),
              titre: AppLocalizations.of(context)!.choose_colour,
            );
            Navigator.pop(context);
          },
          child: Text(AppLocalizations.of(context)!.change_colour),
        ),
        CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context)!.mark_1),
          onPressed: () async {
            await ref.read(cycleRepositoryProvider).marquerComme(observation, 1);
            ref.read(showAnalyse.notifier).state = true;
            refreshAndPop(context, ref);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context)!.mark_2),
          onPressed: () async {
            await ref.read(cycleRepositoryProvider).marquerComme(observation, 2);
            ref.read(showAnalyse.notifier).state = true;
            refreshAndPop(context, ref);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context)!.mark_3),
          onPressed: () async {
            await ref.read(cycleRepositoryProvider).marquerComme(observation, 3);
            ref.read(showAnalyse.notifier).state = true;
            refreshAndPop(context, ref);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context)!.delete_point_interrogation),
          onPressed: () async {
            printDev();
            await ref.read(cycleRepositoryProvider).enleverPointInterrogation([observation], true);
            ref.read(showAnalyse.notifier).state = true;
            refreshAndPop(context, ref);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context)!.modify_daily_observation),
          onPressed: () async {
            printDev();
            //On ouvre la page d'ajout d'observation
            await context.router
                .push(ObservationAddRoute(cycle: cycle, date: observation.date!, observation: observation));
            refreshAndPop(context, ref);
          },
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            await ref.read(cycleRepositoryProvider).marquerJourSommet(cycle, UniqueId.fromUniqueInt(-1));
            ref.read(showAnalyse.notifier).state = true;
            ref.refresh(allCycleProvider);
            final id = ref.read(idCycleCourant);
            if (id != null) ref.refresh(cycleProvider(id));
            Navigator.pop(context);
          },
          child: Text(AppLocalizations.of(context)!.cancel_peak_day),
        ),
        CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context)!.cancel_colour),
          onPressed: () async {
            await ref
                .read(cycleRepositoryProvider)
                .modifierCouleurAnalyse(observation, CouleurAnalyseState.none);
            ref.read(showAnalyse.notifier).state = true;
            refreshAndPop(context, ref);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(AppLocalizations.of(context)!.cancel_marking),
          onPressed: () async {
            await ref.read(cycleRepositoryProvider).marquerComme(observation, 0);
            await ref.read(cycleRepositoryProvider).enleverPointInterrogation([observation], false);
            ref.read(showAnalyse.notifier).state = true;
            refreshAndPop(context, ref);
          },
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () async {
            final res = await showDialogChoix(
                context, AppLocalizations.of(context)!.do_you_really_want_to_delete_this_observation,
                positiveText: AppLocalizations.of(context)!.delete,
                negativeText: AppLocalizations.of(context)!.cancel,
                isDanger: true);

            if (res == true) {
              await ref.read(cycleRepositoryProvider).delete(observation.id);
              refreshAndPop(context, ref);
            }
          },
          child: Text(AppLocalizations.of(context)!.delete_observation_of_the_day),
        ),
      ],
    ),
  );
}

/* 
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
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: colorpanel(400))),
          SpaceH10(),
          ElevatedButton(
            onPressed: () async {
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
          Text("Marquer comme", style: Theme.of(context).textTheme.titleSmall),
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

}
 */

refreshAndPop(BuildContext context, WidgetRef ref) {
  ref.refresh(allCycleProvider);
  final id = ref.read(idCycleCourant);
  if (id != null) ref.refresh(cycleProvider(id));
  Navigator.of(context).pop();
}
