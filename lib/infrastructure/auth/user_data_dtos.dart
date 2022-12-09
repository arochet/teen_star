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
    required int? dateNaissance,
    required int anneePremiereRegle,
    required int theme,
  }) = _UserDataDTO;

  factory UserDataDTO.fromDomain(UserData user) {
    return UserDataDTO(
      userName: user.userName.getOrCrash(),
      dateNaissance: user.dateNaissance?.millisecondsSinceEpoch,
      anneePremiereRegle: user.anneePremiereRegle,
      theme: user.theme,
    );
  }

  UserData toDomain() {
    return UserData(
      id: UniqueId(),
      userName: Nom(userName),
      dateNaissance: dateNaissance != null ? DateTime.fromMillisecondsSinceEpoch(dateNaissance!) : null,
      anneePremiereRegle: anneePremiereRegle,
      theme: theme,
    );
  }

  factory UserDataDTO.fromJson(Map<String, dynamic> json) => _$UserDataDTOFromJson(json);
}
