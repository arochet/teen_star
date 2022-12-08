import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data_dtos.freezed.dart';
part 'user_data_dtos.g.dart';

@freezed
abstract class UserDataDTO implements _$UserDataDTO {
  const UserDataDTO._();

  const factory UserDataDTO({
    @JsonKey(ignore: true) String? id,
    required String userName,
    required bool passwordCrypted,
    required String typeAccount,
  }) = _UserDataDTO;

  factory UserDataDTO.fromDomain(UserData user) {
    return UserDataDTO(
      userName: user.userName.getOrCrash(),
      passwordCrypted: user.passwordCrypted,
      typeAccount: user.typeAccount.getOrCrash().toShortString(),
    );
  }

  UserData toDomain(String? _email) {
    return UserData(
      id: UniqueId.fromUniqueInt(id! as int),
      userName: Nom(userName),
      email: _email != null ? EmailAddress(_email) : null,
      passwordCrypted: passwordCrypted,
      typeAccount: TypeAccount.fromString(typeAccount),
    );
  }

  factory UserDataDTO.fromJson(Map<String, dynamic> json) => _$UserDataDTOFromJson(json);
}
