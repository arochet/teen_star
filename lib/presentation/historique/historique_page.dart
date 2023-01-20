import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_historique.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_historique_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_error.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
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
    return ShowComponentFile(
      title: './lib/PRESENTATION/historique/historique_page.dart',
      child: Padding(
          padding: EdgeInsets.all(10),
          child: listAsync.when(
            data: (data) {
              return data.fold(
                (error) => ShowError(error.toString()),
                (List<ObservationHistoriqueDTO> listObservation) {
                  if (listObservation.length == 0) {
                    //Pas de cycle
                    return Center(
                        child: Text("Ajoutez votre première observation !",
                            style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center));
                  } else {
                    //Conversion des observations en Cycle
                    List<CycleHistorique> listCycle = [];

                    //Créer une liste de Cycle avec les observations
                    for (var observation in listObservation) {
                      bool found = false;
                      for (var cycle in listCycle) {
                        if (found == false) {
                          if (observation.idCycle == cycle.id.getOrCrash()) {
                            found = true;
                          }
                        }
                      }

                      if (found == false) {
                        listCycle.add(
                            CycleHistorique.fromListDTOwithEmptyDays(listObservation, observation.idCycle));
                      }
                    }
                    listCycle = listCycle.reversed.toList();

                    //PAGE HISTORIQUE
                    return TableauHistorique(listCycle);
                  }
                },
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text(err.toString()),
          )),
    );
  }
}
