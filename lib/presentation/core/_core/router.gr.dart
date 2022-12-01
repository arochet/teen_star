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
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;

import '../../../DOMAIN/core/value_objects.dart' as _i24;
import '../../account/account/account_page.dart' as _i21;
import '../../account/account/buttons/buttons.dart' as _i14;
import '../../account/account/colors/colors.dart' as _i13;
import '../../account/account/components/components_page.dart' as _i12;
import '../../account/account/text_style/text_style.dart' as _i15;
import '../../account/account/utils/utils_page.dart' as _i16;
import '../../account/delete_account/delete_account_page.dart' as _i10;
import '../../account/modify_account/modify_account_page.dart' as _i8;
import '../../account/new_password/new_password_page.dart' as _i11;
import '../../account/reauthenticate/reauthenticate_page.dart' as _i9;
import '../../auth/auth_check_email/auth_check_email_page.dart' as _i6;
import '../../auth/auth_connexion/auth_connexion_page.dart' as _i4;
import '../../auth/auth_init/auth_init_page.dart' as _i3;
import '../../auth/auth_register/auth_register_page.dart' as _i5;
import '../../auth/auth_reset_password.dart/auth_reset_password_page.dart' as _i7;
import '../../home/home_page.dart' as _i20;
import '../../observation/observation_add/observation_add_page.dart' as _i17;
import '../../observation/observation_list/observation_list_page.dart' as _i18;
import '../../observation/observation_view/observation_view_page.dart' as _i19;
import '../_main_navigation/main_navigation_page.dart' as _i2;
import '../_splash/splash_page.dart' as _i1;

