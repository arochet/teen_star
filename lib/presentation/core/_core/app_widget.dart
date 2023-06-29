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
    String fontFamily = 'MyriadPro';
    return MaterialApp.router(
      title: 'Kyklos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: fontFamily,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: colorpanel(900),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: colorpanel(200),
            fontSize: 14,
          ),
          iconColor: colorpanel(200),
          fillColor: colorpanel(800),
          floatingLabelStyle: TextStyle(color: colorpanel(100)),
          filled: true,
          focusColor: Colors.red,
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(3),
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
          displayLarge: TextStyle(
            color: colorpanel(50),
          ),
          displayMedium: TextStyle(
            color: colorpanel(50),
          ),
          displaySmall: TextStyle(
            color: colorpanel(50),
          ),
          headlineLarge: TextStyle(
            color: actioncolor['primary'],
          ),
          headlineMedium: TextStyle(
            color: actioncolor['primary'],
          ),
          headlineSmall: TextStyle(
            color: actioncolor['primary'],
          ),
          titleLarge: TextStyle(
            color: actioncolor['primary'],
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: actioncolor['primary'],
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: actioncolor['primary'],
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: colorpanel(50),
          ),
          bodyMedium: TextStyle(
            color: colorpanel(50),
          ),
          bodySmall: TextStyle(
            color: colorpanel(50),
          ),
          labelLarge: TextStyle(
            color: colorpanel(50),
          ),
          labelMedium: TextStyle(
            color: colorpanel(50),
          ),
          labelSmall: TextStyle(
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
