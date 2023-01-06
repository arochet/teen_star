import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
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

  List<Observation> getObservationsWithEmptyDays() {
    List<Observation> observationsWithEmptyDays = [];
    DateTime? firstDayOfCycle = this.observations.first.date;
    DateTime? lastDayOfCycle = this.observations.last.date;
    int nbDays = AppDateUtils.diffInDaysWith(lastDayOfCycle!, firstDayOfCycle!) + 1;
    for (int i = 0; i < nbDays; i++) {
      DateTime day = firstDayOfCycle.add(Duration(days: i));
      List<Observation> obs = this.observations.where((element) => element.date == day).toList();
      if (obs.length == 0) {
        observationsWithEmptyDays.add(Observation.none(day));
      } else {
        for (var o in obs) {
          observationsWithEmptyDays.add(o);
        }
      }
    }
    return observationsWithEmptyDays;
  }
}
