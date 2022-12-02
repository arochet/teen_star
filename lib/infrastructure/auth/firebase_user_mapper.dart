import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:teenstar/DOMAIN/auth/user_auth.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  UserAuth toDomain() {
    return UserAuth(id: UniqueId.fromUniqueInt(0));
  }
}
