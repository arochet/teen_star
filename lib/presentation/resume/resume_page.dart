import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';

import '../../DOMAIN/observation/observation.dart';
import '../../DOMAIN/observation/observation_failure.dart';
import 'widget/appbar_analyse.dart';
import 'widget/tableau_cycle.dart';

//Analyse
final showAnalyse = StateProvider<bool>((ref) => false);

class ResumePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Either<ObservationFailure, List<Observation>>> listAsync =
        ref.watch(allObservationProviderRead);

    //LIST OBSERVATION
    final listObservationWidget = listAsync.when(
      data: (data) {
        return data.fold(
          (error) => Center(
            child: Text("Unknown Failure", style: Theme.of(context).textTheme.headline4),
          ),
          (listObservation) {
            return TableauCycle(listObservation);
          },
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text(err.toString()),
    );

    return ShowComponentFile(
      title: './lib/PRESENTATION/resume/resume_page.dart',
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              children: [
                //APPBAR
                _AppBarCycle(),
                //APPBAR_ANALYSE
                AppBarAnalyse(),
                //TABLEAU
                Expanded(child: listObservationWidget),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  context.router.push(ObservationAddRoute());
                },
                child: Text("Observation de la journée"),
                style: buttonNormalPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarCycle extends StatelessWidget {
  const _AppBarCycle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: '_AppBarCycle',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Row(children: [Icon(Icons.arrow_back, size: 16), Text(" Cycle 1")]),
            style: buttonPrimaryHideLittle,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.file_copy, size: 18),
            label: Text("PDF"),
            style: buttonLittlePrimary,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(children: [Text("Cycle 3 "), Icon(Icons.arrow_forward, size: 16)]),
            style: buttonPrimaryHideLittle,
          ),
        ],
      ),
    );
  }
}
