// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataDTOImpl _$$UserDataDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserDataDTOImpl(
      userName: json['userName'] as String,
      dateNaissance: (json['dateNaissance'] as num?)?.toInt(),
      anneePremiereRegle: (json['anneePremiereRegle'] as num).toInt(),
      theme: (json['theme'] as num).toInt(),
    );

Map<String, dynamic> _$$UserDataDTOImplToJson(_$UserDataDTOImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'dateNaissance': instance.dateNaissance,
      'anneePremiereRegle': instance.anneePremiereRegle,
      'theme': instance.theme,
    };
