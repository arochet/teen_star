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
abstract class _$$CycleDTOImplCopyWith<$Res>
    implements $CycleDTOCopyWith<$Res> {
  factory _$$CycleDTOImplCopyWith(
          _$CycleDTOImpl value, $Res Function(_$CycleDTOImpl) then) =
      __$$CycleDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int idJourneeSoleil});
}

/// @nodoc
class __$$CycleDTOImplCopyWithImpl<$Res>
    extends _$CycleDTOCopyWithImpl<$Res, _$CycleDTOImpl>
    implements _$$CycleDTOImplCopyWith<$Res> {
  __$$CycleDTOImplCopyWithImpl(
      _$CycleDTOImpl _value, $Res Function(_$CycleDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idJourneeSoleil = null,
  }) {
    return _then(_$CycleDTOImpl(
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
class _$CycleDTOImpl extends _CycleDTO {
  const _$CycleDTOImpl({this.id, required this.idJourneeSoleil}) : super._();

  factory _$CycleDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CycleDTOImplFromJson(json);

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
            other is _$CycleDTOImpl &&
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
  _$$CycleDTOImplCopyWith<_$CycleDTOImpl> get copyWith =>
      __$$CycleDTOImplCopyWithImpl<_$CycleDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CycleDTOImplToJson(
      this,
    );
  }
}

abstract class _CycleDTO extends CycleDTO {
  const factory _CycleDTO({final int? id, required final int idJourneeSoleil}) =
      _$CycleDTOImpl;
  const _CycleDTO._() : super._();

  factory _CycleDTO.fromJson(Map<String, dynamic> json) =
      _$CycleDTOImpl.fromJson;

  @override
  int? get id;
  @override
  int get idJourneeSoleil;
  @override
  @JsonKey(ignore: true)
  _$$CycleDTOImplCopyWith<_$CycleDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
