import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/providers.dart';

import '../cycles_page.dart';

class ModifierCouleurDialog extends StatelessWidget {
  final List<Observation> observations;
  const ModifierCouleurDialog(this.observations, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
        title: 'ModifierCouleurDialog',
        child: Container(
          height: 100,
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: CouleurAnalyseState.values
                  .where((element) =>
                      element != CouleurAnalyseState.none &&
                      element != CouleurAnalyseState.vert &&
                      element != CouleurAnalyseState.invalide)
                  .map((CouleurAnalyseState state) => _ButtonCouleur(observations, state))
                  .toList(),
            ),
          ),
        ));
  }
}

class _ButtonCouleur extends ConsumerWidget {
  final List<Observation> observations;
  CouleurAnalyseState state;
  _ButtonCouleur(
    this.observations,
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () async {
          observations.forEach((element) async {
            await ref.read(cycleRepositoryProvider).modifierCouleurAnalyse(element, state);
          });
          Navigator.of(context).pop(state);
          ref.read(showAnalyse.notifier).state = true;
          ref.refresh(allCycleProvider);
          final id = ref.read(idCycleCourant);
          if (id != null) ref.refresh(cycleProvider(id));
        },
        child: Container(
          width: 50,
          height: 50,
          color: state.toColor(),
        ),
      ),
    );
  }
}
