import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:teenstar/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:teenstar/DOMAIN/observation/observation.dart';
import 'package:teenstar/DOMAIN/observation/observation_failure.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'observation_dtos.dart';

abstract class IObservationRepository {
  Stream<Either<ObservationFailure, List<Observation>>> watch();
  Future<Either<ObservationFailure, Observation>> watchWithId(UniqueId id);
  Future<Either<ObservationFailure, Unit>> create(Observation observation);
  Future<Either<ObservationFailure, Unit>> update(Observation observation);
  Future<Either<ObservationFailure, Unit>> delete(UniqueId id);
}

@LazySingleton(as: IObservationRepository)
class ObservationRepository implements IObservationRepository {
  final FirebaseFirestore _firestore;

  ObservationRepository(
    this._firestore,
  );

  @override
  Future<Either<ObservationFailure, Unit>> create(Observation observation) async {
    try {
      /* final user = (await getIt<AuthRepository>().getUserData())
          .fold(() => null, (user) => user);

      //UID de la tâche
      final uid = user?.id;
      if (uid != null)
        observation = observation.copyWith(uid: uid);
      else
        return left(const ObservationFailure.unexpected()); */

      //On crée la méchante tâche
      final observationDTO = ObservationDTO.fromDomain(observation);
      await _firestore.observationCollection.doc(observationDTO.id).set(observationDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const ObservationFailure.insufficientPermission());
      } else if (e.message!
          .contains('The caller does not have permission to execute the specified operation')) {
        return left(const ObservationFailure.insufficientPermission());
      } else {
        return left(const ObservationFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ObservationFailure, Unit>> delete(UniqueId id) async {
    try {
      await _firestore.observationCollection.doc(id.getOrCrash()).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const ObservationFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const ObservationFailure.unableToUpdate());
      } else {
        return left(const ObservationFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ObservationFailure, Unit>> update(Observation observation) async {
    try {
      final observationDTO = ObservationDTO.fromDomain(observation);
      await _firestore.observationCollection.doc(observationDTO.id).update(observationDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const ObservationFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const ObservationFailure.unableToUpdate());
      } else {
        return left(const ObservationFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<ObservationFailure, List<Observation>>> watch() async* {
    final collection = _firestore.observationCollection;

    yield* collection
        .snapshots()
        .map(
          (snapshot) => right<ObservationFailure, List<Observation>>(
            snapshot.docs.map((doc) {
              try {
                return ObservationDTO.fromFirestore(doc).toDomain();
              } catch (e) {}
              return Observation.empty();
            }).toList(),
          ),
        )
        .handleError((e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const ObservationFailure.insufficientPermission());
      } else {
        return left(const ObservationFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<ObservationFailure, Observation>> watchWithId(UniqueId id) async {
    final collection = _firestore.observationCollection.doc(id.getOrCrash());

    return collection.get().then((doc) => right(ObservationDTO.fromFirestore(doc)
        .toDomain())) /* .onError((e, stackTrace) => left(const ObservationFailure.unexpected())) */;
  }
}
