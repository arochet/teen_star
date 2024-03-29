// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:flutter/material.dart' as _i27;

import '../../../DOMAIN/cycle/cycle.dart' as _i28;
import '../../../DOMAIN/cycle/observation.dart' as _i29;
import '../../auth/auth_connexion/auth_connexion_page.dart' as _i4;
import '../../auth/auth_init/auth_init_page.dart' as _i3;
import '../../auth/auth_register/auth_register_page.dart' as _i5;
import '../../auth/auth_reset_password.dart/auth_reset_password_page.dart'
    as _i6;
import '../../auth/condition_utilisation/condition_utilisation_page.dart'
    as _i19;
import '../../cycle/ajout_observation_journee/ajout_observation_journee_page.dart'
    as _i16;
import '../../cycle/cycles_page.dart' as _i23;
import '../../historique/historique_page.dart' as _i24;
import '../../reglages/account/account_page.dart' as _i25;
import '../../reglages/account/buttons/buttons.dart' as _i13;
import '../../reglages/account/colors/colors.dart' as _i12;
import '../../reglages/account/components/components_page.dart' as _i11;
import '../../reglages/account/text_style/text_style.dart' as _i14;
import '../../reglages/account/utils/utils_page.dart' as _i15;
import '../../reglages/delete_account/delete_account_page.dart' as _i9;
import '../../reglages/guide_avance/guide_avance_page.dart' as _i20;
import '../../reglages/guide_de_base/guide_de_base_page.dart' as _i18;
import '../../reglages/info_application/info_application_page.dart' as _i21;
import '../../reglages/langue/langue_page.dart' as _i17;
import '../../reglages/modify_account/modify_account_page.dart' as _i7;
import '../../reglages/new_password/new_password_page.dart' as _i10;
import '../../reglages/notifications/notifications_page.dart' as _i22;
import '../../reglages/reauthenticate/reauthenticate_page.dart' as _i8;
import '../_main_navigation/main_navigation_page.dart' as _i2;
import '../_splash/splash_page.dart' as _i1;

