// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cycle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Cycle {
  UniqueId get id => throw _privateConstructorUsedError;
  List<Observation> get observations => throw _privateConstructorUsedError;
  UniqueId get idJourneeSoleil => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CycleCopyWith<Cycle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleCopyWith<$Res> {
  factory $CycleCopyWith(Cycle value, $Res Function(Cycle) then) =
      _$CycleCopyWithImpl<$Res, Cycle>;
  @useResult
  $Res call(
      {UniqueId id, List<Observation> observations, UniqueId idJourneeSoleil});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CycleCopyWith<$Res> implements $CycleCopyWith<$Res> {
  factory _$$_CycleCopyWith(_$_Cycle value, $Res Function(_$_Cycle) then) =
      __$$_CycleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id, List<Observation> observations, UniqueId idJourneeSoleil});
}

/// @nodoc
class __$$_CycleCopyWithImpl<$Res> extends _$CycleCopyWithImpl<$Res, _$_Cycle>
    implements _$$_CycleCopyWith<$Res> {
  __$$_CycleCopyWithImpl(_$_Cycle _value, $Res Function(_$_Cycle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? observations = null,
    Object? idJourneeSoleil = null,
  }) {
    return _then(_$_Cycle(
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
    ));
  }
}

/// @nodoc

class _$_Cycle extends _Cycle {
  const _$_Cycle(
      {required this.id,
      required final List<Observation> observations,
      required this.idJourneeSoleil})
      : _observations = observations,
        super._();

  @override
  final UniqueId id;
  final List<Observation> _observations;
  @override
  List<Observation> get observations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_observations);
  }

  @override
  final UniqueId idJourneeSoleil;

  @override
  String toString() {
    return 'Cycle(id: $id, observations: $observations, idJourneeSoleil: $idJourneeSoleil)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cycle &&
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
  _$$_CycleCopyWith<_$_Cycle> get copyWith =>
      __$$_CycleCopyWithImpl<_$_Cycle>(this, _$identity);
}

abstract class _Cycle extends Cycle {
  const factory _Cycle(
      {required final UniqueId id,
      required final List<Observation> observations,
      required final UniqueId idJourneeSoleil}) = _$_Cycle;
  const _Cycle._() : super._();

  @override
  UniqueId get id;
  @override
  List<Observation> get observations;
  @override
  UniqueId get idJourneeSoleil;
  @override
  @JsonKey(ignore: true)
  _$$_CycleCopyWith<_$_Cycle> get copyWith =>
      throw _privateConstructorUsedError;
}