class AppRouter extends _i22.RootStackRouter {
  AppRouter([_i23.GlobalKey<_i23.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<MainNavigationRouteArgs>(orElse: () => const MainNavigationRouteArgs());
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.MainNavigationPage(key: args.key),
      );
    },
    AuthInitRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthInitPage(),
      );
    },
    AuthConnexionRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AuthConnexionPage(),
      );
    },
    AuthRegisterRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AuthRegisterPage(),
      );
    },
    AuthCheckEmailRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AuthCheckEmailPage(),
      );
    },
    AuthResetPasswordRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AuthResetPasswordPage(),
      );
    },
    ModifyAccountRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ModifyAccountPage(),
      );
    },
    ReauthenticateRoute.name: (routeData) {
      final args = routeData.argsAs<ReauthenticateRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.ReauthenticatePage(
          key: args.key,
          route: args.route,
        ),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.DeleteAccountPage(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.NewPasswordPage(),
      );
    },
    ComponentsRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ComponentsPage(),
      );
    },
    ColorsRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ColorsPage(),
      );
    },
    ButtonsRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ButtonsPage(),
      );
    },
    TextStyleRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.TextStylePage(),
      );
    },
    UtilsRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.UtilsPage(),
      );
    },
    ObservationAddRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.ObservationAddPage(),
      );
    },
    ObservationListRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.ObservationListPage(),
      );
    },
    ObservationViewRoute.name: (routeData) {
      final args = routeData.argsAs<ObservationViewRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.ObservationViewPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.HomePage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.AccountPage(),
      );
    },
  };

  @override
  List<_i22.RouteConfig> get routes => [
        _i22.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i22.RouteConfig(
          MainNavigationRoute.name,
          path: '/main',
          children: [
            _i22.RouteConfig(
              '#redirect',
              path: '',
              parent: MainNavigationRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i22.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: MainNavigationRoute.name,
            ),
            _i22.RouteConfig(
              AccountRoute.name,
              path: 'account',
              parent: MainNavigationRoute.name,
            ),
          ],
        ),
        _i22.RouteConfig(
          AuthInitRoute.name,
          path: '/auth-init',
        ),
        _i22.RouteConfig(
          AuthConnexionRoute.name,
          path: '/auth-connexion',
        ),
        _i22.RouteConfig(
          AuthRegisterRoute.name,
          path: '/auth-register',
        ),
        _i22.RouteConfig(
          AuthCheckEmailRoute.name,
          path: '/auth-check-email',
        ),
        _i22.RouteConfig(
          AuthResetPasswordRoute.name,
          path: '/auth-reset-password',
        ),
        _i22.RouteConfig(
          ModifyAccountRoute.name,
          path: '/modify-account',
        ),
        _i22.RouteConfig(
          ReauthenticateRoute.name,
          path: '/reauthenticate',
        ),
        _i22.RouteConfig(
          DeleteAccountRoute.name,
          path: '/delete-account',
        ),
        _i22.RouteConfig(
          NewPasswordRoute.name,
          path: '/new-password',
        ),
        _i22.RouteConfig(
          ComponentsRoute.name,
          path: '/components-route',
        ),
        _i22.RouteConfig(
          ColorsRoute.name,
          path: '/colors-route',
        ),
        _i22.RouteConfig(
          ButtonsRoute.name,
          path: '/buttons-route',
        ),
        _i22.RouteConfig(
          TextStyleRoute.name,
          path: '/textStyle-route',
        ),
        _i22.RouteConfig(
          UtilsRoute.name,
          path: '/utils-route',
        ),
        _i22.RouteConfig(
          ObservationAddRoute.name,
          path: '/observation-add-route',
        ),
        _i22.RouteConfig(
          ObservationListRoute.name,
          path: '/observation-list-route',
        ),
        _i22.RouteConfig(
          ObservationViewRoute.name,
          path: '/observation-view-route',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i22.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainNavigationPage]
class MainNavigationRoute extends _i22.PageRouteInfo<MainNavigationRouteArgs> {
  MainNavigationRoute({
    _i23.Key? key,
    List<_i22.PageRouteInfo>? children,
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

  final _i23.Key? key;

  @override
  String toString() {
    return 'MainNavigationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.AuthInitPage]
class AuthInitRoute extends _i22.PageRouteInfo<void> {
  const AuthInitRoute()
      : super(
          AuthInitRoute.name,
          path: '/auth-init',
        );

  static const String name = 'AuthInitRoute';
}

/// generated route for
/// [_i4.AuthConnexionPage]
class AuthConnexionRoute extends _i22.PageRouteInfo<void> {
  const AuthConnexionRoute()
      : super(
          AuthConnexionRoute.name,
          path: '/auth-connexion',
        );

  static const String name = 'AuthConnexionRoute';
}

/// generated route for
/// [_i5.AuthRegisterPage]
class AuthRegisterRoute extends _i22.PageRouteInfo<void> {
  const AuthRegisterRoute()
      : super(
          AuthRegisterRoute.name,
          path: '/auth-register',
        );

  static const String name = 'AuthRegisterRoute';
}

/// generated route for
/// [_i6.AuthCheckEmailPage]
class AuthCheckEmailRoute extends _i22.PageRouteInfo<void> {
  const AuthCheckEmailRoute()
      : super(
          AuthCheckEmailRoute.name,
          path: '/auth-check-email',
        );

  static const String name = 'AuthCheckEmailRoute';
}

/// generated route for
/// [_i7.AuthResetPasswordPage]
class AuthResetPasswordRoute extends _i22.PageRouteInfo<void> {
  const AuthResetPasswordRoute()
      : super(
          AuthResetPasswordRoute.name,
          path: '/auth-reset-password',
        );

  static const String name = 'AuthResetPasswordRoute';
}

/// generated route for
/// [_i8.ModifyAccountPage]
class ModifyAccountRoute extends _i22.PageRouteInfo<void> {
  const ModifyAccountRoute()
      : super(
          ModifyAccountRoute.name,
          path: '/modify-account',
        );

  static const String name = 'ModifyAccountRoute';
}

/// generated route for
/// [_i9.ReauthenticatePage]
class ReauthenticateRoute extends _i22.PageRouteInfo<ReauthenticateRouteArgs> {
  ReauthenticateRoute({
    _i23.Key? key,
    required _i22.PageRouteInfo<dynamic> route,
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

  final _i23.Key? key;

  final _i22.PageRouteInfo<dynamic> route;

  @override
  String toString() {
    return 'ReauthenticateRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [_i10.DeleteAccountPage]
class DeleteAccountRoute extends _i22.PageRouteInfo<void> {
  const DeleteAccountRoute()
      : super(
          DeleteAccountRoute.name,
          path: '/delete-account',
        );

  static const String name = 'DeleteAccountRoute';
}

/// generated route for
/// [_i11.NewPasswordPage]
class NewPasswordRoute extends _i22.PageRouteInfo<void> {
  const NewPasswordRoute()
      : super(
          NewPasswordRoute.name,
          path: '/new-password',
        );

  static const String name = 'NewPasswordRoute';
}

/// generated route for
/// [_i12.ComponentsPage]
class ComponentsRoute extends _i22.PageRouteInfo<void> {
  const ComponentsRoute()
      : super(
          ComponentsRoute.name,
          path: '/components-route',
        );

  static const String name = 'ComponentsRoute';
}

/// generated route for
/// [_i13.ColorsPage]
class ColorsRoute extends _i22.PageRouteInfo<void> {
  const ColorsRoute()
      : super(
          ColorsRoute.name,
          path: '/colors-route',
        );

  static const String name = 'ColorsRoute';
}

/// generated route for
/// [_i14.ButtonsPage]
class ButtonsRoute extends _i22.PageRouteInfo<void> {
  const ButtonsRoute()
      : super(
          ButtonsRoute.name,
          path: '/buttons-route',
        );

  static const String name = 'ButtonsRoute';
}

/// generated route for
/// [_i15.TextStylePage]
class TextStyleRoute extends _i22.PageRouteInfo<void> {
  const TextStyleRoute()
      : super(
          TextStyleRoute.name,
          path: '/textStyle-route',
        );

  static const String name = 'TextStyleRoute';
}

/// generated route for
/// [_i16.UtilsPage]
class UtilsRoute extends _i22.PageRouteInfo<void> {
  const UtilsRoute()
      : super(
          UtilsRoute.name,
          path: '/utils-route',
        );

  static const String name = 'UtilsRoute';
}

/// generated route for
/// [_i17.ObservationAddPage]
class ObservationAddRoute extends _i22.PageRouteInfo<void> {
  const ObservationAddRoute()
      : super(
          ObservationAddRoute.name,
          path: '/observation-add-route',
        );

  static const String name = 'ObservationAddRoute';
}

/// generated route for
/// [_i18.ObservationListPage]
class ObservationListRoute extends _i22.PageRouteInfo<void> {
  const ObservationListRoute()
      : super(
          ObservationListRoute.name,
          path: '/observation-list-route',
        );

  static const String name = 'ObservationListRoute';
}

/// generated route for
/// [_i19.ObservationViewPage]
class ObservationViewRoute extends _i22.PageRouteInfo<ObservationViewRouteArgs> {
  ObservationViewRoute({
    required _i24.UniqueId id,
    _i23.Key? key,
  }) : super(
          ObservationViewRoute.name,
          path: '/observation-view-route',
          args: ObservationViewRouteArgs(
            id: id,
            key: key,
          ),
        );

  static const String name = 'ObservationViewRoute';
}

class ObservationViewRouteArgs {
  const ObservationViewRouteArgs({
    required this.id,
    this.key,
  });

  final _i24.UniqueId id;

  final _i23.Key? key;

  @override
  String toString() {
    return 'ObservationViewRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i20.HomePage]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i21.AccountPage]
class AccountRoute extends _i22.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: 'account',
        );

  static const String name = 'AccountRoute';
}
