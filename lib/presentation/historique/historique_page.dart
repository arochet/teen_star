import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_error.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/tableau_historique.dart';

class HistoriquePage extends ConsumerWidget {
  const HistoriquePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Either<CycleFailure, List<Cycle>>> listAsync = ref.watch(allCycleFullProvider);

    //LIST CYCLE DTO
    return ShowComponentFile(
      title: './lib/PRESENTATION/historique/historique_page.dart',
      child: Padding(
          padding: EdgeInsets.all(10),
          child: listAsync.when(
            data: (Either<CycleFailure, List<Cycle>> data) {
              return data.fold((error) => ShowError(error.toString()), (List<Cycle> listCycle) {
                if (listCycle.length == 0) {
                  //Pas de cycle
                  return Center(
                      child: Text("Pas d'historique.",
                          style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center));
                } else {
                  listCycle = listCycle.reversed.toList();

                  //PAGE HISTORIQUE
                  return TableauHistorique(listCycle);
                }
              });
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text(err.toString()),
          )),
    );
  }
}