class AppRouter extends _i26.RootStackRouter {
  AppRouter([_i27.GlobalKey<_i27.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<MainNavigationRouteArgs>(
          orElse: () => const MainNavigationRouteArgs());
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.MainNavigationPage(key: args.key),
      );
    },
    AuthInitRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthInitPage(),
      );
    },
    AuthConnexionRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AuthConnexionPage(),
      );
    },
    AuthRegisterRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AuthRegisterPage(),
      );
    },
    AuthResetPasswordRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AuthResetPasswordPage(),
      );
    },
    ModifyAccountRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ModifyAccountPage(),
      );
    },
    ReauthenticateRoute.name: (routeData) {
      final args = routeData.argsAs<ReauthenticateRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ReauthenticatePage(
          key: args.key,
          route: args.route,
        ),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.DeleteAccountPage(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<NewPasswordRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.NewPasswordPage(
          key: args.key,
          isMotDePasseAppli: args.isMotDePasseAppli,
        ),
      );
    },
    ComponentsRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.ComponentsPage(),
      );
    },
    ColorsRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ColorsPage(),
      );
    },
    ButtonsRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ButtonsPage(),
      );
    },
    TextStyleRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.TextStylePage(),
      );
    },
    UtilsRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.UtilsPage(),
      );
    },
    ObservationAddRoute.name: (routeData) {
      final args = routeData.argsAs<ObservationAddRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.ObservationAddPage(
          args.cycle,
          args.date,
          key: args.key,
          observation: args.observation,
        ),
      );
    },
    LangueRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.LanguePage(),
      );
    },
    Principes_de_baseRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.Guide_de_basePage(),
      );
    },
    Condition_utilisationRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.Condition_utilisationPage(),
      );
    },
    Guide_avanceRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.Guide_avancePage(),
      );
    },
    Info_applicationRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.Info_applicationPage(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.NotificationsPage(),
      );
    },
    CyclesRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.CyclesPage(),
      );
    },
    HistoriqueRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.HistoriquePage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.AccountPage(),
      );
    },
  };

  @override
  List<_i26.RouteConfig> get routes => [
        _i26.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i26.RouteConfig(
          MainNavigationRoute.name,
          path: '/main',
          children: [
            _i26.RouteConfig(
              '#redirect',
              path: '',
              parent: MainNavigationRoute.name,
              redirectTo: 'resume-route',
              fullMatch: true,
            ),
            _i26.RouteConfig(
              CyclesRoute.name,
              path: 'cycles-route',
              parent: MainNavigationRoute.name,
            ),
            _i26.RouteConfig(
              HistoriqueRoute.name,
              path: 'historique-route',
              parent: MainNavigationRoute.name,
            ),
            _i26.RouteConfig(
              AccountRoute.name,
              path: 'account',
              parent: MainNavigationRoute.name,
            ),
          ],
        ),
        _i26.RouteConfig(
          AuthInitRoute.name,
          path: '/auth-init',
        ),
        _i26.RouteConfig(
          AuthConnexionRoute.name,
          path: '/auth-connexion',
        ),
        _i26.RouteConfig(
          AuthRegisterRoute.name,
          path: '/auth-register',
        ),
        _i26.RouteConfig(
          AuthResetPasswordRoute.name,
          path: '/auth-reset-password',
        ),
        _i26.RouteConfig(
          ModifyAccountRoute.name,
          path: '/modify-account',
        ),
        _i26.RouteConfig(
          ReauthenticateRoute.name,
          path: '/reauthenticate',
        ),
        _i26.RouteConfig(
          DeleteAccountRoute.name,
          path: '/delete-account',
        ),
        _i26.RouteConfig(
          NewPasswordRoute.name,
          path: '/new-password',
        ),
        _i26.RouteConfig(
          ComponentsRoute.name,
          path: '/components-route',
        ),
        _i26.RouteConfig(
          ColorsRoute.name,
          path: '/colors-route',
        ),
        _i26.RouteConfig(
          ButtonsRoute.name,
          path: '/buttons-route',
        ),
        _i26.RouteConfig(
          TextStyleRoute.name,
          path: '/textStyle-route',
        ),
        _i26.RouteConfig(
          UtilsRoute.name,
          path: '/utils-route',
        ),
        _i26.RouteConfig(
          ObservationAddRoute.name,
          path: '/observation-add-route',
        ),
        _i26.RouteConfig(
          LangueRoute.name,
          path: '/langue-route',
        ),
        _i26.RouteConfig(
          Principes_de_baseRoute.name,
          path: '/principes_de_base-route',
        ),
        _i26.RouteConfig(
          Condition_utilisationRoute.name,
          path: '/condition_utilisation-route',
        ),
        _i26.RouteConfig(
          Guide_avanceRoute.name,
          path: '/guide_avance-route',
        ),
        _i26.RouteConfig(
          Info_applicationRoute.name,
          path: '/info_application-route',
        ),
        _i26.RouteConfig(
          NotificationsRoute.name,
          path: '/notifications-route',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i26.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainNavigationPage]
class MainNavigationRoute extends _i26.PageRouteInfo<MainNavigationRouteArgs> {
  MainNavigationRoute({
    _i27.Key? key,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          MainNavigationRoute.name,
          path: '/main',
          args: MainNavigationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';
}

class MainNavigationRouteArgs {
  const MainNavigationRouteArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'MainNavigationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.AuthInitPage]
class AuthInitRoute extends _i26.PageRouteInfo<void> {
  const AuthInitRoute()
      : super(
          AuthInitRoute.name,
          path: '/auth-init',
        );

  static const String name = 'AuthInitRoute';
}

/// generated route for
/// [_i4.AuthConnexionPage]
class AuthConnexionRoute extends _i26.PageRouteInfo<void> {
  const AuthConnexionRoute()
      : super(
          AuthConnexionRoute.name,
          path: '/auth-connexion',
        );

  static const String name = 'AuthConnexionRoute';
}

/// generated route for
/// [_i5.AuthRegisterPage]
class AuthRegisterRoute extends _i26.PageRouteInfo<void> {
  const AuthRegisterRoute()
      : super(
          AuthRegisterRoute.name,
          path: '/auth-register',
        );

  static const String name = 'AuthRegisterRoute';
}

/// generated route for
/// [_i6.AuthResetPasswordPage]
class AuthResetPasswordRoute extends _i26.PageRouteInfo<void> {
  const AuthResetPasswordRoute()
      : super(
          AuthResetPasswordRoute.name,
          path: '/auth-reset-password',
        );

  static const String name = 'AuthResetPasswordRoute';
}

/// generated route for
/// [_i7.ModifyAccountPage]
class ModifyAccountRoute extends _i26.PageRouteInfo<void> {
  const ModifyAccountRoute()
      : super(
          ModifyAccountRoute.name,
          path: '/modify-account',
        );

  static const String name = 'ModifyAccountRoute';
}

/// generated route for
/// [_i8.ReauthenticatePage]
class ReauthenticateRoute extends _i26.PageRouteInfo<ReauthenticateRouteArgs> {
  ReauthenticateRoute({
    _i27.Key? key,
    required _i26.PageRouteInfo<dynamic> route,
  }) : super(
          ReauthenticateRoute.name,
          path: '/reauthenticate',
          args: ReauthenticateRouteArgs(
            key: key,
            route: route,
          ),
        );

  static const String name = 'ReauthenticateRoute';
}

class ReauthenticateRouteArgs {
  const ReauthenticateRouteArgs({
    this.key,
    required this.route,
  });

  final _i27.Key? key;

  final _i26.PageRouteInfo<dynamic> route;

  @override
  String toString() {
    return 'ReauthenticateRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [_i9.DeleteAccountPage]
class DeleteAccountRoute extends _i26.PageRouteInfo<void> {
  const DeleteAccountRoute()
      : super(
          DeleteAccountRoute.name,
          path: '/delete-account',
        );

  static const String name = 'DeleteAccountRoute';
}

/// generated route for
/// [_i10.NewPasswordPage]
class NewPasswordRoute extends _i26.PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    _i27.Key? key,
    required bool isMotDePasseAppli,
  }) : super(
          NewPasswordRoute.name,
          path: '/new-password',
          args: NewPasswordRouteArgs(
            key: key,
            isMotDePasseAppli: isMotDePasseAppli,
          ),
        );

  static const String name = 'NewPasswordRoute';
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({
    this.key,
    required this.isMotDePasseAppli,
  });

  final _i27.Key? key;

  final bool isMotDePasseAppli;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key, isMotDePasseAppli: $isMotDePasseAppli}';
  }
}

/// generated route for
/// [_i11.ComponentsPage]
class ComponentsRoute extends _i26.PageRouteInfo<void> {
  const ComponentsRoute()
      : super(
          ComponentsRoute.name,
          path: '/components-route',
        );

  static const String name = 'ComponentsRoute';
}

/// generated route for
/// [_i12.ColorsPage]
class ColorsRoute extends _i26.PageRouteInfo<void> {
  const ColorsRoute()
      : super(
          ColorsRoute.name,
          path: '/colors-route',
        );

  static const String name = 'ColorsRoute';
}

/// generated route for
/// [_i13.ButtonsPage]
class ButtonsRoute extends _i26.PageRouteInfo<void> {
  const ButtonsRoute()
      : super(
          ButtonsRoute.name,
          path: '/buttons-route',
        );

  static const String name = 'ButtonsRoute';
}

/// generated route for
/// [_i14.TextStylePage]
class TextStyleRoute extends _i26.PageRouteInfo<void> {
  const TextStyleRoute()
      : super(
          TextStyleRoute.name,
          path: '/textStyle-route',
        );

  static const String name = 'TextStyleRoute';
}

/// generated route for
/// [_i15.UtilsPage]
class UtilsRoute extends _i26.PageRouteInfo<void> {
  const UtilsRoute()
      : super(
          UtilsRoute.name,
          path: '/utils-route',
        );

  static const String name = 'UtilsRoute';
}

/// generated route for
/// [_i16.ObservationAddPage]
class ObservationAddRoute extends _i26.PageRouteInfo<ObservationAddRouteArgs> {
  ObservationAddRoute({
    required _i28.Cycle? cycle,
    required DateTime date,
    _i27.Key? key,
    _i29.Observation? observation,
  }) : super(
          ObservationAddRoute.name,
          path: '/observation-add-route',
          args: ObservationAddRouteArgs(
            cycle: cycle,
            date: date,
            key: key,
            observation: observation,
          ),
        );

  static const String name = 'ObservationAddRoute';
}

class ObservationAddRouteArgs {
  const ObservationAddRouteArgs({
    required this.cycle,
    required this.date,
    this.key,
    this.observation,
  });

  final _i28.Cycle? cycle;

  final DateTime date;

  final _i27.Key? key;

  final _i29.Observation? observation;

  @override
  String toString() {
    return 'ObservationAddRouteArgs{cycle: $cycle, date: $date, key: $key, observation: $observation}';
  }
}

/// generated route for
/// [_i17.LanguePage]
class LangueRoute extends _i26.PageRouteInfo<void> {
  const LangueRoute()
      : super(
          LangueRoute.name,
          path: '/langue-route',
        );

  static const String name = 'LangueRoute';
}

/// generated route for
/// [_i18.Guide_de_basePage]
class Principes_de_baseRoute extends _i26.PageRouteInfo<void> {
  const Principes_de_baseRoute()
      : super(
          Principes_de_baseRoute.name,
          path: '/principes_de_base-route',
        );

  static const String name = 'Principes_de_baseRoute';
}

/// generated route for
/// [_i19.Condition_utilisationPage]
class Condition_utilisationRoute extends _i26.PageRouteInfo<void> {
  const Condition_utilisationRoute()
      : super(
          Condition_utilisationRoute.name,
          path: '/condition_utilisation-route',
        );

  static const String name = 'Condition_utilisationRoute';
}

/// generated route for
/// [_i20.Guide_avancePage]
class Guide_avanceRoute extends _i26.PageRouteInfo<void> {
  const Guide_avanceRoute()
      : super(
          Guide_avanceRoute.name,
          path: '/guide_avance-route',
        );

  static const String name = 'Guide_avanceRoute';
}

/// generated route for
/// [_i21.Info_applicationPage]
class Info_applicationRoute extends _i26.PageRouteInfo<void> {
  const Info_applicationRoute()
      : super(
          Info_applicationRoute.name,
          path: '/info_application-route',
        );

  static const String name = 'Info_applicationRoute';
}

/// generated route for
/// [_i22.NotificationsPage]
class NotificationsRoute extends _i26.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/notifications-route',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i23.CyclesPage]
class CyclesRoute extends _i26.PageRouteInfo<void> {
  const CyclesRoute()
      : super(
          CyclesRoute.name,
          path: 'cycles-route',
        );

  static const String name = 'CyclesRoute';
}

/// generated route for
/// [_i24.HistoriquePage]
class HistoriqueRoute extends _i26.PageRouteInfo<void> {
  const HistoriqueRoute()
      : super(
          HistoriqueRoute.name,
          path: 'historique-route',
        );

  static const String name = 'HistoriqueRoute';
}

/// generated route for
/// [_i25.AccountPage]
class AccountRoute extends _i26.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: 'account',
        );

  static const String name = 'AccountRoute';
}
