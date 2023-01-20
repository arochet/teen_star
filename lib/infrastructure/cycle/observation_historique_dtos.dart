import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_historique.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
part 'observation_historique_dtos.freezed.dart';
part 'observation_historique_dtos.g.dart';

@freezed
abstract class ObservationHistoriqueDTO implements _$ObservationHistoriqueDTO {
  const ObservationHistoriqueDTO._();

  const factory ObservationHistoriqueDTO({
    int? id,
    required int idJourneeSoleil,
    required String? couleur,
    required int idCycle,
    required int date,
    required int? jourFertile,
  }) = _ObservationHistoriqueDTO;

  ObservationHistorique toDomain() {
    return ObservationHistorique(
      id: UniqueId.fromUniqueInt(id!),
      couleur: CouleurAnalyse.fromString(couleur),
      date: DateTime.fromMillisecondsSinceEpoch(date),
      jourFertile: jourFertile == 1 ? false : true,
    );
  }

  factory ObservationHistoriqueDTO.fromJson(Map<String, dynamic> json) =>
      _$ObservationHistoriqueDTOFromJson(json);
}
