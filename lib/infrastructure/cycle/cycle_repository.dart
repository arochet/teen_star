import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/observation_failure.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'cycle_dtos.dart';
import 'observation_historique_dtos.dart';
import 'observation_dtos.dart';

abstract class ICycleRepository {
  Future<Either<CycleFailure, int>> createCycle();
  Future<Either<CycleFailure, Cycle>> readCycle(UniqueId id);
  Future<Either<CycleFailure, List<CycleDTO>>> readAllCycles();
  Future<Either<CycleFailure, List<Cycle>>> readListCycles(int start, int finish);
  Future<Either<CycleFailure, List<ObservationHistoriqueDTO>>> readAllCyclesHistorique();
  Future<Either<ObservationFailure, Unit>> createObservation(Cycle? cycle, Observation observation);
  Future<Either<ObservationFailure, Unit>> update(Observation observation);
  Future<Either<ObservationFailure, Unit>> delete(UniqueId id);
  Future<Either<CycleFailure, Unit>> resetAll();
  Future<Either<CycleFailure, Unit>> renvoieDernierCycle();
  Future<Either<CycleFailure, Unit>> marquerJourSommet(Cycle cycle, UniqueId id);
  Future<Unit> marquerComme(Observation observation, int i);
  Future<Unit> modifierCouleurAnalyse(Observation observation, CouleurAnalyseState state);
  Future<Unit> marquerJourFertile(List<Observation> observation, bool fertile);
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
      //Supprime les observations du m??me jour
      await _database.delete(db_observation,
          where: 'date = ?', whereArgs: [ObservationDTO.fromDomain(observation, 0).date]);

      late UniqueId idCycle;
      if (cycle == null) {
        //Cr??ation du cycle
        final resultCycle = await createCycle();
        if (resultCycle.isLeft()) {
          return left(resultCycle.foldLeft(ObservationFailure.unexpected(), (previous, r) => previous));
        }
        //Si tout va bien, on ajoute met ?? jour idCycle
        resultCycle.foldRight(null, (r, previous) {
          idCycle = UniqueId.fromUniqueInt(r);
        });
      } else {
        idCycle = cycle.id;
      }

      //On cr??e la m??chante observation
      final observationDTO = ObservationDTO.fromDomain(observation, idCycle.getOrCrash());
      _database.insert(db_observation, observationDTO.toJson());

      return right(unit);
    } catch (e) {
      print("$e");
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
    print('id: ${id.getOrCrash()}');
    await _database.delete(db_observation, where: 'id = ?', whereArgs: [id.getOrCrash()]);
    return right(unit);
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
      //R??cup??re les CyclesDTO (DataTransferObject)
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

        //Retourne le Cycle avec les observations li??es
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
      //R??cup??re les CyclesDTO (DataTransferObject)
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
  Future<Either<CycleFailure, List<Cycle>>> readListCycles(int start, int finish) async {
    printDev('readListCycles(UniqueId start, UniqueId finish)');
    try {
      //R??cup??re les CyclesDTO (DataTransferObject) sans les observations
      final List<Map<String, dynamic>> mapsCycle =
          await _database.query(db_cycle, where: 'id >= ? AND id <= ?', whereArgs: [start, finish]);
      List<Cycle> cyclesVide = List.generate(mapsCycle.length, (index) {
        return CycleDTO.fromJson(mapsCycle[index]).toDomain([]);
      });

      //Pour chaque cycle, on r??cup??re les observations
      List<Cycle> listCycle = [];
      for (var cycle in cyclesVide) {
        final asyncCycle = await readCycle(cycle.id);
        asyncCycle.foldRight(null, (Cycle r, previous) {
          listCycle.add(r);
        });
      }

      return right(listCycle);
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
      //R??cup??re les CyclesDTO (DataTransferObject)
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
    //Supprimer toutes les donn??es de la base
    await _database.delete(db_cycle);
    await _database.delete(db_observation);
    return right(unit);
  }

  @override
  Future<Either<CycleFailure, Unit>> renvoieDernierCycle() async {
    printDev('renvoieDernierCycle()');
    final Either<CycleFailure, List<CycleDTO>> list = await readAllCycles();
    return list.fold((l) => left(l), (listCycle) async {
      //Il n'y a pas assez de cycle
      if (listCycle.length < 2) return left(CycleFailure.unexpected('Pas assez de cycle'));

      //R??cup??re le dernier cycle
      final lastCycle = listCycle.last;
      if (lastCycle.id == null) return left(CycleFailure.cycleUnfound());

      //On met ?? jour les observations du cycle pr??c??dent
      Map<String, dynamic> row = {'idCycle': lastCycle.id! - 1};
      await _database.update(db_observation, row, where: 'idCycle = ?', whereArgs: [lastCycle.id]);
      await _database.delete(db_cycle, where: 'id = ?', whereArgs: [lastCycle.id]);
      return right(unit);
    });
  }

  @override
  Future<Either<CycleFailure, Unit>> marquerJourSommet(Cycle cycle, UniqueId id) async {
    printDev('marquerJourSommet(Cycle cycle, UniqueId id)');
    await _database.update(db_cycle, {'idJourneeSoleil': id.getOrCrash()},
        where: 'id = ?', whereArgs: [cycle.id.getOrCrash()]);
    return right(unit);
  }

  @override
  Future<Unit> marquerComme(Observation observation, int i) async {
    printDev('marquerComme(Observation observation, int i)');
    await _database.update(db_observation, {'marque': i},
        where: 'id = ?', whereArgs: [observation.id.getOrCrash()]);
    return unit;
  }

  @override
  Future<Unit> modifierCouleurAnalyse(Observation observation, CouleurAnalyseState state) async {
    printDev('modifierCouleurAnalyse(Observation observation, CouleurAnalyseState state)');
    await _database.update(db_observation, {'analyse': state.toString()},
        where: 'id = ?', whereArgs: [observation.id.getOrCrash()]);
    return unit;
  }

  @override
  Future<Unit> marquerJourFertile(List<Observation> observation, bool fertile) async {
    printDev('marquerJourInfertile(List<Observation> observation)');
    for (var obs in observation) {
      await _database.update(db_observation, {'jourFertile': fertile ? 1 : 0},
          where: 'id = ?', whereArgs: [obs.id.getOrCrash()]);
    }
    return unit;
  }
}
