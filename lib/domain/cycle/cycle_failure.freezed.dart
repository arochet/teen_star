// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CycleFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erreur) unexpected,
    required TResult Function() idCycleUnfound,
    required TResult Function() cycleUnfound,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erreur)? unexpected,
    TResult? Function()? idCycleUnfound,
    TResult? Function()? cycleUnfound,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erreur)? unexpected,
    TResult Function()? idCycleUnfound,
    TResult Function()? cycleUnfound,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_IdCycleUnfound value) idCycleUnfound,
    required TResult Function(_CycleUnfound value) cycleUnfound,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult? Function(_CycleUnfound value)? cycleUnfound,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_UnableToUpdate value)? unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult Function(_CycleUnfound value)? cycleUnfound,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleFailureCopyWith<$Res> {
  factory $CycleFailureCopyWith(
          CycleFailure value, $Res Function(CycleFailure) then) =
      _$CycleFailureCopyWithImpl<$Res, CycleFailure>;
}

/// @nodoc
class _$CycleFailureCopyWithImpl<$Res, $Val extends CycleFailure>
    implements $CycleFailureCopyWith<$Res> {
  _$CycleFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnexpectedImplCopyWith<$Res> {
  factory _$$UnexpectedImplCopyWith(
          _$UnexpectedImpl value, $Res Function(_$UnexpectedImpl) then) =
      __$$UnexpectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? erreur});
}

/// @nodoc
class __$$UnexpectedImplCopyWithImpl<$Res>
    extends _$CycleFailureCopyWithImpl<$Res, _$UnexpectedImpl>
    implements _$$UnexpectedImplCopyWith<$Res> {
  __$$UnexpectedImplCopyWithImpl(
      _$UnexpectedImpl _value, $Res Function(_$UnexpectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? erreur = freezed,
  }) {
    return _then(_$UnexpectedImpl(
      freezed == erreur
          ? _value.erreur
          : erreur // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnexpectedImpl implements _Unexpected {
  const _$UnexpectedImpl(this.erreur);

  @override
  final String? erreur;

  @override
  String toString() {
    return 'CycleFailure.unexpected(erreur: $erreur)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedImpl &&
            (identical(other.erreur, erreur) || other.erreur == erreur));
  }

  @override
  int get hashCode => Object.hash(runtimeType, erreur);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedImplCopyWith<_$UnexpectedImpl> get copyWith =>
      __$$UnexpectedImplCopyWithImpl<_$UnexpectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erreur) unexpected,
    required TResult Function() idCycleUnfound,
    required TResult Function() cycleUnfound,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) {
    return unexpected(erreur);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erreur)? unexpected,
    TResult? Function()? idCycleUnfound,
    TResult? Function()? cycleUnfound,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) {
    return unexpected?.call(erreur);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erreur)? unexpected,
    TResult Function()? idCycleUnfound,
    TResult Function()? cycleUnfound,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(erreur);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_IdCycleUnfound value) idCycleUnfound,
    required TResult Function(_CycleUnfound value) cycleUnfound,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult? Function(_CycleUnfound value)? cycleUnfound,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_UnableToUpdate value)? unableToUpdate,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult Function(_CycleUnfound value)? cycleUnfound,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements CycleFailure {
  const factory _Unexpected(final String? erreur) = _$UnexpectedImpl;

  String? get erreur;
  @JsonKey(ignore: true)
  _$$UnexpectedImplCopyWith<_$UnexpectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IdCycleUnfoundImplCopyWith<$Res> {
  factory _$$IdCycleUnfoundImplCopyWith(_$IdCycleUnfoundImpl value,
          $Res Function(_$IdCycleUnfoundImpl) then) =
      __$$IdCycleUnfoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdCycleUnfoundImplCopyWithImpl<$Res>
    extends _$CycleFailureCopyWithImpl<$Res, _$IdCycleUnfoundImpl>
    implements _$$IdCycleUnfoundImplCopyWith<$Res> {
  __$$IdCycleUnfoundImplCopyWithImpl(
      _$IdCycleUnfoundImpl _value, $Res Function(_$IdCycleUnfoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdCycleUnfoundImpl implements _IdCycleUnfound {
  const _$IdCycleUnfoundImpl();

  @override
  String toString() {
    return 'CycleFailure.idCycleUnfound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdCycleUnfoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erreur) unexpected,
    required TResult Function() idCycleUnfound,
    required TResult Function() cycleUnfound,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) {
    return idCycleUnfound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erreur)? unexpected,
    TResult? Function()? idCycleUnfound,
    TResult? Function()? cycleUnfound,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) {
    return idCycleUnfound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erreur)? unexpected,
    TResult Function()? idCycleUnfound,
    TResult Function()? cycleUnfound,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (idCycleUnfound != null) {
      return idCycleUnfound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_IdCycleUnfound value) idCycleUnfound,
    required TResult Function(_CycleUnfound value) cycleUnfound,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
  }) {
    return idCycleUnfound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult? Function(_CycleUnfound value)? cycleUnfound,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_UnableToUpdate value)? unableToUpdate,
  }) {
    return idCycleUnfound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult Function(_CycleUnfound value)? cycleUnfound,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (idCycleUnfound != null) {
      return idCycleUnfound(this);
    }
    return orElse();
  }
}

