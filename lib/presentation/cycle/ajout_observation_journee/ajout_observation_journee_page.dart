import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';

import 'widget/observation_form.dart';

class ObservationAddPage extends StatelessWidget {
  Cycle? cycle;
  DateTime date;
  ObservationAddPage(this.cycle, this.date, {Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      key: _scaffoldKey,
      title: 'Nouvelle Observation',
      child: ShowComponentFile(
        title: '/PRESENTATION/./resume/ajout_observation_journee/ajout_observation_journee_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ObservationFormProvider(cycle, date),
        ),
      ),
    );
  }
}
