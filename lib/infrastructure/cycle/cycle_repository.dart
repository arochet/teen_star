import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/observation_failure.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'cycle_dtos.dart';
import 'observation_historique_dtos.dart';
import 'observation_dtos.dart';

abstract class ICycleRepository {
  Future<Either<CycleFailure, int>> createCycle();
  Future<Either<CycleFailure, Cycle>> readCycle(UniqueId id);
  Future<Either<CycleFailure, List<CycleDTO>>> readAllCycles();
  Future<Either<CycleFailure, List<ObservationHistoriqueDTO>>> readAllCyclesHistorique();
  Future<Either<ObservationFailure, Unit>> createObservation(Cycle? cycle, Observation observation);
  Future<Either<ObservationFailure, Unit>> update(Observation observation);
  Future<Either<ObservationFailure, Unit>> delete(UniqueId id);
  Future<Either<CycleFailure, Unit>> resetAll();
}

@LazySingleton(as: ICycleRepository)
class CycleRepository implements ICycleRepository {
  final Database _database;
  final db_observation = 'Observation';
  final db_cycle = 'Cycle';

  CycleRepository(
    this._database,
  );

  @override
  Future<Either<ObservationFailure, Unit>> createObservation(Cycle? cycle, Observation observation) async {
    printDev('createObservation(Cycle? cycle, Observation observation)');
    try {
      late UniqueId idCycle;
      if (cycle == null) {
        //Création du cycle
        final resultCycle = await createCycle();
        if (resultCycle.isLeft()) {
          return left(resultCycle.foldLeft(ObservationFailure.unexpected(), (previous, r) => previous));
        }
        //Si tout va bien, on ajoute met à jour idCycle
        resultCycle.foldRight(null, (r, previous) {
          idCycle = UniqueId.fromUniqueInt(r);
        });
      } else {
        idCycle = cycle.id;
      }

      //On crée la méchante observation
      final observationDTO = ObservationDTO.fromDomain(observation, idCycle.getOrCrash());
      _database.insert(db_observation, observationDTO.toJson());

      return right(unit);
    } catch (e) {
      return left(const ObservationFailure.unexpected());
    }
  }

  @override
  Future<Either<CycleFailure, int>> createCycle() async {
    printDev('createCycle()');
    try {
      CycleDTO newCycle = CycleDTO(idJourneeSoleil: -1);
      int idCycle = await _database.insert(db_cycle, newCycle.toJson());
      return right(idCycle);
    } catch (e) {
      print(e);
      return left(CycleFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<ObservationFailure, Unit>> delete(UniqueId id) async {
    printDev('delete(UniqueId id)');
    return left(const ObservationFailure.unexpected());
  }

  @override
  Future<Either<ObservationFailure, Unit>> update(Observation observation) async {
    printDev('update(Observation observation)');
    return left(const ObservationFailure.unexpected());
  }

  @override
  Future<Either<CycleFailure, Cycle>> readCycle(UniqueId idCycle) async {
    printDev('readCycle(UniqueId idCycle)');
    try {
      //Récupère les CyclesDTO (DataTransferObject)
      final List<Map<String, dynamic>> mapsCycle =
          await _database.query(db_cycle, where: 'id = ?', whereArgs: [idCycle.getOrCrash()]);
      if (mapsCycle.length == 0) {
        return left(CycleFailure.cycleUnfound());
      }

      //CycleDTO courant
      CycleDTO cycleDTO = List.generate(mapsCycle.length, (index) {
        return CycleDTO.fromJson(mapsCycle[index]);
      }).first;

      if (cycleDTO.id != null) {
        //Charge les Observations du Cycle
        final List<Map<String, dynamic>> mapsObservation =
            await _database.query(db_observation, where: 'idCycle = ?', whereArgs: [cycleDTO.id]);
        List<Observation> listObservation = List.generate(mapsObservation.length, (i) {
          return ObservationDTO.fromJson(mapsObservation[i]).toDomain();
        });

        //Retourne le Cycle avec les observations liées
        return right(cycleDTO.toDomain(listObservation));
      } else {
        return left(CycleFailure.idCycleUnfound());
      }
    } catch (e, trace) {
      print(e);
      print(trace);
      return left(CycleFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<CycleFailure, List<CycleDTO>>> readAllCycles() async {
    printDev('readAllCycles()');
    try {
      //Récupère les CyclesDTO (DataTransferObject)
      final List<Map<String, dynamic>> mapsCycle = await _database.query(db_cycle);
      List<CycleDTO> cycleDTO = List.generate(mapsCycle.length, (index) {
        return CycleDTO.fromJson(mapsCycle[index]);
      });

      return right(cycleDTO);
    } catch (e, trace) {
      print(e);
      print(trace);
      return left(CycleFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<CycleFailure, List<ObservationHistoriqueDTO>>> readAllCyclesHistorique() async {
    printDev('readAllCyclesHistorique()');
    try {
      //Récupère les CyclesDTO (DataTransferObject)
      String sql =
          "SELECT * FROM $db_cycle INNER JOIN $db_observation ON $db_cycle.id = $db_observation.idCycle";
      final List<Map<String, dynamic>> mapsCycle = await _database.rawQuery(sql);
      List<ObservationHistoriqueDTO> cycleDTO = List.generate(mapsCycle.length, (index) {
        return ObservationHistoriqueDTO.fromJson(mapsCycle[index]);
      });

      return right(cycleDTO);
    } catch (e, trace) {
      print(e);
      print(trace);
      return left(CycleFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<CycleFailure, Unit>> resetAll() async {
    printDev('resetAll()');
    //Supprimer toutes les données de la base
    await _database.delete(db_cycle);
    await _database.delete(db_observation);
    return right(unit);
  }
}