abstract class _IdCycleUnfound implements CycleFailure {
  const factory _IdCycleUnfound() = _$IdCycleUnfoundImpl;
}

/// @nodoc
abstract class _$$CycleUnfoundImplCopyWith<$Res> {
  factory _$$CycleUnfoundImplCopyWith(
          _$CycleUnfoundImpl value, $Res Function(_$CycleUnfoundImpl) then) =
      __$$CycleUnfoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CycleUnfoundImplCopyWithImpl<$Res>
    extends _$CycleFailureCopyWithImpl<$Res, _$CycleUnfoundImpl>
    implements _$$CycleUnfoundImplCopyWith<$Res> {
  __$$CycleUnfoundImplCopyWithImpl(
      _$CycleUnfoundImpl _value, $Res Function(_$CycleUnfoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CycleUnfoundImpl implements _CycleUnfound {
  const _$CycleUnfoundImpl();

  @override
  String toString() {
    return 'CycleFailure.cycleUnfound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CycleUnfoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erreur) unexpected,
    required TResult Function() idCycleUnfound,
    required TResult Function() cycleUnfound,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) {
    return cycleUnfound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erreur)? unexpected,
    TResult? Function()? idCycleUnfound,
    TResult? Function()? cycleUnfound,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) {
    return cycleUnfound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erreur)? unexpected,
    TResult Function()? idCycleUnfound,
    TResult Function()? cycleUnfound,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (cycleUnfound != null) {
      return cycleUnfound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_IdCycleUnfound value) idCycleUnfound,
    required TResult Function(_CycleUnfound value) cycleUnfound,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
  }) {
    return cycleUnfound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult? Function(_CycleUnfound value)? cycleUnfound,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_UnableToUpdate value)? unableToUpdate,
  }) {
    return cycleUnfound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult Function(_CycleUnfound value)? cycleUnfound,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (cycleUnfound != null) {
      return cycleUnfound(this);
    }
    return orElse();
  }
}

abstract class _CycleUnfound implements CycleFailure {
  const factory _CycleUnfound() = _$CycleUnfoundImpl;
}

