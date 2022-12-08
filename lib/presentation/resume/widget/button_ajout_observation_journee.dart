import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/providers.dart';

class ButtonAjoutObservationJournee extends ConsumerWidget {
  Cycle cycle;
  ButtonAjoutObservationJournee(
    this.cycle, {
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
            //DIALOG pour nouveau cycle
            //3 options : true = continuer cycle | false = nouveau cyle | null = annulation
            final bool? continuerCycle = await showDialog<bool?>(
              context: context,
              builder: (BuildContext context) {
                return _DialogChoixContinuationCycle(cycle);
              },
            );

            if (continuerCycle != null) {
              await context.router.push(ObservationAddRoute(cycle: continuerCycle == true ? cycle : null));
              ref.refresh(allCycleProvider);
              final idCurrentCycle = ref.read(idCycleCourant);
              ref.refresh(cycleProvider(idCurrentCycle!));
            }
          },
          child: Text("Observation de la journée"),
          style: buttonNormalPrimary,
        ),
      ),
    );
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
    return AlertDialog(
      title: Text("Voulez-vous continuer le Cycle en cours ?", style: Theme.of(context).textTheme.headline4),
      content: ShowComponentFile(
        title: '_DialogChoixContinuationCycle',
        child: Container(
          height: 120,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("Nouveau Cycle"),
                style: buttonNormalPrimary,
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
      ),
    );
  }
}
