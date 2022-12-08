// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataDTO _$$_UserDataDTOFromJson(Map<String, dynamic> json) =>
    _$_UserDataDTO(
      userName: json['userName'] as String,
      dateNaissance: json['dateNaissance'] as int?,
      anneePremiereRegle: json['anneePremiereRegle'] as int,
      theme: json['theme'] as int,
    );

Map<String, dynamic> _$$_UserDataDTOToJson(_$_UserDataDTO instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'dateNaissance': instance.dateNaissance,
      'anneePremiereRegle': instance.anneePremiereRegle,
      'theme': instance.theme,
    };
