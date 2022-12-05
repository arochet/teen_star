import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teenstar/DOMAIN/core/errors.dart';

import '../../injection.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<AuthRepository>().getSignedUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError);
    return FirebaseFirestore.instance.collection('user').doc(user.id.getOrCrash() as String);
  }

  CollectionReference get passwordClearCollection => collection('passwordClear');

  Future<DocumentReference> aUserDocument(UniqueId idPlayer) async {
    return FirebaseFirestore.instance.collection('user').doc(idPlayer.getOrCrash() as String);
  }
//insert-collection
}
