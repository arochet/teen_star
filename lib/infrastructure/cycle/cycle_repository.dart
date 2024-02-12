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
import 'observation_dtos.dart';

abstract class ICycleRepository {
  Future<Either<CycleFailure, int>> createCycle();
  Future<Either<CycleFailure, Cycle>> readCycle(UniqueId id);
  Future<Either<CycleFailure, List<CycleDTO>>> readAllCycles();
  Future<Either<CycleFailure, List<Cycle>>> readListCycles(int start, int finish);
  Future<Either<CycleFailure, List<ObservationDTO>>> readAllCyclesHistorique();
  Future<Either<ObservationFailure, UniqueId?>> createObservation(Cycle? cycle, Observation observation);
  Future<Either<ObservationFailure, Unit>> update(Observation observation);
  Future<Either<ObservationFailure, Unit>> delete(UniqueId id);
  Future<Either<CycleFailure, Unit>> resetAll();
  Future<Either<CycleFailure, Unit>> renvoieDernierCycle();
  Future<Either<CycleFailure, Unit>> marquerJourSommet(Cycle cycle, UniqueId id);
  Future<Unit> marquerComme(Observation observation, int i);
  Future<Unit> modifierCouleurAnalyse(Observation observation, CouleurAnalyseState state);
  Future<Unit> marquerJourFertile(List<Observation> observation, bool fertile);
  Future<Unit> enleverPointInterrogation(List<Observation> observation, bool pointInterrogation);
  Future<Either<CycleFailure, DateTime?>> firstDayOfNextCycle(CycleDTO cycle);
  Future<Either<CycleFailure, DateTime?>> lastDayOfPreviousCycle(CycleDTO cycle);
  Future showTables();
  Future<bool> previousCycleHasObservationExceedDate(UniqueId? idCycle, DateTime dateObservation);
  Future<Either<CycleFailure, Unit>> updateObservationInNewCycle(int? cycle, DateTime dateObservation);
  Future<Either<ObservationFailure, Unit>> deleteObservationFromCycle(UniqueId idCycle);
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
  Future showTables() async {
    printDev();

    (await _database.query('sqlite_master')).forEach((row) {
      print(row.values);
    });

    (await _database.query(db_observation)).forEach((row) {
      print(row.values);
    });
  }

  @override
  Future<Either<ObservationFailure, UniqueId?>> createObservation(
      Cycle? cycle, Observation observation) async {
    printDev();
    try {
      //Supprime les observations du même jour
      await _database.delete(db_observation,
          where: 'date = ? AND idCycle = ?',
          whereArgs: [ObservationDTO.fromDomain(observation, 0).date, cycle?.id.getOrCrash()]);

      late UniqueId idCycle;
      //Nouveau cycle
      if (cycle == null) {
        //Création du cycle
        final resultCycle = await createCycle();
        if (resultCycle.isLeft()) {
          return left(resultCycle.foldLeft(ObservationFailure.unexpected(), (previous, r) => previous));
        }
        //Si tout va bien, on ajoute met à jour idCycle
        resultCycle.foldRight(null, (id, previous) {
          idCycle = UniqueId.fromUniqueInt(id);
        });
      } else {
        idCycle = cycle.id;
      }

      //On crée la méchante observation
      final observationDTO = ObservationDTO.fromDomain(observation, idCycle.getOrCrash());
      _database.insert(db_observation, observationDTO.toJson());

      //Retourne l'id du cycle
      return right(idCycle);
    } catch (e) {
      print("$e");
      return left(const ObservationFailure.unexpected());
    }
  }

  @override
  Future<bool> previousCycleHasObservationExceedDate(UniqueId? idCycle, DateTime dateObservation) async {
    printDev();
    return (await readAllCyclesHistorique()).fold((l) => false, (listObservations) {
      for (var observation in listObservations) {
        if (observation.idCycle == (idCycle?.getOrCrash() ?? -1) - 1) {
          if (observation.date! > dateObservation.millisecondsSinceEpoch) {
            print('observation.idCycle: ${observation.idCycle}');
            print('observation.date: ${observation.date}');
            return true;
          }
        }
      }
      return false;
    });
  }

