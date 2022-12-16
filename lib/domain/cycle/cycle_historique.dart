import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_historique_dtos.dart';

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

  factory CycleHistorique.fromListDTO(List<ObservationHistoriqueDTO> list, int id) {
    List<ObservationHistorique> observations = [];
    UniqueId idJourneeSoleil = UniqueId(); //C est pas bon ca !!!!

    for (var obs in list) {
      if (obs.idCycle == id) {
        observations.add(obs.toDomain());
      }
    }

    return CycleHistorique(
      id: UniqueId.fromUniqueInt(id),
      observations: observations,
      idJourneeSoleil: idJourneeSoleil,
    );
  }
}

@freezed
abstract class ObservationHistorique with _$ObservationHistorique {
  const ObservationHistorique._();

  const factory ObservationHistorique({
    required UniqueId id,
    required CouleurAnalyse? couleur,
  }) = _ObservationHistorique;

  factory ObservationHistorique.empty() => ObservationHistorique(
        id: UniqueId(),
        couleur: null,
      );
}
