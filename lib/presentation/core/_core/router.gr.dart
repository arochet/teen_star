// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountPage(),
      );
    },
    AuthConnexionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthConnexionPage(),
      );
    },
    AuthInitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthInitPage(),
      );
    },
    AuthRegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthRegisterPage(),
      );
    },
    AuthResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthResetPasswordPage(),
      );
    },
    ButtonsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ButtonsPage(),
      );
    },
    ColorsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ColorsPage(),
      );
    },
    ComponentsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ComponentsPage(),
      );
    },
    Condition_utilisationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Condition_utilisationPage(),
      );
    },
    CyclesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CyclesPage(),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeleteAccountPage(),
      );
    },
    Guide_avanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Guide_avancePage(),
      );
    },
    Guide_de_baseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Guide_de_basePage(),
      );
    },
    HistoriqueRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoriquePage(),
      );
    },
    Info_applicationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Info_applicationPage(),
      );
    },
    LangueRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LanguePage(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<MainNavigationRouteArgs>(
          orElse: () => const MainNavigationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainNavigationPage(key: args.key),
      );
    },
    ModifyAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ModifyAccountPage(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<NewPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewPasswordPage(
          key: args.key,
          isMotDePasseAppli: args.isMotDePasseAppli,
        ),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsPage(),
      );
    },
    ObservationAddRoute.name: (routeData) {
      final args = routeData.argsAs<ObservationAddRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ObservationAddPage(
          args.cycle,
          args.date,
          key: args.key,
          observation: args.observation,
        ),
      );
    },
    ReauthenticateRoute.name: (routeData) {
      final args = routeData.argsAs<ReauthenticateRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReauthenticatePage(
          key: args.key,
          route: args.route,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    TextStyleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TextStylePage(),
      );
    },
    UtilsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UtilsPage(),
      );
    },
  };
}

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthConnexionPage]
class AuthConnexionRoute extends PageRouteInfo<void> {
  const AuthConnexionRoute({List<PageRouteInfo>? children})
      : super(
          AuthConnexionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthConnexionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthInitPage]
class AuthInitRoute extends PageRouteInfo<void> {
  const AuthInitRoute({List<PageRouteInfo>? children})
      : super(
          AuthInitRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthInitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthRegisterPage]
class AuthRegisterRoute extends PageRouteInfo<void> {
  const AuthRegisterRoute({List<PageRouteInfo>? children})
      : super(
          AuthRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthResetPasswordPage]
class AuthResetPasswordRoute extends PageRouteInfo<void> {
  const AuthResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          AuthResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ButtonsPage]
class ButtonsRoute extends PageRouteInfo<void> {
  const ButtonsRoute({List<PageRouteInfo>? children})
      : super(
          ButtonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ButtonsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ColorsPage]
class ColorsRoute extends PageRouteInfo<void> {
  const ColorsRoute({List<PageRouteInfo>? children})
      : super(
          ColorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ColorsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ComponentsPage]
class ComponentsRoute extends PageRouteInfo<void> {
  const ComponentsRoute({List<PageRouteInfo>? children})
      : super(
          ComponentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComponentsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Condition_utilisationPage]
class Condition_utilisationRoute extends PageRouteInfo<void> {
  const Condition_utilisationRoute({List<PageRouteInfo>? children})
      : super(
          Condition_utilisationRoute.name,
          initialChildren: children,
        );

