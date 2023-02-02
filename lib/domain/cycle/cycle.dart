import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';

import 'observation.dart';

part 'cycle.freezed.dart';

@freezed
abstract class Cycle with _$Cycle {
  const Cycle._();

  const factory Cycle({
    required UniqueId id,
    required List<Observation> observations,
    required UniqueId idJourneeSoleil,
  }) = _Cycle;

  factory Cycle.empty() => Cycle(
        id: UniqueId(),
        observations: [],
        idJourneeSoleil: UniqueId(),
      );

  int getDayOfObservation(Observation obs) {
    DateTime? firstDayOfCycle = this.observations.first.date;
    return AppDateUtils.diffInDaysWith(obs.date!, firstDayOfCycle!) + 1;
  }

  List<Observation> getObservationsWithEmptyDays({allowDoubleDays = true}) {
    List<Observation> observationsWithEmptyDays = [];
    if (this.observations.length == 0) return [];
    DateTime? firstDayOfCycle = this.observations.first.date?.toDate();

    DateTime lastDayOfCycleWithEmptyDays = firstDayOfCycle!;
    for (var observation in this.observations) {
      if (observation.date!.isAfter(lastDayOfCycleWithEmptyDays)) {
        lastDayOfCycleWithEmptyDays = observation.date!;
      }
    }

    int nbDays = AppDateUtils.diffInDaysWith(lastDayOfCycleWithEmptyDays, firstDayOfCycle) + 1;
    for (int i = 0; i < nbDays; i++) {
      DateTime day = firstDayOfCycle.add(Duration(days: i));
      List<Observation> obs =
          this.observations.where((element) => element.date?.toDate().isSameDayAs(day) == true).toList();
      if (obs.length == 0) {
        observationsWithEmptyDays.add(Observation.none(day));
      } else {
        if (allowDoubleDays) {
          for (var o in obs) {
            observationsWithEmptyDays.add(o);
          }
        } else {
          observationsWithEmptyDays.add(obs.last);
        }
      }
    }
    return observationsWithEmptyDays;
  }

  factory Cycle.fromListDTOwithEmptyDays(List<ObservationDTO> listAll) {
    int id = listAll.first.idCycle!;
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

    return Cycle(
      id: UniqueId.fromUniqueInt(id),
      observations: observationsWithEmptyDays,
      idJourneeSoleil:
          list.length > 0 ? UniqueId.fromUniqueInt(list.first.idJourneeSoleil!) : UniqueId.fromUniqueInt(-1),
    );
  }

  static UniqueId? lastId(List<Cycle> list) {
    if (list.length == 0) {
      print('List is empty for lastId');
      return null;
    }
    UniqueId lastId = list.last.id;
    for (var cycle in list) {
      if (cycle.id.getOrCrash() > lastId.getOrCrash()) {
        lastId = cycle.id;
      }
    }
    return lastId;
  }
}