  @override
  Future<Either<CycleFailure, Unit>> updateObservationInNewCycle(
      int? idCycle, DateTime dateObservation) async {
    printDev();
    return (await readAllCyclesHistorique()).fold((l) => left(l), (listObservations) async {
      for (var observation in listObservations) {
        if (observation.idCycle == (idCycle ?? -1) - 1) {
          if (observation.date! > dateObservation.millisecondsSinceEpoch) {
            await _database.update(db_observation, observation.copyWith(idCycle: idCycle).toJson(),
                where: 'id = ?', whereArgs: [observation.id]);
          }
        }
      }
      return right(unit);
    });
  }

  Future<Cycle?> getCyclePrecedant(CycleDTO cycle) async {
    printDev();
    return (await readCycle(UniqueId.fromUniqueInt((cycle.id ?? 0) - 1))).fold((l) => null, (cycle) => cycle);
  }

  @override
  Future<Either<CycleFailure, int>> createCycle() async {
    printDev();
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
    printDev();
    print('id: ${id.getOrCrash()}');
    await _database.delete(db_observation, where: 'id = ?', whereArgs: [id.getOrCrash()]);
    return right(unit);
  }

  @override
  Future<Either<ObservationFailure, Unit>> deleteObservationFromCycle(UniqueId idCycle) async {
    printDev();
    await _database.delete(db_cycle, where: 'id = ?', whereArgs: [idCycle.getOrCrash()]);
    await _database.delete(db_observation, where: 'idCycle = ?', whereArgs: [idCycle.getOrCrash()]);
    return right(unit);
  }

  @override
  Future<Either<ObservationFailure, Unit>> update(Observation observation) async {
    printDev();
    return left(const ObservationFailure.unexpected());
  }

