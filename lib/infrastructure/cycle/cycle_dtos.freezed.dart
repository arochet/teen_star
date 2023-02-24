// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CycleDTO _$CycleDTOFromJson(Map<String, dynamic> json) {
  return _CycleDTO.fromJson(json);
}

/// @nodoc
mixin _$CycleDTO {
  int? get id => throw _privateConstructorUsedError;
  int get idJourneeSoleil => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CycleDTOCopyWith<CycleDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleDTOCopyWith<$Res> {
  factory $CycleDTOCopyWith(CycleDTO value, $Res Function(CycleDTO) then) =
      _$CycleDTOCopyWithImpl<$Res, CycleDTO>;
  @useResult
  $Res call({int? id, int idJourneeSoleil});
}

/// @nodoc
class _$CycleDTOCopyWithImpl<$Res, $Val extends CycleDTO>
    implements $CycleDTOCopyWith<$Res> {
  _$CycleDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idJourneeSoleil = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      idJourneeSoleil: null == idJourneeSoleil
          ? _value.idJourneeSoleil
          : idJourneeSoleil // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CycleDTOCopyWith<$Res> implements $CycleDTOCopyWith<$Res> {
  factory _$$_CycleDTOCopyWith(
          _$_CycleDTO value, $Res Function(_$_CycleDTO) then) =
      __$$_CycleDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int idJourneeSoleil});
}

/// @nodoc
class __$$_CycleDTOCopyWithImpl<$Res>
    extends _$CycleDTOCopyWithImpl<$Res, _$_CycleDTO>
    implements _$$_CycleDTOCopyWith<$Res> {
  __$$_CycleDTOCopyWithImpl(
      _$_CycleDTO _value, $Res Function(_$_CycleDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idJourneeSoleil = null,
  }) {
    return _then(_$_CycleDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      idJourneeSoleil: null == idJourneeSoleil
          ? _value.idJourneeSoleil
          : idJourneeSoleil // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CycleDTO extends _CycleDTO {
  const _$_CycleDTO({this.id, required this.idJourneeSoleil}) : super._();

  factory _$_CycleDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CycleDTOFromJson(json);

  @override
  final int? id;
  @override
  final int idJourneeSoleil;

  @override
  String toString() {
    return 'CycleDTO(id: $id, idJourneeSoleil: $idJourneeSoleil)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CycleDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idJourneeSoleil, idJourneeSoleil) ||
                other.idJourneeSoleil == idJourneeSoleil));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idJourneeSoleil);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CycleDTOCopyWith<_$_CycleDTO> get copyWith =>
      __$$_CycleDTOCopyWithImpl<_$_CycleDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CycleDTOToJson(
      this,
    );
  }
}

abstract class _CycleDTO extends CycleDTO {
  const factory _CycleDTO({final int? id, required final int idJourneeSoleil}) =
      _$_CycleDTO;
  const _CycleDTO._() : super._();

  factory _CycleDTO.fromJson(Map<String, dynamic> json) = _$_CycleDTO.fromJson;

  @override
  int? get id;
  @override
  int get idJourneeSoleil;
  @override
  @JsonKey(ignore: true)
  _$$_CycleDTOCopyWith<_$_CycleDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
