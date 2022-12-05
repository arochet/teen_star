// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cycle_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_UnexpectedCopyWith<$Res> {
  factory _$$_UnexpectedCopyWith(
          _$_Unexpected value, $Res Function(_$_Unexpected) then) =
      __$$_UnexpectedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? erreur});
}

/// @nodoc
class __$$_UnexpectedCopyWithImpl<$Res>
    extends _$CycleFailureCopyWithImpl<$Res, _$_Unexpected>
    implements _$$_UnexpectedCopyWith<$Res> {
  __$$_UnexpectedCopyWithImpl(
      _$_Unexpected _value, $Res Function(_$_Unexpected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? erreur = freezed,
  }) {
    return _then(_$_Unexpected(
      freezed == erreur
          ? _value.erreur
          : erreur // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected(this.erreur);

  @override
  final String? erreur;

  @override
  String toString() {
    return 'CycleFailure.unexpected(erreur: $erreur)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unexpected &&
            (identical(other.erreur, erreur) || other.erreur == erreur));
  }

  @override
  int get hashCode => Object.hash(runtimeType, erreur);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnexpectedCopyWith<_$_Unexpected> get copyWith =>
      __$$_UnexpectedCopyWithImpl<_$_Unexpected>(this, _$identity);

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
  const factory _Unexpected(final String? erreur) = _$_Unexpected;

  String? get erreur;
  @JsonKey(ignore: true)
  _$$_UnexpectedCopyWith<_$_Unexpected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_IdCycleUnfoundCopyWith<$Res> {
  factory _$$_IdCycleUnfoundCopyWith(
          _$_IdCycleUnfound value, $Res Function(_$_IdCycleUnfound) then) =
      __$$_IdCycleUnfoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IdCycleUnfoundCopyWithImpl<$Res>
    extends _$CycleFailureCopyWithImpl<$Res, _$_IdCycleUnfound>
    implements _$$_IdCycleUnfoundCopyWith<$Res> {
  __$$_IdCycleUnfoundCopyWithImpl(
      _$_IdCycleUnfound _value, $Res Function(_$_IdCycleUnfound) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_IdCycleUnfound implements _IdCycleUnfound {
  const _$_IdCycleUnfound();

  @override
  String toString() {
    return 'CycleFailure.idCycleUnfound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_IdCycleUnfound);
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
  const factory _IdCycleUnfound() = _$_IdCycleUnfound;
}

/// @nodoc
abstract class _$$_CycleUnfoundCopyWith<$Res> {
  factory _$$_CycleUnfoundCopyWith(
          _$_CycleUnfound value, $Res Function(_$_CycleUnfound) then) =
      __$$_CycleUnfoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CycleUnfoundCopyWithImpl<$Res>
    extends _$CycleFailureCopyWithImpl<$Res, _$_CycleUnfound>
    implements _$$_CycleUnfoundCopyWith<$Res> {
  __$$_CycleUnfoundCopyWithImpl(
      _$_CycleUnfound _value, $Res Function(_$_CycleUnfound) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CycleUnfound implements _CycleUnfound {
  const _$_CycleUnfound();

  @override
  String toString() {
    return 'CycleFailure.cycleUnfound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CycleUnfound);
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
  const factory _CycleUnfound() = _$_CycleUnfound;
}

/// @nodoc
abstract class _$$_InsufficientPermissionCopyWith<$Res> {
  factory _$$_InsufficientPermissionCopyWith(_$_InsufficientPermission value,
          $Res Function(_$_InsufficientPermission) then) =
      __$$_InsufficientPermissionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InsufficientPermissionCopyWithImpl<$Res>
    extends _$CycleFailureCopyWithImpl<$Res, _$_InsufficientPermission>
    implements _$$_InsufficientPermissionCopyWith<$Res> {
  __$$_InsufficientPermissionCopyWithImpl(_$_InsufficientPermission _value,
      $Res Function(_$_InsufficientPermission) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InsufficientPermission implements _InsufficientPermission {
  const _$_InsufficientPermission();

  @override
  String toString() {
    return 'CycleFailure.insufficientPermission()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InsufficientPermission);
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
  const factory _InsufficientPermission() = _$_InsufficientPermission;
}

/// @nodoc
abstract class _$$_UnableToUpdateCopyWith<$Res> {
  factory _$$_UnableToUpdateCopyWith(
          _$_UnableToUpdate value, $Res Function(_$_UnableToUpdate) then) =
      __$$_UnableToUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnableToUpdateCopyWithImpl<$Res>
    extends _$CycleFailureCopyWithImpl<$Res, _$_UnableToUpdate>
    implements _$$_UnableToUpdateCopyWith<$Res> {
  __$$_UnableToUpdateCopyWithImpl(
      _$_UnableToUpdate _value, $Res Function(_$_UnableToUpdate) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UnableToUpdate implements _UnableToUpdate {
  const _$_UnableToUpdate();

  @override
  String toString() {
    return 'CycleFailure.unableToUpdate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnableToUpdate);
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
  const factory _UnableToUpdate() = _$_UnableToUpdate;
}
