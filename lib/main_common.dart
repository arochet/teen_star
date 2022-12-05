import 'package:sqflite/sqflite.dart';
import 'package:teenstar/firebase_options.dart';
import 'package:teenstar/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:teenstar/injection.dart';
import 'package:teenstar/PRESENTATION/core/_core/app_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'config_reader.dart';

Future<void> mainCommon(Environment env) async {
  configurationInjection(env.name);
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  await Firebase.initializeApp(
    name: 'base-de-projet',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final database = openDatabase(
    join(await getDatabasesPath(), 'ts_database.db'),
    onCreate: (db, version) async {
      await db.execute('PRAGMA foreign_keys = ON');
      await db.execute('CREATE TABLE Observation('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'date INTEGER,'
          'couleur TEXT,'
          'analyse TEXT,'
          'sensation TEXT,'
          'sensationsAutre TEXT,'
          'sang TEXT,'
          'mucus TEXT,'
          'mucusAutre TEXT,'
          'douleurs TEXT,'
          'douleursAutre TEXT,'
          'evenements TEXT,'
          'temperatureBasale INTEGER,'
          'humeur TEXT,'
          'humeurAutre TEXT,'
          'notesConfidentielles TEXT,'
          'commentaireAnimatrice TEXT,'
          'idCycle INTEGER NOT NULL,'
          'FOREIGN KEY (idCycle) REFERENCES Cycle (id) ON DELETE NO ACTION ON UPDATE NO ACTION)');
      await db.execute('CREATE TABLE Cycle('
          'id INTEGER PRIMARY KEY,'
          'idJourneeSoleil INTEGER NOT NULL,'
          'FOREIGN KEY (idJourneeSoleil) REFERENCES Observation (id) ON DELETE NO ACTION ON UPDATE NO ACTION)');
      return;
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  getIt.registerSingleton<Database>(await database);

  runApp(MainApp(env: env));
}

class MainApp extends StatelessWidget {
  final Environment env;
  const MainApp({
    Key? key,
    required this.env,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [environment.overrideWith((ref) => env)],
      child: AppWidget(),
    );
  }
}
