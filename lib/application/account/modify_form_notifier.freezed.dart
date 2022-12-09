// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'modify_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModifyFormData {
  Nom get nomUtilisateur => throw _privateConstructorUsedError;
  int get annePremiereRegle => throw _privateConstructorUsedError;
  DateTime? get dateNaissance => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModifyFormDataCopyWith<ModifyFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyFormDataCopyWith<$Res> {
  factory $ModifyFormDataCopyWith(
          ModifyFormData value, $Res Function(ModifyFormData) then) =
      _$ModifyFormDataCopyWithImpl<$Res, ModifyFormData>;
  @useResult
  $Res call(
      {Nom nomUtilisateur,
      int annePremiereRegle,
      DateTime? dateNaissance,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$ModifyFormDataCopyWithImpl<$Res, $Val extends ModifyFormData>
    implements $ModifyFormDataCopyWith<$Res> {
  _$ModifyFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomUtilisateur = null,
    Object? annePremiereRegle = null,
    Object? dateNaissance = freezed,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      nomUtilisateur: null == nomUtilisateur
          ? _value.nomUtilisateur
          : nomUtilisateur // ignore: cast_nullable_to_non_nullable
              as Nom,
      annePremiereRegle: null == annePremiereRegle
          ? _value.annePremiereRegle
          : annePremiereRegle // ignore: cast_nullable_to_non_nullable
              as int,
      dateNaissance: freezed == dateNaissance
          ? _value.dateNaissance
          : dateNaissance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ModifyFormDataCopyWith<$Res>
    implements $ModifyFormDataCopyWith<$Res> {
  factory _$$_ModifyFormDataCopyWith(
          _$_ModifyFormData value, $Res Function(_$_ModifyFormData) then) =
      __$$_ModifyFormDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Nom nomUtilisateur,
      int annePremiereRegle,
      DateTime? dateNaissance,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_ModifyFormDataCopyWithImpl<$Res>
    extends _$ModifyFormDataCopyWithImpl<$Res, _$_ModifyFormData>
    implements _$$_ModifyFormDataCopyWith<$Res> {
  __$$_ModifyFormDataCopyWithImpl(
      _$_ModifyFormData _value, $Res Function(_$_ModifyFormData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomUtilisateur = null,
    Object? annePremiereRegle = null,
    Object? dateNaissance = freezed,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$_ModifyFormData(
      nomUtilisateur: null == nomUtilisateur
          ? _value.nomUtilisateur
          : nomUtilisateur // ignore: cast_nullable_to_non_nullable
              as Nom,
      annePremiereRegle: null == annePremiereRegle
          ? _value.annePremiereRegle
          : annePremiereRegle // ignore: cast_nullable_to_non_nullable
              as int,
      dateNaissance: freezed == dateNaissance
          ? _value.dateNaissance
          : dateNaissance // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_ModifyFormData implements _ModifyFormData {
  const _$_ModifyFormData(
      {required this.nomUtilisateur,
      required this.annePremiereRegle,
      required this.dateNaissance,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Nom nomUtilisateur;
  @override
  final int annePremiereRegle;
  @override
  final DateTime? dateNaissance;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'ModifyFormData(nomUtilisateur: $nomUtilisateur, annePremiereRegle: $annePremiereRegle, dateNaissance: $dateNaissance, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModifyFormData &&
            (identical(other.nomUtilisateur, nomUtilisateur) ||
                other.nomUtilisateur == nomUtilisateur) &&
            (identical(other.annePremiereRegle, annePremiereRegle) ||
                other.annePremiereRegle == annePremiereRegle) &&
            (identical(other.dateNaissance, dateNaissance) ||
                other.dateNaissance == dateNaissance) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      nomUtilisateur,
      annePremiereRegle,
      dateNaissance,
      showErrorMessages,
      isSubmitting,
      authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModifyFormDataCopyWith<_$_ModifyFormData> get copyWith =>
      __$$_ModifyFormDataCopyWithImpl<_$_ModifyFormData>(this, _$identity);
}

abstract class _ModifyFormData implements ModifyFormData {
  const factory _ModifyFormData(
      {required final Nom nomUtilisateur,
      required final int annePremiereRegle,
      required final DateTime? dateNaissance,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$_ModifyFormData;

  @override
  Nom get nomUtilisateur;
  @override
  int get annePremiereRegle;
  @override
  DateTime? get dateNaissance;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ModifyFormDataCopyWith<_$_ModifyFormData> get copyWith =>
      throw _privateConstructorUsedError;
}
