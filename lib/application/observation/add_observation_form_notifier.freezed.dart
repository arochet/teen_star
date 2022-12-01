// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_observation_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddObservationFormData {
  Observation get observation => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ObservationFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddObservationFormDataCopyWith<AddObservationFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddObservationFormDataCopyWith<$Res> {
  factory $AddObservationFormDataCopyWith(AddObservationFormData value,
          $Res Function(AddObservationFormData) then) =
      _$AddObservationFormDataCopyWithImpl<$Res, AddObservationFormData>;
  @useResult
  $Res call(
      {Observation observation,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ObservationFailure, Unit>> authFailureOrSuccessOption});

  $ObservationCopyWith<$Res> get observation;
}

/// @nodoc
class _$AddObservationFormDataCopyWithImpl<$Res,
        $Val extends AddObservationFormData>
    implements $AddObservationFormDataCopyWith<$Res> {
  _$AddObservationFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? observation = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      observation: null == observation
          ? _value.observation
          : observation // ignore: cast_nullable_to_non_nullable
              as Observation,
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
              as Option<Either<ObservationFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ObservationCopyWith<$Res> get observation {
    return $ObservationCopyWith<$Res>(_value.observation, (value) {
      return _then(_value.copyWith(observation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddObservationFormDataCopyWith<$Res>
    implements $AddObservationFormDataCopyWith<$Res> {
  factory _$$_AddObservationFormDataCopyWith(_$_AddObservationFormData value,
          $Res Function(_$_AddObservationFormData) then) =
      __$$_AddObservationFormDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Observation observation,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ObservationFailure, Unit>> authFailureOrSuccessOption});

  @override
  $ObservationCopyWith<$Res> get observation;
}

/// @nodoc
class __$$_AddObservationFormDataCopyWithImpl<$Res>
    extends _$AddObservationFormDataCopyWithImpl<$Res,
        _$_AddObservationFormData>
    implements _$$_AddObservationFormDataCopyWith<$Res> {
  __$$_AddObservationFormDataCopyWithImpl(_$_AddObservationFormData _value,
      $Res Function(_$_AddObservationFormData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? observation = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$_AddObservationFormData(
      observation: null == observation
          ? _value.observation
          : observation // ignore: cast_nullable_to_non_nullable
              as Observation,
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
              as Option<Either<ObservationFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AddObservationFormData implements _AddObservationFormData {
  const _$_AddObservationFormData(
      {required this.observation,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Observation observation;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ObservationFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'AddObservationFormData(observation: $observation, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddObservationFormData &&
            (identical(other.observation, observation) ||
                other.observation == observation) &&
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
  int get hashCode => Object.hash(runtimeType, observation, showErrorMessages,
      isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddObservationFormDataCopyWith<_$_AddObservationFormData> get copyWith =>
      __$$_AddObservationFormDataCopyWithImpl<_$_AddObservationFormData>(
          this, _$identity);
}

abstract class _AddObservationFormData implements AddObservationFormData {
  const factory _AddObservationFormData(
      {required final Observation observation,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ObservationFailure, Unit>>
          authFailureOrSuccessOption}) = _$_AddObservationFormData;

  @override
  Observation get observation;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ObservationFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddObservationFormDataCopyWith<_$_AddObservationFormData> get copyWith =>
      throw _privateConstructorUsedError;
}