/// @nodoc
abstract class _$$InsufficientPermissionImplCopyWith<$Res> {
  factory _$$InsufficientPermissionImplCopyWith(
          _$InsufficientPermissionImpl value,
          $Res Function(_$InsufficientPermissionImpl) then) =
      __$$InsufficientPermissionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InsufficientPermissionImplCopyWithImpl<$Res>
    extends _$CycleFailureCopyWithImpl<$Res, _$InsufficientPermissionImpl>
    implements _$$InsufficientPermissionImplCopyWith<$Res> {
  __$$InsufficientPermissionImplCopyWithImpl(
      _$InsufficientPermissionImpl _value,
      $Res Function(_$InsufficientPermissionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InsufficientPermissionImpl implements _InsufficientPermission {
  const _$InsufficientPermissionImpl();

  @override
  String toString() {
    return 'CycleFailure.insufficientPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsufficientPermissionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erreur) unexpected,
    required TResult Function() idCycleUnfound,
    required TResult Function() cycleUnfound,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) {
    return insufficientPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erreur)? unexpected,
    TResult? Function()? idCycleUnfound,
    TResult? Function()? cycleUnfound,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) {
    return insufficientPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erreur)? unexpected,
    TResult Function()? idCycleUnfound,
    TResult Function()? cycleUnfound,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (insufficientPermission != null) {
      return insufficientPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_IdCycleUnfound value) idCycleUnfound,
    required TResult Function(_CycleUnfound value) cycleUnfound,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
  }) {
    return insufficientPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult? Function(_CycleUnfound value)? cycleUnfound,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_UnableToUpdate value)? unableToUpdate,
  }) {
    return insufficientPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult Function(_CycleUnfound value)? cycleUnfound,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (insufficientPermission != null) {
      return insufficientPermission(this);
    }
    return orElse();
  }
}

abstract class _InsufficientPermission implements CycleFailure {
  const factory _InsufficientPermission() = _$InsufficientPermissionImpl;
}

/// @nodoc
abstract class _$$UnableToUpdateImplCopyWith<$Res> {
  factory _$$UnableToUpdateImplCopyWith(_$UnableToUpdateImpl value,
          $Res Function(_$UnableToUpdateImpl) then) =
      __$$UnableToUpdateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnableToUpdateImplCopyWithImpl<$Res>
    extends _$CycleFailureCopyWithImpl<$Res, _$UnableToUpdateImpl>
    implements _$$UnableToUpdateImplCopyWith<$Res> {
  __$$UnableToUpdateImplCopyWithImpl(
      _$UnableToUpdateImpl _value, $Res Function(_$UnableToUpdateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnableToUpdateImpl implements _UnableToUpdate {
  const _$UnableToUpdateImpl();

  @override
  String toString() {
    return 'CycleFailure.unableToUpdate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnableToUpdateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erreur) unexpected,
    required TResult Function() idCycleUnfound,
    required TResult Function() cycleUnfound,
    required TResult Function() insufficientPermission,
    required TResult Function() unableToUpdate,
  }) {
    return unableToUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erreur)? unexpected,
    TResult? Function()? idCycleUnfound,
    TResult? Function()? cycleUnfound,
    TResult? Function()? insufficientPermission,
    TResult? Function()? unableToUpdate,
  }) {
    return unableToUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erreur)? unexpected,
    TResult Function()? idCycleUnfound,
    TResult Function()? cycleUnfound,
    TResult Function()? insufficientPermission,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_IdCycleUnfound value) idCycleUnfound,
    required TResult Function(_CycleUnfound value) cycleUnfound,
    required TResult Function(_InsufficientPermission value)
        insufficientPermission,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
  }) {
    return unableToUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult? Function(_CycleUnfound value)? cycleUnfound,
    TResult? Function(_InsufficientPermission value)? insufficientPermission,
    TResult? Function(_UnableToUpdate value)? unableToUpdate,
  }) {
    return unableToUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_IdCycleUnfound value)? idCycleUnfound,
    TResult Function(_CycleUnfound value)? cycleUnfound,
    TResult Function(_InsufficientPermission value)? insufficientPermission,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate(this);
    }
    return orElse();
  }
}

abstract class _UnableToUpdate implements CycleFailure {
  const factory _UnableToUpdate() = _$UnableToUpdateImpl;
}
