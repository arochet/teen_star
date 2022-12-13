import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_historique_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_error.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/tableau_historique.dart';

class HistoriquePage extends ConsumerWidget {
  const HistoriquePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Either<CycleFailure, List<ObservationHistoriqueDTO>>> listAsync =
        ref.watch(allCycleHistoriqueProvider);

    //LIST CYCLE DTO
    final listCycleWidget = listAsync.when(
      data: (data) {
        return data.fold(
          (error) => ShowError(error.toString()),
          (List<ObservationHistoriqueDTO> listCyclesDTO) {
            if (listCyclesDTO.length == 0) {
              //Pas de cycle
              return Center(
                  child: Text("Pas de Cycle\nVeuillez ajoutez une nouvelle observation",
                      style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center));
            } else {
              print('listCyclesDTO ${listCyclesDTO.length}');
              return TableauHistorique(listCyclesDTO);
            }
          },
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text(err.toString()),
    );
    return ShowComponentFile(
      title: './lib/PRESENTATION/historique/historique_page.dart',
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {},
              child: Text("Renvoyer Cycle 9 vers 8"),
              style: buttonNormalPrimary,
            ),
            Expanded(
              child: listCycleWidget,
            ),
          ],
        ),
      ),
    );
  }
}
