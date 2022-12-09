import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';

part 'user_data.freezed.dart';

@freezed
abstract class UserData with _$UserData {
  const UserData._();

  const factory UserData({
    required UniqueId id,
    required Nom userName,
    required DateTime? dateNaissance,
    required int anneePremiereRegle,
    required int theme,
  }) = _UserData;

  factory UserData.empty() => UserData(
        id: UniqueId(),
        userName: Nom(''),
        dateNaissance: null,
        anneePremiereRegle: 0,
        theme: 0,
      );

  factory UserData.error() => UserData(
        id: UniqueId(),
        userName: Nom('Erreur'),
        dateNaissance: null,
        anneePremiereRegle: 0,
        theme: 0,
      );

  factory UserData.loading() => UserData(
        id: UniqueId(),
        userName: Nom('...'),
        dateNaissance: null,
        anneePremiereRegle: 0,
        theme: 0,
      );
}
