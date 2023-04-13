import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';

import 'widget/observation_form.dart';

class ObservationAddPage extends StatelessWidget {
  Cycle? cycle;
  DateTime date;
  ObservationAddPage(this.cycle, this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Nouvelle Observation - ${cycle != null ? "Cycle ${cycle!.id.getOrCrash()}" : "Nouveau cycle"}',
      child: ShowComponentFile(
        title: '/PRESENTATION/./resume/ajout_observation_journee/ajout_observation_journee_page.dart',
        child: ObservationFormProvider(cycle, date),
      ),
    );
  }
}