  @override
  Future<Either<CycleFailure, Cycle>> readCycle(UniqueId idCycle) async {
    printDev();
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
        final List<Map<String, dynamic>> mapsObservation = await _database.query(db_observation,
            where: 'idCycle = ?', whereArgs: [cycleDTO.id], orderBy: 'date ASC');
        List<Observation> listObservation = List.generate(mapsObservation.length, (i) {
          return ObservationDTO.fromJson(mapsObservation[i]).toDomain();
        });

        //Charge la date du premier jour du prochain cycle
        final dateFirstDayOfNextCycle = await firstDayOfNextCycle(cycleDTO);
        //Charge la date du premier jour du prochain cycle
        final dateLastDayOfPreviousCycle = await lastDayOfPreviousCycle(cycleDTO);

        //Retourne le Cycle avec les observations liées
        return right(cycleDTO.toDomain(
          listObservation,
          dateFirstDayOfNextCycle.getOrElse(() => null),
          dateLastDayOfPreviousCycle.getOrElse(() => null),
        ));
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
    printDev();
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
  Future<Either<CycleFailure, DateTime?>> firstDayOfNextCycle(CycleDTO cycle) async {
    printDev();
    try {
      final list = await readAllCyclesHistorique();
      return list.fold((l) => left(CycleFailure.unexpected('')), (listObservationDTO) {
        listObservationDTO.sort((a, b) => a.date!.compareTo(b.date!));

        for (var observation in listObservationDTO) {
          if ((cycle.id ?? -10) + 1 == observation.idCycle) {
            return right(DateTime.fromMillisecondsSinceEpoch(observation.date!));
          }
        }

        return right(null);
      });
    } catch (e, trace) {
      print(e);
      print(trace);
      return left(CycleFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<CycleFailure, DateTime?>> lastDayOfPreviousCycle(CycleDTO cycle) async {
    printDev();
    try {
      final list = await readAllCyclesHistorique();
      return list.fold((l) => left(CycleFailure.unexpected('')), (listObservationDTO) {
        listObservationDTO.sort((a, b) => a.date!.compareTo(b.date!));

        for (var observation in listObservationDTO.reversed) {
          if ((cycle.id ?? -10) - 1 == observation.idCycle) {
            return right(DateTime.fromMillisecondsSinceEpoch(observation.date!));
          }
        }

        return right(null);
      });
    } catch (e, trace) {
      print(e);
      print(trace);
      return left(CycleFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<CycleFailure, List<Cycle>>> readListCycles(int start, int finish) async {
    printDev();
    try {
      //Récupère les CyclesDTO (DataTransferObject) sans les observations
      final List<Map<String, dynamic>> mapsCycle =
          await _database.query(db_cycle, where: 'id >= ? AND id <= ?', whereArgs: [start, finish]);
      List<Cycle> cyclesVide = List.generate(mapsCycle.length, (index) {
        return CycleDTO.fromJson(mapsCycle[index]).toDomainEmpty();
      });

      //Pour chaque cycle, on récupère les observations
      List<Cycle> listCycle = [];
      for (var cycle in cyclesVide) {
        final asyncCycle = await readCycle(cycle.id);
        asyncCycle.foldRight(null, (Cycle cyclePlein, previous) {
          listCycle.add(cyclePlein);
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
  Future<Either<CycleFailure, List<ObservationDTO>>> readAllCyclesHistorique() async {
    printDev();
    try {
      //Récupère les CyclesDTO (DataTransferObject)
      String sql =
          "SELECT * FROM $db_cycle INNER JOIN $db_observation ON $db_cycle.id = $db_observation.idCycle";
      final List<Map<String, dynamic>> mapsCycle = await _database.rawQuery(sql);
      List<ObservationDTO> cycleDTO = List.generate(mapsCycle.length, (index) {
        return ObservationDTO.fromJson(mapsCycle[index]);
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
    printDev();
    //Supprimer toutes les données de la base
    await _database.delete(db_cycle);
    await _database.delete(db_observation);
    return right(unit);
  }

  @override
  Future<Either<CycleFailure, Unit>> renvoieDernierCycle() async {
    printDev();
    final Either<CycleFailure, List<CycleDTO>> list = await readAllCycles();
    return list.fold((l) => left(l), (listCycle) async {
      //Il n'y a pas assez de cycle
      if (listCycle.length < 2) return left(CycleFailure.unexpected('Pas assez de cycle'));

      //Récupère le dernier cycle
      final lastCycle = Cycle.lastId(listCycle.map((e) => e.toDomainEmpty()).toList());
      if (lastCycle == null) return left(CycleFailure.cycleUnfound());

      //On met à jour les observations du cycle précédent
      Map<String, dynamic> row = {'idCycle': lastCycle.getOrCrash() - 1};
      await _database.update(db_observation, row, where: 'idCycle = ?', whereArgs: [lastCycle.getOrCrash()]);
      await _database.delete(db_cycle, where: 'id = ?', whereArgs: [lastCycle.getOrCrash()]);
      return right(unit);
    });
  }

  @override
  Future<Either<CycleFailure, Unit>> marquerJourSommet(Cycle cycle, UniqueId id) async {
    printDev();
    await _database.update(db_cycle, {'idJourneeSoleil': id.getOrCrash()},
        where: 'id = ?', whereArgs: [cycle.id.getOrCrash()]);
    return right(unit);
  }

  @override
  Future<Unit> marquerComme(Observation observation, int i) async {
    printDev();
    await _database.update(db_observation, {'marque': i},
        where: 'id = ?', whereArgs: [observation.id.getOrCrash()]);
    return unit;
  }

  @override
  Future<Unit> modifierCouleurAnalyse(Observation observation, CouleurAnalyseState state) async {
    printDev();
    await _database.update(db_observation, {'analyse': state.toString()},
        where: 'id = ?', whereArgs: [observation.id.getOrCrash()]);
    return unit;
  }

  @override
  Future<Unit> marquerJourFertile(List<Observation> observation, bool fertile) async {
    printDev();
    for (var obs in observation) {
      await _database.update(db_observation, {'jourFertile': fertile ? 1 : 0},
          where: 'id = ?', whereArgs: [obs.id.getOrCrash()]);
    }
    return unit;
  }

  @override
  Future<Unit> enleverPointInterrogation(List<Observation> observation, bool pointInterrogation) async {
    printDev();
    for (var obs in observation) {
      await _database.update(db_observation, {'enleverPointInterrogation': pointInterrogation ? 1 : 0},
          where: 'id = ?', whereArgs: [obs.id.getOrCrash()]);
    }
    return unit;
  }
}
