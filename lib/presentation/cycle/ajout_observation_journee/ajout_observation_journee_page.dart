import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widget/observation_form.dart';

class ObservationAddPage extends StatelessWidget {
  Cycle? cycle;
  DateTime date;
  Observation? observation;
  ObservationAddPage(this.cycle, this.date, {Key? key, this.observation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title:
          '${AppLocalizations.of(context)!.new_observation_cycle} ${cycle != null ? "${cycle!.id.getOrCrash()}" : "Nouveau cycle"}',
      child: ShowComponentFile(
        title: '/PRESENTATION/cycle/ajout_observation_journee/ajout_observation_journee_page.dart',
        child: ObservationFormProvider(cycle, date, observation: observation),
      ),
    );
  }
}
