import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:teenstar/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:teenstar/DOMAIN/observation/observation.dart';
import 'package:teenstar/DOMAIN/observation/observation_failure.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'observation_dtos.dart';
import 'dart:async';

abstract class IObservationRepository {
  Future<Either<ObservationFailure, List<Observation>>> read();
  Future<Either<ObservationFailure, Unit>> create(Observation observation);
  Future<Either<ObservationFailure, Unit>> update(Observation observation);
  Future<Either<ObservationFailure, Unit>> delete(UniqueId id);
}

@LazySingleton(as: IObservationRepository)
class ObservationRepository implements IObservationRepository {
  final FirebaseFirestore _firestore;
  final Database _database;
  final observationTableName = 'Observation';

  ObservationRepository(
    this._firestore,
    this._database,
  );

  @override
  Future<Either<ObservationFailure, Unit>> create(Observation observation) async {
    try {
      //On crée la méchante tâche
      final observationDTO = ObservationDTO.fromDomain(observation, 0);
      print('observationDTO.toJson()');
      print(observationDTO.toJson());
      _database.insert(observationTableName, observationDTO.toJson());

      return right(unit);
    } catch (e) {
      return left(const ObservationFailure.unexpected());
    }
  }

  @override
  Future<Either<ObservationFailure, Unit>> delete(UniqueId id) async {
    try {
      await _firestore.observationCollection.doc(id.getOrCrash() as String).delete();

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
      final observationDTO = ObservationDTO.fromDomain(observation, 0);
      await _firestore.observationCollection.doc(observationDTO.id as String).update(observationDTO.toJson());

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
  Future<Either<ObservationFailure, List<Observation>>> read() async {
    print('read ObsersvationREpository');
    try {
      final List<Map<String, dynamic>> maps = await _database.query(observationTableName);

      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return right(List.generate(maps.length, (i) {
        print('maps[$i]');
        print(maps[i]);
        return ObservationDTO.fromJson(maps[i]).toDomain();
      }));
    } catch (e, trace) {
      print(e);
      print(trace);
      return left(ObservationFailure.unexpected());
    }
  }
}
