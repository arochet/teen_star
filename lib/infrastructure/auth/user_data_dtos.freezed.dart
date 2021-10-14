// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_data_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDataDTO _$UserDataDTOFromJson(Map<String, dynamic> json) {
  return _UserDataDTO.fromJson(json);
}

/// @nodoc
class _$UserDataDTOTearOff {
  const _$UserDataDTOTearOff();

  _UserDataDTO call(
      {@JsonKey(ignore: true) String? id,
      required String userName,
      required String email,
      required bool passwordCrypted}) {
    return _UserDataDTO(
      id: id,
      userName: userName,
      email: email,
      passwordCrypted: passwordCrypted,
    );
  }

  UserDataDTO fromJson(Map<String, Object> json) {
    return UserDataDTO.fromJson(json);
  }
}

/// @nodoc
const $UserDataDTO = _$UserDataDTOTearOff();

/// @nodoc
mixin _$UserDataDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get passwordCrypted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataDTOCopyWith<UserDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataDTOCopyWith<$Res> {
  factory $UserDataDTOCopyWith(
          UserDataDTO value, $Res Function(UserDataDTO) then) =
      _$UserDataDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String userName,
      String email,
      bool passwordCrypted});
}

/// @nodoc
class _$UserDataDTOCopyWithImpl<$Res> implements $UserDataDTOCopyWith<$Res> {
  _$UserDataDTOCopyWithImpl(this._value, this._then);

  final UserDataDTO _value;
  // ignore: unused_field
  final $Res Function(UserDataDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? passwordCrypted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      passwordCrypted: passwordCrypted == freezed
          ? _value.passwordCrypted
          : passwordCrypted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserDataDTOCopyWith<$Res>
    implements $UserDataDTOCopyWith<$Res> {
  factory _$UserDataDTOCopyWith(
          _UserDataDTO value, $Res Function(_UserDataDTO) then) =
      __$UserDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String userName,
      String email,
      bool passwordCrypted});
}

/// @nodoc
class __$UserDataDTOCopyWithImpl<$Res> extends _$UserDataDTOCopyWithImpl<$Res>
    implements _$UserDataDTOCopyWith<$Res> {
  __$UserDataDTOCopyWithImpl(
      _UserDataDTO _value, $Res Function(_UserDataDTO) _then)
      : super(_value, (v) => _then(v as _UserDataDTO));

  @override
  _UserDataDTO get _value => super._value as _UserDataDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? passwordCrypted = freezed,
  }) {
    return _then(_UserDataDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      passwordCrypted: passwordCrypted == freezed
          ? _value.passwordCrypted
          : passwordCrypted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDataDTO extends _UserDataDTO {
  const _$_UserDataDTO(
      {@JsonKey(ignore: true) this.id,
      required this.userName,
      required this.email,
      required this.passwordCrypted})
      : super._();

  factory _$_UserDataDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_UserDataDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String userName;
  @override
  final String email;
  @override
  final bool passwordCrypted;

  @override
  String toString() {
    return 'UserDataDTO(id: $id, userName: $userName, email: $email, passwordCrypted: $passwordCrypted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDataDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.passwordCrypted, passwordCrypted) ||
                const DeepCollectionEquality()
                    .equals(other.passwordCrypted, passwordCrypted)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(passwordCrypted);

  @JsonKey(ignore: true)
  @override
  _$UserDataDTOCopyWith<_UserDataDTO> get copyWith =>
      __$UserDataDTOCopyWithImpl<_UserDataDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserDataDTOToJson(this);
  }
}

abstract class _UserDataDTO extends UserDataDTO {
  const factory _UserDataDTO(
      {@JsonKey(ignore: true) String? id,
      required String userName,
      required String email,
      required bool passwordCrypted}) = _$_UserDataDTO;
  const _UserDataDTO._() : super._();

  factory _UserDataDTO.fromJson(Map<String, dynamic> json) =
      _$_UserDataDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  bool get passwordCrypted => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserDataDTOCopyWith<_UserDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
