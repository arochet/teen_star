import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:teenstar/providers.dart';

class ButtonAjoutObservationJournee extends ConsumerWidget {
  ButtonAjoutObservationJournee({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      alignment: Alignment.bottomCenter,
      child: ShowComponentFile(
        title: 'ButtonAjoutObservationJournee',
        child: ElevatedButton(
          onPressed: () async {
            printDev("ButtonAjoutObservationJournee onPressed");
            //Affiche une boite de dialogue pour choisir si on continue le cycle ou non
            final idLastCycle = (await ref.read(lastCycleId.future)).fold((l) => null, (r) => r);
            print('idLastCycle $idLastCycle');
            if (idLastCycle != null) {
              final cycleAsync = await ref.watch(cycleProvider(idLastCycle).future);
              cycleAsync.fold((l) => showSnackbarCycleFailure(context, l), (cycle) async {
                //DIALOG pour un nouveau cycle
                //3 options : true = continuer cycle | false = nouveau cyle | null = annulation
                final bool? continuerCycle = await showDialogApp<bool?>(
                  context: context,
                  titre: "Voulez-vous continuer le Cycle en cours ?",
                  child: _DialogChoixContinuationCycle(cycle),
                );

                openPageNouvelleObservation(context, cycle, ref, continuerCycle, DateTime.now());
              });
            } else {
              //Cas ou il n'existe pas de cycle (première observation)
              openPageNouvelleObservation(context, null, ref, null, DateTime.now());
            }
          },
          child: Text("Observation de la journée"),
          style: buttonNormalPrimary,
        ),
      ),
    );
  }

  static openPageNouvelleObservation(
      BuildContext context, Cycle? cycle, WidgetRef ref, bool? continuerCycle, DateTime date) async {
    if (continuerCycle != null || cycle == null) {
      //On ouvre la page d'ajout d'observation
      await context.router
          .push(ObservationAddRoute(cycle: continuerCycle == true ? cycle : null, date: date));

      //L'observation a été ajoutée, on recharge les données
      ref.invalidate(allCycleProvider);
      ref.invalidate(lastCycleId);

      await Future.delayed(Duration(milliseconds: 50));

      final idLastCycle =
          (await ref.read(lastCycleId.future)).fold((l) => showSnackbarCycleFailure(context, l), (r) => r);

      if (idLastCycle == null) {
        throw Exception("idLastCycle is null");
      }

      //On recharge le cycle courant
      ref.invalidate(cycleProvider(idLastCycle));
      ref.read(idCycleCourant.notifier).state = idLastCycle;
    }
  }
}

class _DialogChoixContinuationCycle extends StatelessWidget {
  Cycle cycle;
  _DialogChoixContinuationCycle(
    this.cycle, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: '_DialogChoixContinuationCycle',
      child: Container(
        height: 120,
        child: Column(
          children: [
            SpaceH10(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("Nouveau Cycle"),
              style: buttonPrimaryHide,
            ),
            SpaceH10(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("Continuer Cycle ${cycle.id.getOrCrash()}"),
              style: buttonNormalPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
