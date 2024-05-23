// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CycleDTOImpl _$$CycleDTOImplFromJson(Map<String, dynamic> json) =>
    _$CycleDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      idJourneeSoleil: (json['idJourneeSoleil'] as num).toInt(),
    );

Map<String, dynamic> _$$CycleDTOImplToJson(_$CycleDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idJourneeSoleil': instance.idJourneeSoleil,
    };
