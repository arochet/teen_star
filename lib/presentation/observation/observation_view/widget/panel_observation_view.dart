import 'package:teenstar/DOMAIN/observation/observation.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';

class PanelObservationView extends StatelessWidget {
  final Observation observation;
  const PanelObservationView({Key? key, required this.observation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPanel(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("date : ${observation.date.toString()}", style: Theme.of(context).textTheme.bodyText1),
            Text("couleur : ${observation.couleur.getOrCrash()}",
                style: Theme.of(context).textTheme.bodyText1),
            Text("analyse : ${observation.analyse.getOrCrash()}",
                style: Theme.of(context).textTheme.bodyText1),
            Text("sensation : ${observation.sensation.getOrCrash()}",
                style: Theme.of(context).textTheme.bodyText1),
            Text("sensationsAutre : ${observation.sensationsAutre}",
                style: Theme.of(context).textTheme.bodyText1),
            Text("sang : ${observation.sang.getOrCrash()}", style: Theme.of(context).textTheme.bodyText1),
            Text("mucus : ${observation.mucus.getOrCrash()}", style: Theme.of(context).textTheme.bodyText1),
            Text("mucusAutre : ${observation.mucusAutre}", style: Theme.of(context).textTheme.bodyText1),
            Text("douleurs : ${observation.douleurs.map((e) => e.getOrCrash()).toList()}",
                style: Theme.of(context).textTheme.bodyText1),
            Text("douleursAutre : ${observation.douleursAutre}",
                style: Theme.of(context).textTheme.bodyText1),
            Text("evenements : ${observation.evenements.map((e) => e.getOrCrash()).toList()}",
                style: Theme.of(context).textTheme.bodyText1),
            Text("temperatureBasale : ${observation.temperatureBasale}",
                style: Theme.of(context).textTheme.bodyText1),
            Text("humeur : ${observation.humeur.getOrCrash()}", style: Theme.of(context).textTheme.bodyText1),
            Text("humeurAutre : ${observation.humeurAutre}", style: Theme.of(context).textTheme.bodyText1),
            Text("notesConfidentielles : ${observation.notesConfidentielles}",
                style: Theme.of(context).textTheme.bodyText1),
            Text("commentaireAnimatrice : ${observation.commentaireAnimatrice}",
                style: Theme.of(context).textTheme.bodyText1),
//insert-info
          ],
        ),
      ),
    );
  }
}
