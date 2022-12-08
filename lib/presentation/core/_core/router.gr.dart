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
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;

import '../../../DOMAIN/cycle/cycle.dart' as _i22;
import '../../auth/auth_connexion/auth_connexion_page.dart' as _i4;
import '../../auth/auth_init/auth_init_page.dart' as _i3;
import '../../auth/auth_register/auth_register_page.dart' as _i5;
import '../../auth/auth_reset_password.dart/auth_reset_password_page.dart'
    as _i6;
import '../../historique/historique_page.dart' as _i18;
import '../../reglages/account/account_page.dart' as _i19;
import '../../reglages/account/buttons/buttons.dart' as _i13;
import '../../reglages/account/colors/colors.dart' as _i12;
import '../../reglages/account/components/components_page.dart' as _i11;
import '../../reglages/account/text_style/text_style.dart' as _i14;
import '../../reglages/account/utils/utils_page.dart' as _i15;
import '../../reglages/delete_account/delete_account_page.dart' as _i9;
import '../../reglages/modify_account/modify_account_page.dart' as _i7;
import '../../reglages/new_password/new_password_page.dart' as _i10;
import '../../reglages/reauthenticate/reauthenticate_page.dart' as _i8;
import '../../resume/ajout_observation_journee/ajout_observation_journee_page.dart'
    as _i16;
import '../../resume/resume_page.dart' as _i17;
import '../_main_navigation/main_navigation_page.dart' as _i2;
import '../_splash/splash_page.dart' as _i1;

