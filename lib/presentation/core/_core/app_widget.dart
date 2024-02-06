import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_form.dart';
import 'package:teenstar/providers.dart';
import 'none_transition_builder.dart';

final _appRouter = AppRouter();

class AppWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    String fontFamily = 'MyriadPro';
    return MaterialApp.router(
        title: 'Kyklos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: fontFamily,
          primaryColor: Colors.red,
          scaffoldBackgroundColor: ref.watch(themeApp).value?.color,
          dialogBackgroundColor: ref.watch(themeApp).value?.color,
          canvasColor: ref.watch(themeApp).value?.color,
          cardColor: ref.watch(themeApp).value?.color,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
              color: colorpanel(200),
              fontSize: 14,
            ),
            iconColor: colorpanel(200),
            fillColor: ref.watch(themeApp).value?.color2,
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
        builder: (context, child) {
          return Localizations.override(
            context: context,
            locale: Locale(ref.watch(languageApp).value?.code ?? 'en'),
            child: child!,
          );
        });
  }
}

//POUR LES NOTIFICATIONS

class InitNotifications extends ConsumerStatefulWidget {
  final Widget child;
  const InitNotifications({Key? key, required this.child}) : super(key: key);

  @override
  __MainState createState() => __MainState();
}

class __MainState extends ConsumerState<InitNotifications> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.allownotifications),
            content: Text(AppLocalizations.of(context)!.ourappwouldliketosendnotifications),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.dontallow,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    )),
              ),
              TextButton(
                onPressed: () {
                  AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context));
                },
                child: Text(AppLocalizations.of(context)!.allow,
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                    )),
              )
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    //AwesomeNotifications().actionSink.close();
    //AwesomeNotifications().createdSink.close();
    super.dispose();
  }
}
