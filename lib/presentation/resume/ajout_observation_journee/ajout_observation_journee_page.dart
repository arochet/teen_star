import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';

import 'widget/observation_form.dart';

class ObservationAddPage extends StatelessWidget {
  Cycle? cycle;
  ObservationAddPage(this.cycle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Nouvelle Observation',
      child: ShowComponentFile(
        title: '/PRESENTATION/./resume/ajout_observation_journee/observation_add_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ObservationFormProvider(cycle),
        ),
      ),
    );
  }
}
