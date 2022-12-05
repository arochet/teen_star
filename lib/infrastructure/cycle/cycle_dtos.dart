import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
part 'cycle_dtos.freezed.dart';
part 'cycle_dtos.g.dart';

@freezed
abstract class CycleDTO implements _$CycleDTO {
  const CycleDTO._();

  const factory CycleDTO({
    int? id,
    required int idJourneeSoleil,
  }) = _CycleDTO;

  factory CycleDTO.fromDomain(Cycle obj) {
    return CycleDTO(
      id: obj.id.getOrCrash(),
      idJourneeSoleil: obj.idJourneeSoleil.getOrCrash(),
    );
  }

  Cycle toDomain(List<Observation> observations) {
    return Cycle(
      id: UniqueId.fromUniqueInt(id!),
      observations: observations,
      idJourneeSoleil: UniqueId.fromUniqueInt(idJourneeSoleil),
    );
  }

  factory CycleDTO.fromJson(Map<String, dynamic> json) => _$CycleDTOFromJson(json);
}
