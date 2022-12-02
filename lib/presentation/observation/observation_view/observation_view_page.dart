/* import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';

import 'widget/panel_observation_view.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';

import 'widget/panel_observation_view.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:teenstar/APPLICATION/observation/add_observation_form_notifier.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

class ObservationViewPage extends ConsumerWidget {
  final UniqueId id;
  const ObservationViewPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(oneObservationProvider(id));

    final observationWidget = listAsync.when(
      data: (data) {
        return data.fold(
            (error) => Center(
                  child: Text("Unknown Failure", style: Theme.of(context).textTheme.headline4),
                ),
            (observation) => PanelObservationView(observation: observation));
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text(err.toString()),
    );

    return MainScaffold(
        child: ShowComponentFile(
      title: './lib/PRESENTATION/./observation/observation_view/observation_view_page.dart',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            observationWidget,
            SpaceH10(),
            ElevatedButton(
              onPressed: () {
                ref.read(observationRepositoryProvider).delete(id);
                context.router.pop();
              },
              child: Text(AppLocalizations.of(context)!.supprimer),
              style: buttonNormalRemove,
            ),
          ],
        ),
      ),
    ));
  }
}
 */