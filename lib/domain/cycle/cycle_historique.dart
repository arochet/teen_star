/* import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';

import 'observation.dart';
import 'value_objects.dart';

part 'cycle_historique.freezed.dart';

@freezed
abstract class CycleHistorique with _$CycleHistorique {
  const CycleHistorique._();

  const factory CycleHistorique({
    required UniqueId id,
    required List<Observation> observations,
    required UniqueId idJourneeSoleil,
  }) = _CycleHistorique;

  factory CycleHistorique.empty() => CycleHistorique(
        id: UniqueId(),
        observations: [],
        idJourneeSoleil: UniqueId(),
      );

  factory CycleHistorique.fromListDTOwithEmptyDays(List<ObservationDTO> listAll, int id) {
    List<Observation> observationsWithEmptyDays = [];
    List<ObservationDTO> list = listAll.where((element) => element.idCycle == id).toList();
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
      List<Observation> obs = list
          .map((e) => e.toDomain())
          .where((element) => element.date?.toDate().isSameDayAs(day) == true)
          .toList();
      if (obs.length == 0) {
        observationsWithEmptyDays.add(Observation.empty());
      } else {
        observationsWithEmptyDays.add(obs.last);
        /* for (var o in obs) {
          observationsWithEmptyDays.add(o);
        } */
      }
    }

    return CycleHistorique(
      id: UniqueId.fromUniqueInt(id),
      observations: observationsWithEmptyDays,
      idJourneeSoleil: list.length > 0 ? UniqueId.fromUniqueInt(list.first.idJourneeSoleil) : UniqueId(),
    );
  }

  static UniqueId lastHistoriqueId(List<CycleHistorique> list) {
    UniqueId lastId = list.last.id;
    for (var cycle in list) {
      if (cycle.id.getOrCrash() > lastId.getOrCrash()) {
        lastId = cycle.id;
      }
    }
    return lastId;
  }
}
 */