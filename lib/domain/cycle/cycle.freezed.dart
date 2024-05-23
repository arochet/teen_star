// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Cycle {
  UniqueId get id => throw _privateConstructorUsedError;
  List<Observation> get observations => throw _privateConstructorUsedError;
  UniqueId get idJourneeSoleil =>
      throw _privateConstructorUsedError; //Jour sommet du cycle.
  DateTime? get dateFirstDayOfNextCycle => throw _privateConstructorUsedError;
  DateTime? get dateLastDayOfPreviousCycle =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CycleCopyWith<Cycle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleCopyWith<$Res> {
  factory $CycleCopyWith(Cycle value, $Res Function(Cycle) then) =
      _$CycleCopyWithImpl<$Res, Cycle>;
  @useResult
  $Res call(
      {UniqueId id,
      List<Observation> observations,
      UniqueId idJourneeSoleil,
      DateTime? dateFirstDayOfNextCycle,
      DateTime? dateLastDayOfPreviousCycle});
}

/// @nodoc
class _$CycleCopyWithImpl<$Res, $Val extends Cycle>
    implements $CycleCopyWith<$Res> {
  _$CycleCopyWithImpl(this._value, this._then);

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
    Object? dateFirstDayOfNextCycle = freezed,
    Object? dateLastDayOfPreviousCycle = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      observations: null == observations
          ? _value.observations
          : observations // ignore: cast_nullable_to_non_nullable
              as List<Observation>,
      idJourneeSoleil: null == idJourneeSoleil
          ? _value.idJourneeSoleil
          : idJourneeSoleil // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      dateFirstDayOfNextCycle: freezed == dateFirstDayOfNextCycle
          ? _value.dateFirstDayOfNextCycle
          : dateFirstDayOfNextCycle // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateLastDayOfPreviousCycle: freezed == dateLastDayOfPreviousCycle
          ? _value.dateLastDayOfPreviousCycle
          : dateLastDayOfPreviousCycle // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CycleImplCopyWith<$Res> implements $CycleCopyWith<$Res> {
  factory _$$CycleImplCopyWith(
          _$CycleImpl value, $Res Function(_$CycleImpl) then) =
      __$$CycleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      List<Observation> observations,
      UniqueId idJourneeSoleil,
      DateTime? dateFirstDayOfNextCycle,
      DateTime? dateLastDayOfPreviousCycle});
}

/// @nodoc
class __$$CycleImplCopyWithImpl<$Res>
    extends _$CycleCopyWithImpl<$Res, _$CycleImpl>
    implements _$$CycleImplCopyWith<$Res> {
  __$$CycleImplCopyWithImpl(
      _$CycleImpl _value, $Res Function(_$CycleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? observations = null,
    Object? idJourneeSoleil = null,
    Object? dateFirstDayOfNextCycle = freezed,
    Object? dateLastDayOfPreviousCycle = freezed,
  }) {
    return _then(_$CycleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      observations: null == observations
          ? _value._observations
          : observations // ignore: cast_nullable_to_non_nullable
              as List<Observation>,
      idJourneeSoleil: null == idJourneeSoleil
          ? _value.idJourneeSoleil
          : idJourneeSoleil // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      dateFirstDayOfNextCycle: freezed == dateFirstDayOfNextCycle
          ? _value.dateFirstDayOfNextCycle
          : dateFirstDayOfNextCycle // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateLastDayOfPreviousCycle: freezed == dateLastDayOfPreviousCycle
          ? _value.dateLastDayOfPreviousCycle
          : dateLastDayOfPreviousCycle // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$CycleImpl extends _Cycle {
  const _$CycleImpl(
      {required this.id,
      required final List<Observation> observations,
      required this.idJourneeSoleil,
      required this.dateFirstDayOfNextCycle,
      required this.dateLastDayOfPreviousCycle})
      : _observations = observations,
        super._();

  @override
  final UniqueId id;
  final List<Observation> _observations;
  @override
  List<Observation> get observations {
    if (_observations is EqualUnmodifiableListView) return _observations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_observations);
  }

  @override
  final UniqueId idJourneeSoleil;
//Jour sommet du cycle.
  @override
  final DateTime? dateFirstDayOfNextCycle;
  @override
  final DateTime? dateLastDayOfPreviousCycle;

  @override
  String toString() {
    return 'Cycle(id: $id, observations: $observations, idJourneeSoleil: $idJourneeSoleil, dateFirstDayOfNextCycle: $dateFirstDayOfNextCycle, dateLastDayOfPreviousCycle: $dateLastDayOfPreviousCycle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CycleImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._observations, _observations) &&
            (identical(other.idJourneeSoleil, idJourneeSoleil) ||
                other.idJourneeSoleil == idJourneeSoleil) &&
            (identical(
                    other.dateFirstDayOfNextCycle, dateFirstDayOfNextCycle) ||
                other.dateFirstDayOfNextCycle == dateFirstDayOfNextCycle) &&
            (identical(other.dateLastDayOfPreviousCycle,
                    dateLastDayOfPreviousCycle) ||
                other.dateLastDayOfPreviousCycle ==
                    dateLastDayOfPreviousCycle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_observations),
      idJourneeSoleil,
      dateFirstDayOfNextCycle,
      dateLastDayOfPreviousCycle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CycleImplCopyWith<_$CycleImpl> get copyWith =>
      __$$CycleImplCopyWithImpl<_$CycleImpl>(this, _$identity);
}

abstract class _Cycle extends Cycle {
  const factory _Cycle(
      {required final UniqueId id,
      required final List<Observation> observations,
      required final UniqueId idJourneeSoleil,
      required final DateTime? dateFirstDayOfNextCycle,
      required final DateTime? dateLastDayOfPreviousCycle}) = _$CycleImpl;
  const _Cycle._() : super._();

  @override
  UniqueId get id;
  @override
  List<Observation> get observations;
  @override
  UniqueId get idJourneeSoleil;
  @override //Jour sommet du cycle.
  DateTime? get dateFirstDayOfNextCycle;
  @override
  DateTime? get dateLastDayOfPreviousCycle;
  @override
  @JsonKey(ignore: true)
  _$$CycleImplCopyWith<_$CycleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
