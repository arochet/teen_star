import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_historique_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';

import 'value_objects.dart';

part 'cycle_historique.freezed.dart';

@freezed
abstract class CycleHistorique with _$CycleHistorique {
  const CycleHistorique._();

  const factory CycleHistorique({
    required UniqueId id,
    required List<ObservationHistorique> observations,
    required UniqueId idJourneeSoleil,
  }) = _CycleHistorique;

  factory CycleHistorique.empty() => CycleHistorique(
        id: UniqueId(),
        observations: [],
        idJourneeSoleil: UniqueId(),
      );

  factory CycleHistorique.fromListDTOwithEmptyDays(List<ObservationHistoriqueDTO> list, int id) {
    List<ObservationHistorique> observationsWithEmptyDays = [];
    DateTime? firstDayOfCycle = list.first.toDomain().date!.toDate();

    DateTime lastDayOfCycleWithEmptyDays = firstDayOfCycle;
    for (var observation in list) {
      if (observation.toDomain().date!.isAfter(lastDayOfCycleWithEmptyDays)) {
        lastDayOfCycleWithEmptyDays = observation.toDomain().date!;
      }
    }

    int nbDays = AppDateUtils.diffInDaysWith(lastDayOfCycleWithEmptyDays, firstDayOfCycle) + 1;
    for (int i = 0; i < nbDays; i++) {
      DateTime day = firstDayOfCycle.add(Duration(days: i));
      List<ObservationHistorique> obs = list
          .map((e) => e.toDomain())
          .where((element) => element.date?.toDate().isSameDayAs(day) == true)
          .toList();
      if (obs.length == 0) {
        observationsWithEmptyDays.add(ObservationHistorique.empty());
      } else {
        for (var o in obs) {
          observationsWithEmptyDays.add(o);
        }
      }
    }

    return CycleHistorique(
      id: UniqueId.fromUniqueInt(id),
      observations: observationsWithEmptyDays,
      idJourneeSoleil: list.length > 0 ? UniqueId.fromUniqueInt(list.first.idJourneeSoleil) : UniqueId(),
    );
  }
}

@freezed
abstract class ObservationHistorique with _$ObservationHistorique {
  const ObservationHistorique._();

  const factory ObservationHistorique({
    required UniqueId id,
    required CouleurAnalyse? couleur,
    required DateTime? date,
  }) = _ObservationHistorique;

  factory ObservationHistorique.empty() => ObservationHistorique(
        id: UniqueId(),
        couleur: null,
        date: null,
      );

  bool get isEmpty => couleur == null && date == null;
}
