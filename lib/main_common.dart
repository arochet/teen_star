import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:teenstar/injection.dart';
import 'package:teenstar/PRESENTATION/core/_core/app_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'PRESENTATION/core/_utils/dev_utils.dart';
import 'config_reader.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> mainCommon(Environment env) async {
  configurationInjection(env.name);
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(Duration(seconds: 3), () {
    FlutterNativeSplash.remove();
  });

  //Notifications
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'scheduled_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(channelGroupKey: 'basic_channel_group', channelGroupName: 'Basic group')
      ],
      debug: true);

  //Pour afficher les erreurs de flutter dans la console
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

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
          'evenementsAutre TEXT,'
          'temperatureBasale DOUBLE,'
          'humeur TEXT,'
          'humeurAutre TEXT,'
          'notesConfidentielles TEXT,'
          'commentaireAnimatrice TEXT,'
          'marque INTEGER,'
          'jourFertile INTEGER,'
          'idCycle INTEGER NOT NULL,'
          'enleverPointInterrogation INTEGER,'
          'FOREIGN KEY (idCycle) REFERENCES Cycle (id) ON DELETE NO ACTION ON UPDATE NO ACTION)');
      await db.execute('CREATE TABLE Cycle('
          'id INTEGER PRIMARY KEY,'
          'idJourneeSoleil INTEGER NOT NULL,'
          'FOREIGN KEY (idJourneeSoleil) REFERENCES Observation (id) ON DELETE NO ACTION ON UPDATE NO ACTION)');
      return;
    },
    onUpgrade: _onUpgrade,
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 2,
  );

  //Sert à injecter la database dans l'application
  getIt.registerSingleton<Database>(await database);
  //Sert à afficher les logs en mode dev
  getIt.registerSingleton<AppLog>(AppLog());

  runApp(MainApp(env: env));
}

void _onUpgrade(Database db, int oldVersion, int newVersion) {
  if (oldVersion < newVersion) {
    // you can execute drop table and create table
    db.execute("ALTER TABLE Observation ADD COLUMN enleverPointInterrogation INTEGER;");
  }
}

class MainApp extends StatefulWidget {
  final Environment env;
  const MainApp({
    Key? key,
    required this.env,
  }) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [environment.overrideWith((ref) => widget.env)],
      child: AppWidget(),
    );
  }
}
