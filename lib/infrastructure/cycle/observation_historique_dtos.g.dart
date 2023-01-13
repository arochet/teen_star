// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observation_historique_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ObservationHistoriqueDTO _$$_ObservationHistoriqueDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ObservationHistoriqueDTO(
      id: json['id'] as int?,
      idJourneeSoleil: json['idJourneeSoleil'] as int,
      couleur: json['couleur'] as String?,
      idCycle: json['idCycle'] as int,
      date: json['date'] as int,
    );

Map<String, dynamic> _$$_ObservationHistoriqueDTOToJson(
        _$_ObservationHistoriqueDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idJourneeSoleil': instance.idJourneeSoleil,
      'couleur': instance.couleur,
      'idCycle': instance.idCycle,
      'date': instance.date,
    };
