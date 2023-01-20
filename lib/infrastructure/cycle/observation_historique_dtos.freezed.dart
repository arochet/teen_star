// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'observation_historique_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ObservationHistoriqueDTO _$ObservationHistoriqueDTOFromJson(
    Map<String, dynamic> json) {
  return _ObservationHistoriqueDTO.fromJson(json);
}

/// @nodoc
mixin _$ObservationHistoriqueDTO {
  int? get id => throw _privateConstructorUsedError;
  int get idJourneeSoleil => throw _privateConstructorUsedError;
  String? get couleur => throw _privateConstructorUsedError;
  int get idCycle => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;
  int? get jourFertile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationHistoriqueDTOCopyWith<ObservationHistoriqueDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationHistoriqueDTOCopyWith<$Res> {
  factory $ObservationHistoriqueDTOCopyWith(ObservationHistoriqueDTO value,
          $Res Function(ObservationHistoriqueDTO) then) =
      _$ObservationHistoriqueDTOCopyWithImpl<$Res, ObservationHistoriqueDTO>;
  @useResult
  $Res call(
      {int? id,
      int idJourneeSoleil,
      String? couleur,
      int idCycle,
      int date,
      int? jourFertile});
}

/// @nodoc
class _$ObservationHistoriqueDTOCopyWithImpl<$Res,
        $Val extends ObservationHistoriqueDTO>
    implements $ObservationHistoriqueDTOCopyWith<$Res> {
  _$ObservationHistoriqueDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idJourneeSoleil = null,
    Object? couleur = freezed,
    Object? idCycle = null,
    Object? date = null,
    Object? jourFertile = freezed,
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
      couleur: freezed == couleur
          ? _value.couleur
          : couleur // ignore: cast_nullable_to_non_nullable
              as String?,
      idCycle: null == idCycle
          ? _value.idCycle
          : idCycle // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      jourFertile: freezed == jourFertile
          ? _value.jourFertile
          : jourFertile // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ObservationHistoriqueDTOCopyWith<$Res>
    implements $ObservationHistoriqueDTOCopyWith<$Res> {
  factory _$$_ObservationHistoriqueDTOCopyWith(
          _$_ObservationHistoriqueDTO value,
          $Res Function(_$_ObservationHistoriqueDTO) then) =
      __$$_ObservationHistoriqueDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int idJourneeSoleil,
      String? couleur,
      int idCycle,
      int date,
      int? jourFertile});
}

/// @nodoc
class __$$_ObservationHistoriqueDTOCopyWithImpl<$Res>
    extends _$ObservationHistoriqueDTOCopyWithImpl<$Res,
        _$_ObservationHistoriqueDTO>
    implements _$$_ObservationHistoriqueDTOCopyWith<$Res> {
  __$$_ObservationHistoriqueDTOCopyWithImpl(_$_ObservationHistoriqueDTO _value,
      $Res Function(_$_ObservationHistoriqueDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idJourneeSoleil = null,
    Object? couleur = freezed,
    Object? idCycle = null,
    Object? date = null,
    Object? jourFertile = freezed,
  }) {
    return _then(_$_ObservationHistoriqueDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      idJourneeSoleil: null == idJourneeSoleil
          ? _value.idJourneeSoleil
          : idJourneeSoleil // ignore: cast_nullable_to_non_nullable
              as int,
      couleur: freezed == couleur
          ? _value.couleur
          : couleur // ignore: cast_nullable_to_non_nullable
              as String?,
      idCycle: null == idCycle
          ? _value.idCycle
          : idCycle // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      jourFertile: freezed == jourFertile
          ? _value.jourFertile
          : jourFertile // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ObservationHistoriqueDTO extends _ObservationHistoriqueDTO {
  const _$_ObservationHistoriqueDTO(
      {this.id,
      required this.idJourneeSoleil,
      required this.couleur,
      required this.idCycle,
      required this.date,
      required this.jourFertile})
      : super._();

  factory _$_ObservationHistoriqueDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ObservationHistoriqueDTOFromJson(json);

  @override
  final int? id;
  @override
  final int idJourneeSoleil;
  @override
  final String? couleur;
  @override
  final int idCycle;
  @override
  final int date;
  @override
  final int? jourFertile;

  @override
  String toString() {
    return 'ObservationHistoriqueDTO(id: $id, idJourneeSoleil: $idJourneeSoleil, couleur: $couleur, idCycle: $idCycle, date: $date, jourFertile: $jourFertile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ObservationHistoriqueDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idJourneeSoleil, idJourneeSoleil) ||
                other.idJourneeSoleil == idJourneeSoleil) &&
            (identical(other.couleur, couleur) || other.couleur == couleur) &&
            (identical(other.idCycle, idCycle) || other.idCycle == idCycle) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.jourFertile, jourFertile) ||
                other.jourFertile == jourFertile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, idJourneeSoleil, couleur, idCycle, date, jourFertile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ObservationHistoriqueDTOCopyWith<_$_ObservationHistoriqueDTO>
      get copyWith => __$$_ObservationHistoriqueDTOCopyWithImpl<
          _$_ObservationHistoriqueDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ObservationHistoriqueDTOToJson(
      this,
    );
  }
}

abstract class _ObservationHistoriqueDTO extends ObservationHistoriqueDTO {
  const factory _ObservationHistoriqueDTO(
      {final int? id,
      required final int idJourneeSoleil,
      required final String? couleur,
      required final int idCycle,
      required final int date,
      required final int? jourFertile}) = _$_ObservationHistoriqueDTO;
  const _ObservationHistoriqueDTO._() : super._();

  factory _ObservationHistoriqueDTO.fromJson(Map<String, dynamic> json) =
      _$_ObservationHistoriqueDTO.fromJson;

  @override
  int? get id;
  @override
  int get idJourneeSoleil;
  @override
  String? get couleur;
  @override
  int get idCycle;
  @override
  int get date;
  @override
  int? get jourFertile;
  @override
  @JsonKey(ignore: true)
  _$$_ObservationHistoriqueDTOCopyWith<_$_ObservationHistoriqueDTO>
      get copyWith => throw _privateConstructorUsedError;
}
