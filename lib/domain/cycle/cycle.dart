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
    required UniqueId idJourneeSoleil, //Jour sommet du cycle.
  }) = _Cycle;

  factory Cycle.empty() => Cycle(
        id: UniqueId(),
        observations: [],
        idJourneeSoleil: UniqueId(),
      );

  ///Renvoie si l'observation est le jour de sommet du cycle.
  bool isJourneeSoleil(Observation obs) {
    return obs.id == this.idJourneeSoleil;
  }

  /// Renvoie ne numéro du jour de l'observation dans le cycle. Exemple 5 pour le 5ème jour du cycle.
  int getDayOfObservation(Observation obs, DateTime? dateFirstDayOfCycle) {
    DateTime? firstDayOfCycle = dateFirstDayOfCycle ?? this.observations.first.date;
    return AppDateUtils.diffInDaysWith(obs.date!, firstDayOfCycle!) + 1;
  }

  DateTime? getDateObservationFirstDay() {
    if (this.observations.length == 0) {
      return null;
    }
    Observation? firstObs = this.observations.first;
    for (var obs in this.observations) {
      if (firstObs?.date?.isAfter(obs.date!) == true) {
        firstObs = obs;
      }
    }
    return firstObs?.date;
  }

  //Renvoie la liste des observations avec les jours vides entre les observations.
  //La fille peut renseigner après coup les jours vides.
  List<Observation> getObservationsWithEmptyDays({allowDoubleDays = true}) {
    List<Observation> observationsWithEmptyDays = [];
    if (this.observations.length == 0) return [];
    DateTime? firstDayOfCycle = this.observations.first.date?.toDate();

    DateTime lastDayOfCycleWithEmptyDays = firstDayOfCycle!;
    for (var observation in this.observations) {
      if (observation.date!.isAfter(lastDayOfCycleWithEmptyDays)) {
        lastDayOfCycleWithEmptyDays = observation.date!;
      } else if (observation.date!.isBefore(firstDayOfCycle!)) {
        firstDayOfCycle = observation.date;
      }
    }

    int nbDays = AppDateUtils.diffInDaysWith(lastDayOfCycleWithEmptyDays, firstDayOfCycle!) + 1;
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

  //Nombre de jours de cycle
  int getNumberOfDays() {
    List<Observation> observationsWithEmptyDays = [];
    if (this.observations.length == 0) return 0;
    DateTime? firstDayOfCycle = this.observations.first.date?.toDate();

    DateTime lastDayOfCycleWithEmptyDays = firstDayOfCycle!;
    for (var observation in this.observations) {
      if (observation.date!.isAfter(lastDayOfCycleWithEmptyDays)) {
        lastDayOfCycleWithEmptyDays = observation.date!;
      }
    }
    int nbDays = AppDateUtils.diffInDaysWith(lastDayOfCycleWithEmptyDays, firstDayOfCycle) + 1;
    return nbDays;
  }

  List<List<Observation>> getListObservationByRange() {
    List<List<Observation>> list = [];
    int nbDays = this.getNumberOfDays();
    List<Observation> listObservation = this.getObservationsWithEmptyDays();
    const nbCyleDisplay = 35;

    //Return list observation by range of 35
    int nbRange = (nbDays / nbCyleDisplay).ceil();

    for (int i = 0; i < nbRange; i++) {
      int start = i * nbCyleDisplay;
      int end = (i + 1) * nbCyleDisplay;
      if (end > nbDays) {
        end = nbDays;
      }
      list.add(listObservation.sublist(start, end));
    }

    return list;
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

  DateTime? getDateOfLastObservation() {
    if (this.observations.length == 0) {
      return null;
    }
    DateTime? lastDate = this.observations.first.date;
    for (var obs in this.observations) {
      if (obs.date!.isAfter(lastDate!)) {
        lastDate = obs.date;
      }
    }
    return lastDate;
  }
}
