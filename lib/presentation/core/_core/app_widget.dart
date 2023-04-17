import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'none_transition_builder.dart';

final _appRouter = AppRouter();

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return MaterialApp.router(
      title: 'TeenSTAR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: colorpanel(900),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: colorpanel(200)),
          iconColor: colorpanel(200),
          fillColor: colorpanel(800),
          floatingLabelStyle: TextStyle(color: colorpanel(100)),
          filled: true,
          focusColor: Colors.red,
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.macOS: NonePageTransitionsBuilder(),
          TargetPlatform.windows: NonePageTransitionsBuilder(),
          TargetPlatform.linux: NonePageTransitionsBuilder(),
        }),
        textTheme: theme.textTheme.copyWith(
          headline1: TextStyle(
            fontSize: 38.0,
            fontFamily: 'MyriadPro',
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          headline2: TextStyle(
            fontFamily: 'MyriadPro',
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          headline3: TextStyle(
            fontFamily: 'MyriadPro',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          headline4: TextStyle(
            fontFamily: 'MyriadPro',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          headline5: TextStyle(
            fontFamily: 'MyriadPro',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          headline6: TextStyle(
            fontFamily: 'MyriadPro',
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          subtitle1: TextStyle(
            fontFamily: 'MyriadPro',
            color: colorpanel(50),
          ),
          button: TextStyle(
            fontFamily: 'MyriadPro',
            color: colorpanel(50),
          ),
          bodyText1: TextStyle(
            fontFamily: 'MyriadPro',
            color: colorpanel(50),
          ),
        ),
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