  static const String name = 'Condition_utilisationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CyclesPage]
class CyclesRoute extends PageRouteInfo<void> {
  const CyclesRoute({List<PageRouteInfo>? children})
      : super(
          CyclesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CyclesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeleteAccountPage]
class DeleteAccountRoute extends PageRouteInfo<void> {
  const DeleteAccountRoute({List<PageRouteInfo>? children})
      : super(
          DeleteAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeleteAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Guide_avancePage]
class Guide_avanceRoute extends PageRouteInfo<void> {
  const Guide_avanceRoute({List<PageRouteInfo>? children})
      : super(
          Guide_avanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'Guide_avanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Guide_de_basePage]
class Guide_de_baseRoute extends PageRouteInfo<void> {
  const Guide_de_baseRoute({List<PageRouteInfo>? children})
      : super(
          Guide_de_baseRoute.name,
          initialChildren: children,
        );

  static const String name = 'Guide_de_baseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoriquePage]
class HistoriqueRoute extends PageRouteInfo<void> {
  const HistoriqueRoute({List<PageRouteInfo>? children})
      : super(
          HistoriqueRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoriqueRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Info_applicationPage]
class Info_applicationRoute extends PageRouteInfo<void> {
  const Info_applicationRoute({List<PageRouteInfo>? children})
      : super(
          Info_applicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'Info_applicationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LanguePage]
class LangueRoute extends PageRouteInfo<void> {
  const LangueRoute({List<PageRouteInfo>? children})
      : super(
          LangueRoute.name,
          initialChildren: children,
        );

  static const String name = 'LangueRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainNavigationPage]
class MainNavigationRoute extends PageRouteInfo<MainNavigationRouteArgs> {
  MainNavigationRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MainNavigationRoute.name,
          args: MainNavigationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';

  static const PageInfo<MainNavigationRouteArgs> page =
      PageInfo<MainNavigationRouteArgs>(name);
}

class MainNavigationRouteArgs {
  const MainNavigationRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MainNavigationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ModifyAccountPage]
class ModifyAccountRoute extends PageRouteInfo<void> {
  const ModifyAccountRoute({List<PageRouteInfo>? children})
      : super(
          ModifyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'ModifyAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPasswordPage]
class NewPasswordRoute extends PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    Key? key,
    required bool isMotDePasseAppli,
    List<PageRouteInfo>? children,
  }) : super(
          NewPasswordRoute.name,
          args: NewPasswordRouteArgs(
            key: key,
            isMotDePasseAppli: isMotDePasseAppli,
          ),
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static const PageInfo<NewPasswordRouteArgs> page =
      PageInfo<NewPasswordRouteArgs>(name);
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({
    this.key,
    required this.isMotDePasseAppli,
  });

  final Key? key;

  final bool isMotDePasseAppli;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key, isMotDePasseAppli: $isMotDePasseAppli}';
  }
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ObservationAddPage]
class ObservationAddRoute extends PageRouteInfo<ObservationAddRouteArgs> {
  ObservationAddRoute({
    required Cycle? cycle,
    required DateTime date,
    Key? key,
    Observation? observation,
    List<PageRouteInfo>? children,
  }) : super(
          ObservationAddRoute.name,
          args: ObservationAddRouteArgs(
            cycle: cycle,
            date: date,
            key: key,
            observation: observation,
          ),
          initialChildren: children,
        );

  static const String name = 'ObservationAddRoute';

  static const PageInfo<ObservationAddRouteArgs> page =
      PageInfo<ObservationAddRouteArgs>(name);
}

class ObservationAddRouteArgs {
  const ObservationAddRouteArgs({
    required this.cycle,
    required this.date,
    this.key,
    this.observation,
  });

  final Cycle? cycle;

  final DateTime date;

  final Key? key;

  final Observation? observation;

  @override
  String toString() {
    return 'ObservationAddRouteArgs{cycle: $cycle, date: $date, key: $key, observation: $observation}';
  }
}

/// generated route for
/// [ReauthenticatePage]
class ReauthenticateRoute extends PageRouteInfo<ReauthenticateRouteArgs> {
  ReauthenticateRoute({
    Key? key,
    required PageRouteInfo<dynamic> route,
    List<PageRouteInfo>? children,
  }) : super(
          ReauthenticateRoute.name,
          args: ReauthenticateRouteArgs(
            key: key,
            route: route,
          ),
          initialChildren: children,
        );

  static const String name = 'ReauthenticateRoute';

  static const PageInfo<ReauthenticateRouteArgs> page =
      PageInfo<ReauthenticateRouteArgs>(name);
}

class ReauthenticateRouteArgs {
  const ReauthenticateRouteArgs({
    this.key,
    required this.route,
  });

  final Key? key;

  final PageRouteInfo<dynamic> route;

  @override
  String toString() {
    return 'ReauthenticateRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TextStylePage]
class TextStyleRoute extends PageRouteInfo<void> {
  const TextStyleRoute({List<PageRouteInfo>? children})
      : super(
          TextStyleRoute.name,
          initialChildren: children,
        );

  static const String name = 'TextStyleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UtilsPage]
class UtilsRoute extends PageRouteInfo<void> {
  const UtilsRoute({List<PageRouteInfo>? children})
      : super(
          UtilsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UtilsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
