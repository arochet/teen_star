// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cycle_historique.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CycleHistorique {
  UniqueId get id => throw _privateConstructorUsedError;
  List<ObservationHistorique> get observations =>
      throw _privateConstructorUsedError;
  UniqueId get idJourneeSoleil => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CycleHistoriqueCopyWith<CycleHistorique> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleHistoriqueCopyWith<$Res> {
  factory $CycleHistoriqueCopyWith(
          CycleHistorique value, $Res Function(CycleHistorique) then) =
      _$CycleHistoriqueCopyWithImpl<$Res, CycleHistorique>;
  @useResult
  $Res call(
      {UniqueId id,
      List<ObservationHistorique> observations,
      UniqueId idJourneeSoleil});
}

/// @nodoc
class _$CycleHistoriqueCopyWithImpl<$Res, $Val extends CycleHistorique>
    implements $CycleHistoriqueCopyWith<$Res> {
  _$CycleHistoriqueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? observations = null,
    Object? idJourneeSoleil = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      observations: null == observations
          ? _value.observations
          : observations // ignore: cast_nullable_to_non_nullable
              as List<ObservationHistorique>,
      idJourneeSoleil: null == idJourneeSoleil
          ? _value.idJourneeSoleil
          : idJourneeSoleil // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CycleHistoriqueCopyWith<$Res>
    implements $CycleHistoriqueCopyWith<$Res> {
  factory _$$_CycleHistoriqueCopyWith(
          _$_CycleHistorique value, $Res Function(_$_CycleHistorique) then) =
      __$$_CycleHistoriqueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      List<ObservationHistorique> observations,
      UniqueId idJourneeSoleil});
}

/// @nodoc
class __$$_CycleHistoriqueCopyWithImpl<$Res>
    extends _$CycleHistoriqueCopyWithImpl<$Res, _$_CycleHistorique>
    implements _$$_CycleHistoriqueCopyWith<$Res> {
  __$$_CycleHistoriqueCopyWithImpl(
      _$_CycleHistorique _value, $Res Function(_$_CycleHistorique) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? observations = null,
    Object? idJourneeSoleil = null,
  }) {
    return _then(_$_CycleHistorique(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      observations: null == observations
          ? _value._observations
          : observations // ignore: cast_nullable_to_non_nullable
              as List<ObservationHistorique>,
      idJourneeSoleil: null == idJourneeSoleil
          ? _value.idJourneeSoleil
          : idJourneeSoleil // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc

class _$_CycleHistorique extends _CycleHistorique {
  const _$_CycleHistorique(
      {required this.id,
      required final List<ObservationHistorique> observations,
      required this.idJourneeSoleil})
      : _observations = observations,
        super._();

  @override
  final UniqueId id;
  final List<ObservationHistorique> _observations;
  @override
  List<ObservationHistorique> get observations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_observations);
  }

  @override
  final UniqueId idJourneeSoleil;

  @override
  String toString() {
    return 'CycleHistorique(id: $id, observations: $observations, idJourneeSoleil: $idJourneeSoleil)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CycleHistorique &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._observations, _observations) &&
            (identical(other.idJourneeSoleil, idJourneeSoleil) ||
                other.idJourneeSoleil == idJourneeSoleil));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_observations), idJourneeSoleil);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CycleHistoriqueCopyWith<_$_CycleHistorique> get copyWith =>
      __$$_CycleHistoriqueCopyWithImpl<_$_CycleHistorique>(this, _$identity);
}

abstract class _CycleHistorique extends CycleHistorique {
  const factory _CycleHistorique(
      {required final UniqueId id,
      required final List<ObservationHistorique> observations,
      required final UniqueId idJourneeSoleil}) = _$_CycleHistorique;
  const _CycleHistorique._() : super._();

  @override
  UniqueId get id;
  @override
  List<ObservationHistorique> get observations;
  @override
  UniqueId get idJourneeSoleil;
  @override
  @JsonKey(ignore: true)
  _$$_CycleHistoriqueCopyWith<_$_CycleHistorique> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ObservationHistorique {
  UniqueId get id => throw _privateConstructorUsedError;
  CouleurAnalyse? get couleur => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ObservationHistoriqueCopyWith<ObservationHistorique> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationHistoriqueCopyWith<$Res> {
  factory $ObservationHistoriqueCopyWith(ObservationHistorique value,
          $Res Function(ObservationHistorique) then) =
      _$ObservationHistoriqueCopyWithImpl<$Res, ObservationHistorique>;
  @useResult
  $Res call({UniqueId id, CouleurAnalyse? couleur, DateTime? date});
}

/// @nodoc
class _$ObservationHistoriqueCopyWithImpl<$Res,
        $Val extends ObservationHistorique>
    implements $ObservationHistoriqueCopyWith<$Res> {
  _$ObservationHistoriqueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? couleur = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      couleur: freezed == couleur
          ? _value.couleur
          : couleur // ignore: cast_nullable_to_non_nullable
              as CouleurAnalyse?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ObservationHistoriqueCopyWith<$Res>
    implements $ObservationHistoriqueCopyWith<$Res> {
  factory _$$_ObservationHistoriqueCopyWith(_$_ObservationHistorique value,
          $Res Function(_$_ObservationHistorique) then) =
      __$$_ObservationHistoriqueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId id, CouleurAnalyse? couleur, DateTime? date});
}

/// @nodoc
class __$$_ObservationHistoriqueCopyWithImpl<$Res>
    extends _$ObservationHistoriqueCopyWithImpl<$Res, _$_ObservationHistorique>
    implements _$$_ObservationHistoriqueCopyWith<$Res> {
  __$$_ObservationHistoriqueCopyWithImpl(_$_ObservationHistorique _value,
      $Res Function(_$_ObservationHistorique) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? couleur = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_ObservationHistorique(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      couleur: freezed == couleur
          ? _value.couleur
          : couleur // ignore: cast_nullable_to_non_nullable
              as CouleurAnalyse?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_ObservationHistorique extends _ObservationHistorique {
  const _$_ObservationHistorique(
      {required this.id, required this.couleur, required this.date})
      : super._();

  @override
  final UniqueId id;
  @override
  final CouleurAnalyse? couleur;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'ObservationHistorique(id: $id, couleur: $couleur, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ObservationHistorique &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.couleur, couleur) || other.couleur == couleur) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, couleur, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ObservationHistoriqueCopyWith<_$_ObservationHistorique> get copyWith =>
      __$$_ObservationHistoriqueCopyWithImpl<_$_ObservationHistorique>(
          this, _$identity);
}

abstract class _ObservationHistorique extends ObservationHistorique {
  const factory _ObservationHistorique(
      {required final UniqueId id,
      required final CouleurAnalyse? couleur,
      required final DateTime? date}) = _$_ObservationHistorique;
  const _ObservationHistorique._() : super._();

  @override
  UniqueId get id;
  @override
  CouleurAnalyse? get couleur;
  @override
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$_ObservationHistoriqueCopyWith<_$_ObservationHistorique> get copyWith =>
      throw _privateConstructorUsedError;
}
