import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/observation_failure.dart';
import 'package:teenstar/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'cycle_dtos.dart';
import 'observation_dtos.dart';

abstract class ICycleRepository {
  Future<Either<ObservationFailure, List<Observation>>> read();
  Future<Either<ObservationFailure, Unit>> create(Observation observation);
  Future<Either<ObservationFailure, Unit>> update(Observation observation);
  Future<Either<ObservationFailure, Unit>> delete(UniqueId id);
}

@LazySingleton(as: ICycleRepository)
class CycleRepository implements ICycleRepository {
  final Database _database;
  final observationTableName = 'Observation';

  CycleRepository(
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
    return left(const ObservationFailure.unexpected());
  }

  @override
  Future<Either<ObservationFailure, Unit>> update(Observation observation) async {
    return left(const ObservationFailure.unexpected());
  }

  @override
  Future<Either<ObservationFailure, List<Observation>>> read() async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query(observationTableName);

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