class AppRouter extends _i20.RootStackRouter {
  AppRouter([_i21.GlobalKey<_i21.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<MainNavigationRouteArgs>(
          orElse: () => const MainNavigationRouteArgs());
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.MainNavigationPage(key: args.key),
      );
    },
    AuthInitRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthInitPage(),
      );
    },
    AuthConnexionRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AuthConnexionPage(),
      );
    },
    AuthRegisterRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AuthRegisterPage(),
      );
    },
    AuthResetPasswordRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AuthResetPasswordPage(),
      );
    },
    ModifyAccountRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ModifyAccountPage(),
      );
    },
    ReauthenticateRoute.name: (routeData) {
      final args = routeData.argsAs<ReauthenticateRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ReauthenticatePage(
          key: args.key,
          route: args.route,
        ),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.DeleteAccountPage(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.NewPasswordPage(),
      );
    },
    ComponentsRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.ComponentsPage(),
      );
    },
    ColorsRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ColorsPage(),
      );
    },
    ButtonsRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ButtonsPage(),
      );
    },
    TextStyleRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.TextStylePage(),
      );
    },
    UtilsRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.UtilsPage(),
      );
    },
    ObservationAddRoute.name: (routeData) {
      final args = routeData.argsAs<ObservationAddRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.ObservationAddPage(
          args.cycle,
          key: args.key,
        ),
      );
    },
    ResumeRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.ResumePage(),
      );
    },
    HistoriqueRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.HistoriquePage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.AccountPage(),
      );
    },
  };

  @override
  List<_i20.RouteConfig> get routes => [
        _i20.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i20.RouteConfig(
          MainNavigationRoute.name,
          path: '/main',
          children: [
            _i20.RouteConfig(
              '#redirect',
              path: '',
              parent: MainNavigationRoute.name,
              redirectTo: 'resume-route',
              fullMatch: true,
            ),
            _i20.RouteConfig(
              ResumeRoute.name,
              path: 'resume-route',
              parent: MainNavigationRoute.name,
            ),
            _i20.RouteConfig(
              HistoriqueRoute.name,
              path: 'historique-route',
              parent: MainNavigationRoute.name,
            ),
            _i20.RouteConfig(
              AccountRoute.name,
              path: 'account',
              parent: MainNavigationRoute.name,
            ),
          ],
        ),
        _i20.RouteConfig(
          AuthInitRoute.name,
          path: '/auth-init',
        ),
        _i20.RouteConfig(
          AuthConnexionRoute.name,
          path: '/auth-connexion',
        ),
        _i20.RouteConfig(
          AuthRegisterRoute.name,
          path: '/auth-register',
        ),
        _i20.RouteConfig(
          AuthResetPasswordRoute.name,
          path: '/auth-reset-password',
        ),
        _i20.RouteConfig(
          ModifyAccountRoute.name,
          path: '/modify-account',
        ),
        _i20.RouteConfig(
          ReauthenticateRoute.name,
          path: '/reauthenticate',
        ),
        _i20.RouteConfig(
          DeleteAccountRoute.name,
          path: '/delete-account',
        ),
        _i20.RouteConfig(
          NewPasswordRoute.name,
          path: '/new-password',
        ),
        _i20.RouteConfig(
          ComponentsRoute.name,
          path: '/components-route',
        ),
        _i20.RouteConfig(
          ColorsRoute.name,
          path: '/colors-route',
        ),
        _i20.RouteConfig(
          ButtonsRoute.name,
          path: '/buttons-route',
        ),
        _i20.RouteConfig(
          TextStyleRoute.name,
          path: '/textStyle-route',
        ),
        _i20.RouteConfig(
          UtilsRoute.name,
          path: '/utils-route',
        ),
        _i20.RouteConfig(
          ObservationAddRoute.name,
          path: '/observation-add-route',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i20.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainNavigationPage]
class MainNavigationRoute extends _i20.PageRouteInfo<MainNavigationRouteArgs> {
  MainNavigationRoute({
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
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

  final _i21.Key? key;

  @override
  String toString() {
    return 'MainNavigationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.AuthInitPage]
class AuthInitRoute extends _i20.PageRouteInfo<void> {
  const AuthInitRoute()
      : super(
          AuthInitRoute.name,
          path: '/auth-init',
        );

  static const String name = 'AuthInitRoute';
}

/// generated route for
/// [_i4.AuthConnexionPage]
class AuthConnexionRoute extends _i20.PageRouteInfo<void> {
  const AuthConnexionRoute()
      : super(
          AuthConnexionRoute.name,
          path: '/auth-connexion',
        );

  static const String name = 'AuthConnexionRoute';
}

/// generated route for
/// [_i5.AuthRegisterPage]
class AuthRegisterRoute extends _i20.PageRouteInfo<void> {
  const AuthRegisterRoute()
      : super(
          AuthRegisterRoute.name,
          path: '/auth-register',
        );

  static const String name = 'AuthRegisterRoute';
}

/// generated route for
/// [_i6.AuthResetPasswordPage]
class AuthResetPasswordRoute extends _i20.PageRouteInfo<void> {
  const AuthResetPasswordRoute()
      : super(
          AuthResetPasswordRoute.name,
          path: '/auth-reset-password',
        );

  static const String name = 'AuthResetPasswordRoute';
}

/// generated route for
/// [_i7.ModifyAccountPage]
class ModifyAccountRoute extends _i20.PageRouteInfo<void> {
  const ModifyAccountRoute()
      : super(
          ModifyAccountRoute.name,
          path: '/modify-account',
        );

  static const String name = 'ModifyAccountRoute';
}

/// generated route for
/// [_i8.ReauthenticatePage]
class ReauthenticateRoute extends _i20.PageRouteInfo<ReauthenticateRouteArgs> {
  ReauthenticateRoute({
    _i21.Key? key,
    required _i20.PageRouteInfo<dynamic> route,
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

  final _i21.Key? key;

  final _i20.PageRouteInfo<dynamic> route;

  @override
  String toString() {
    return 'ReauthenticateRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [_i9.DeleteAccountPage]
class DeleteAccountRoute extends _i20.PageRouteInfo<void> {
  const DeleteAccountRoute()
      : super(
          DeleteAccountRoute.name,
          path: '/delete-account',
        );

  static const String name = 'DeleteAccountRoute';
}

/// generated route for
/// [_i10.NewPasswordPage]
class NewPasswordRoute extends _i20.PageRouteInfo<void> {
  const NewPasswordRoute()
      : super(
          NewPasswordRoute.name,
          path: '/new-password',
        );

  static const String name = 'NewPasswordRoute';
}

/// generated route for
/// [_i11.ComponentsPage]
class ComponentsRoute extends _i20.PageRouteInfo<void> {
  const ComponentsRoute()
      : super(
          ComponentsRoute.name,
          path: '/components-route',
        );

  static const String name = 'ComponentsRoute';
}

/// generated route for
/// [_i12.ColorsPage]
class ColorsRoute extends _i20.PageRouteInfo<void> {
  const ColorsRoute()
      : super(
          ColorsRoute.name,
          path: '/colors-route',
        );

  static const String name = 'ColorsRoute';
}

/// generated route for
/// [_i13.ButtonsPage]
class ButtonsRoute extends _i20.PageRouteInfo<void> {
  const ButtonsRoute()
      : super(
          ButtonsRoute.name,
          path: '/buttons-route',
        );

  static const String name = 'ButtonsRoute';
}

/// generated route for
/// [_i14.TextStylePage]
class TextStyleRoute extends _i20.PageRouteInfo<void> {
  const TextStyleRoute()
      : super(
          TextStyleRoute.name,
          path: '/textStyle-route',
        );

  static const String name = 'TextStyleRoute';
}

/// generated route for
/// [_i15.UtilsPage]
class UtilsRoute extends _i20.PageRouteInfo<void> {
  const UtilsRoute()
      : super(
          UtilsRoute.name,
          path: '/utils-route',
        );

  static const String name = 'UtilsRoute';
}

/// generated route for
/// [_i16.ObservationAddPage]
class ObservationAddRoute extends _i20.PageRouteInfo<ObservationAddRouteArgs> {
  ObservationAddRoute({
    required _i22.Cycle? cycle,
    _i21.Key? key,
  }) : super(
          ObservationAddRoute.name,
          path: '/observation-add-route',
          args: ObservationAddRouteArgs(
            cycle: cycle,
            key: key,
          ),
        );

  static const String name = 'ObservationAddRoute';
}

class ObservationAddRouteArgs {
  const ObservationAddRouteArgs({
    required this.cycle,
    this.key,
  });

  final _i22.Cycle? cycle;

  final _i21.Key? key;

  @override
  String toString() {
    return 'ObservationAddRouteArgs{cycle: $cycle, key: $key}';
  }
}

/// generated route for
/// [_i17.ResumePage]
class ResumeRoute extends _i20.PageRouteInfo<void> {
  const ResumeRoute()
      : super(
          ResumeRoute.name,
          path: 'resume-route',
        );

  static const String name = 'ResumeRoute';
}

/// generated route for
/// [_i18.HistoriquePage]
class HistoriqueRoute extends _i20.PageRouteInfo<void> {
  const HistoriqueRoute()
      : super(
          HistoriqueRoute.name,
          path: 'historique-route',
        );

  static const String name = 'HistoriqueRoute';
}

/// generated route for
/// [_i19.AccountPage]
class AccountRoute extends _i20.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: 'account',
        );

  static const String name = 'AccountRoute';
}
