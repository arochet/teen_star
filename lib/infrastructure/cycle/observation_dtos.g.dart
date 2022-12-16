// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observation_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ObservationDTO _$$_ObservationDTOFromJson(Map<String, dynamic> json) =>
    _$_ObservationDTO(
      id: json['id'] as int?,
      date: json['date'] as int?,
      couleur: json['couleur'] as String?,
      analyse: json['analyse'] as String?,
      sensation: json['sensation'] as String?,
      sensationsAutre: json['sensationsAutre'] as String?,
      sang: json['sang'] as String?,
      mucus: json['mucus'] as String?,
      mucusAutre: json['mucusAutre'] as String?,
      douleurs: json['douleurs'] as String,
      douleursAutre: json['douleursAutre'] as String?,
      evenements: json['evenements'] as String,
      temperatureBasale: json['temperatureBasale'] as int?,
      humeur: json['humeur'] as String?,
      humeurAutre: json['humeurAutre'] as String?,
      notesConfidentielles: json['notesConfidentielles'] as String?,
      commentaireAnimatrice: json['commentaireAnimatrice'] as String?,
      marque: json['marque'] as int?,
      idCycle: json['idCycle'] as int?,
    );

Map<String, dynamic> _$$_ObservationDTOToJson(_$_ObservationDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'couleur': instance.couleur,
      'analyse': instance.analyse,
      'sensation': instance.sensation,
      'sensationsAutre': instance.sensationsAutre,
      'sang': instance.sang,
      'mucus': instance.mucus,
      'mucusAutre': instance.mucusAutre,
      'douleurs': instance.douleurs,
      'douleursAutre': instance.douleursAutre,
      'evenements': instance.evenements,
      'temperatureBasale': instance.temperatureBasale,
      'humeur': instance.humeur,
      'humeurAutre': instance.humeurAutre,
      'notesConfidentielles': instance.notesConfidentielles,
      'commentaireAnimatrice': instance.commentaireAnimatrice,
      'marque': instance.marque,
      'idCycle': instance.idCycle,
    };
