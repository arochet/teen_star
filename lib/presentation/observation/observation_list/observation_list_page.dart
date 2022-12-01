import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';

import 'widget/panel_observation_view.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:teenstar/APPLICATION/observation/add_observation_form_notifier.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

class ObservationListPage extends ConsumerWidget {
  const ObservationListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(allObservationProvider);

    final listObservation = listAsync.when(
      data: (data) {
        return data.fold(
            (error) => Center(
                  child: Text("Unknown Failure", style: Theme.of(context).textTheme.headline4),
                ),
            (listObservation) => ListView(
                children: listObservation
                    .map<Widget>((observationObj) => PanelObservationView(observation: observationObj))
                    .toList()));
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text(err.toString()),
    );

    return MainScaffold(
        child: ShowComponentFile(
      title: './lib/PRESENTATION/./observation/observation_list/observation_list_page.dart',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: listObservation,
      ),
    ));
  }
}
