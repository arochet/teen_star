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
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;

import '../../../DOMAIN/cycle/cycle.dart' as _i27;
import '../../auth/auth_connexion/auth_connexion_page.dart' as _i4;
import '../../auth/auth_init/auth_init_page.dart' as _i3;
import '../../auth/auth_register/auth_register_page.dart' as _i5;
import '../../auth/auth_reset_password.dart/auth_reset_password_page.dart'
    as _i6;
import '../../auth/condition_utilisation/condition_utilisation_page.dart'
    as _i19;
import '../../historique/historique_page.dart' as _i23;
import '../../reglages/account/account_page.dart' as _i24;
import '../../reglages/account/buttons/buttons.dart' as _i13;
import '../../reglages/account/colors/colors.dart' as _i12;
import '../../reglages/account/components/components_page.dart' as _i11;
import '../../reglages/account/text_style/text_style.dart' as _i14;
import '../../reglages/account/utils/utils_page.dart' as _i15;
import '../../reglages/delete_account/delete_account_page.dart' as _i9;
import '../../reglages/guide_avance/guide_avance_page.dart' as _i20;
import '../../reglages/info_application/info_application_page.dart' as _i21;
import '../../reglages/langue/langue_page.dart' as _i17;
import '../../reglages/modify_account/modify_account_page.dart' as _i7;
import '../../reglages/new_password/new_password_page.dart' as _i10;
import '../../reglages/principes_de_base/principes_de_base_page.dart' as _i18;
import '../../reglages/reauthenticate/reauthenticate_page.dart' as _i8;
import '../../resume/ajout_observation_journee/ajout_observation_journee_page.dart'
    as _i16;
import '../../resume/resume_page.dart' as _i22;
import '../_main_navigation/main_navigation_page.dart' as _i2;
import '../_splash/splash_page.dart' as _i1;

class AppRouter extends _i25.RootStackRouter {
  AppRouter([_i26.GlobalKey<_i26.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<MainNavigationRouteArgs>(
          orElse: () => const MainNavigationRouteArgs());
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.MainNavigationPage(key: args.key),
      );
    },
    AuthInitRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthInitPage(),
      );
    },
    AuthConnexionRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AuthConnexionPage(),
      );
    },
    AuthRegisterRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AuthRegisterPage(),
      );
    },
    AuthResetPasswordRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AuthResetPasswordPage(),
      );
    },
    ModifyAccountRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ModifyAccountPage(),
      );
    },
    ReauthenticateRoute.name: (routeData) {
      final args = routeData.argsAs<ReauthenticateRouteArgs>();
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ReauthenticatePage(
          key: args.key,
          route: args.route,
        ),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.DeleteAccountPage(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<NewPasswordRouteArgs>();
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.NewPasswordPage(
          key: args.key,
          isMotDePasseAppli: args.isMotDePasseAppli,
        ),
      );
    },
    ComponentsRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.ComponentsPage(),
      );
    },
    ColorsRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ColorsPage(),
      );
    },
    ButtonsRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ButtonsPage(),
      );
    },
    TextStyleRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.TextStylePage(),
      );
    },
    UtilsRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.UtilsPage(),
      );
    },
    ObservationAddRoute.name: (routeData) {
      final args = routeData.argsAs<ObservationAddRouteArgs>();
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.ObservationAddPage(
          args.cycle,
          args.date,
          key: args.key,
        ),
      );
    },
    LangueRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.LanguePage(),
      );
    },
    Principes_de_baseRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.Principes_de_basePage(),
      );
    },
    Condition_utilisationRoute.name: (routeData) {
      final args = routeData.argsAs<Condition_utilisationRouteArgs>();
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.Condition_utilisationPage(
          args.doitEtreAccepte,
          key: args.key,
        ),
      );
    },
    Guide_avanceRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.Guide_avancePage(),
      );
    },
    Info_applicationRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.Info_applicationPage(),
      );
    },
    ResumeRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.ResumePage(),
      );
    },
    HistoriqueRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.HistoriquePage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i25.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.AccountPage(),
      );
    },
  };

  @override
  List<_i25.RouteConfig> get routes => [
        _i25.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i25.RouteConfig(
          MainNavigationRoute.name,
          path: '/main',
          children: [
            _i25.RouteConfig(
              '#redirect',
              path: '',
              parent: MainNavigationRoute.name,
              redirectTo: 'resume-route',
              fullMatch: true,
            ),
            _i25.RouteConfig(
              ResumeRoute.name,
              path: 'resume-route',
              parent: MainNavigationRoute.name,
            ),
            _i25.RouteConfig(
              HistoriqueRoute.name,
              path: 'historique-route',
              parent: MainNavigationRoute.name,
            ),
            _i25.RouteConfig(
              AccountRoute.name,
              path: 'account',
              parent: MainNavigationRoute.name,
            ),
          ],
        ),
        _i25.RouteConfig(
          AuthInitRoute.name,
          path: '/auth-init',
        ),
        _i25.RouteConfig(
          AuthConnexionRoute.name,
          path: '/auth-connexion',
        ),
        _i25.RouteConfig(
          AuthRegisterRoute.name,
          path: '/auth-register',
        ),
        _i25.RouteConfig(
          AuthResetPasswordRoute.name,
          path: '/auth-reset-password',
        ),
        _i25.RouteConfig(
          ModifyAccountRoute.name,
          path: '/modify-account',
        ),
        _i25.RouteConfig(
          ReauthenticateRoute.name,
          path: '/reauthenticate',
        ),
        _i25.RouteConfig(
          DeleteAccountRoute.name,
          path: '/delete-account',
        ),
        _i25.RouteConfig(
          NewPasswordRoute.name,
          path: '/new-password',
        ),
        _i25.RouteConfig(
          ComponentsRoute.name,
          path: '/components-route',
        ),
        _i25.RouteConfig(
          ColorsRoute.name,
          path: '/colors-route',
        ),
        _i25.RouteConfig(
          ButtonsRoute.name,
          path: '/buttons-route',
        ),
        _i25.RouteConfig(
          TextStyleRoute.name,
          path: '/textStyle-route',
        ),
        _i25.RouteConfig(
          UtilsRoute.name,
          path: '/utils-route',
        ),
        _i25.RouteConfig(
          ObservationAddRoute.name,
          path: '/observation-add-route',
        ),
        _i25.RouteConfig(
          LangueRoute.name,
          path: '/langue-route',
        ),
        _i25.RouteConfig(
          Principes_de_baseRoute.name,
          path: '/principes_de_base-route',
        ),
        _i25.RouteConfig(
          Condition_utilisationRoute.name,
          path: '/condition_utilisation-route',
        ),
        _i25.RouteConfig(
          Guide_avanceRoute.name,
          path: '/guide_avance-route',
        ),
        _i25.RouteConfig(
          Info_applicationRoute.name,
          path: '/info_application-route',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i25.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainNavigationPage]
class MainNavigationRoute extends _i25.PageRouteInfo<MainNavigationRouteArgs> {
  MainNavigationRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
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

  final _i26.Key? key;

  @override
  String toString() {
    return 'MainNavigationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.AuthInitPage]
class AuthInitRoute extends _i25.PageRouteInfo<void> {
  const AuthInitRoute()
      : super(
          AuthInitRoute.name,
          path: '/auth-init',
        );

  static const String name = 'AuthInitRoute';
}

/// generated route for
/// [_i4.AuthConnexionPage]
class AuthConnexionRoute extends _i25.PageRouteInfo<void> {
  const AuthConnexionRoute()
      : super(
          AuthConnexionRoute.name,
          path: '/auth-connexion',
        );

  static const String name = 'AuthConnexionRoute';
}

/// generated route for
/// [_i5.AuthRegisterPage]
class AuthRegisterRoute extends _i25.PageRouteInfo<void> {
  const AuthRegisterRoute()
      : super(
          AuthRegisterRoute.name,
          path: '/auth-register',
        );

  static const String name = 'AuthRegisterRoute';
}

/// generated route for
/// [_i6.AuthResetPasswordPage]
class AuthResetPasswordRoute extends _i25.PageRouteInfo<void> {
  const AuthResetPasswordRoute()
      : super(
          AuthResetPasswordRoute.name,
          path: '/auth-reset-password',
        );

  static const String name = 'AuthResetPasswordRoute';
}

/// generated route for
/// [_i7.ModifyAccountPage]
class ModifyAccountRoute extends _i25.PageRouteInfo<void> {
  const ModifyAccountRoute()
      : super(
          ModifyAccountRoute.name,
          path: '/modify-account',
        );

  static const String name = 'ModifyAccountRoute';
}

/// generated route for
/// [_i8.ReauthenticatePage]
class ReauthenticateRoute extends _i25.PageRouteInfo<ReauthenticateRouteArgs> {
  ReauthenticateRoute({
    _i26.Key? key,
    required _i25.PageRouteInfo<dynamic> route,
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

  final _i26.Key? key;

  final _i25.PageRouteInfo<dynamic> route;

  @override
  String toString() {
    return 'ReauthenticateRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [_i9.DeleteAccountPage]
class DeleteAccountRoute extends _i25.PageRouteInfo<void> {
  const DeleteAccountRoute()
      : super(
          DeleteAccountRoute.name,
          path: '/delete-account',
        );

  static const String name = 'DeleteAccountRoute';
}

/// generated route for
/// [_i10.NewPasswordPage]
class NewPasswordRoute extends _i25.PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    _i26.Key? key,
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

  final _i26.Key? key;

  final bool isMotDePasseAppli;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key, isMotDePasseAppli: $isMotDePasseAppli}';
  }
}

/// generated route for
/// [_i11.ComponentsPage]
class ComponentsRoute extends _i25.PageRouteInfo<void> {
  const ComponentsRoute()
      : super(
          ComponentsRoute.name,
          path: '/components-route',
        );

  static const String name = 'ComponentsRoute';
}

/// generated route for
/// [_i12.ColorsPage]
class ColorsRoute extends _i25.PageRouteInfo<void> {
  const ColorsRoute()
      : super(
          ColorsRoute.name,
          path: '/colors-route',
        );

  static const String name = 'ColorsRoute';
}

/// generated route for
/// [_i13.ButtonsPage]
class ButtonsRoute extends _i25.PageRouteInfo<void> {
  const ButtonsRoute()
      : super(
          ButtonsRoute.name,
          path: '/buttons-route',
        );

  static const String name = 'ButtonsRoute';
}

/// generated route for
/// [_i14.TextStylePage]
class TextStyleRoute extends _i25.PageRouteInfo<void> {
  const TextStyleRoute()
      : super(
          TextStyleRoute.name,
          path: '/textStyle-route',
        );

  static const String name = 'TextStyleRoute';
}

/// generated route for
/// [_i15.UtilsPage]
class UtilsRoute extends _i25.PageRouteInfo<void> {
  const UtilsRoute()
      : super(
          UtilsRoute.name,
          path: '/utils-route',
        );

  static const String name = 'UtilsRoute';
}

/// generated route for
/// [_i16.ObservationAddPage]
class ObservationAddRoute extends _i25.PageRouteInfo<ObservationAddRouteArgs> {
  ObservationAddRoute({
    required _i27.Cycle? cycle,
    required DateTime date,
    _i26.Key? key,
  }) : super(
          ObservationAddRoute.name,
          path: '/observation-add-route',
          args: ObservationAddRouteArgs(
            cycle: cycle,
            date: date,
            key: key,
          ),
        );

  static const String name = 'ObservationAddRoute';
}

class ObservationAddRouteArgs {
  const ObservationAddRouteArgs({
    required this.cycle,
    required this.date,
    this.key,
  });

  final _i27.Cycle? cycle;

  final DateTime date;

  final _i26.Key? key;

  @override
  String toString() {
    return 'ObservationAddRouteArgs{cycle: $cycle, date: $date, key: $key}';
  }
}

/// generated route for
/// [_i17.LanguePage]
class LangueRoute extends _i25.PageRouteInfo<void> {
  const LangueRoute()
      : super(
          LangueRoute.name,
          path: '/langue-route',
        );

  static const String name = 'LangueRoute';
}

/// generated route for
/// [_i18.Principes_de_basePage]
class Principes_de_baseRoute extends _i25.PageRouteInfo<void> {
  const Principes_de_baseRoute()
      : super(
          Principes_de_baseRoute.name,
          path: '/principes_de_base-route',
        );

  static const String name = 'Principes_de_baseRoute';
}

/// generated route for
/// [_i19.Condition_utilisationPage]
class Condition_utilisationRoute
    extends _i25.PageRouteInfo<Condition_utilisationRouteArgs> {
  Condition_utilisationRoute({
    required bool doitEtreAccepte,
    _i26.Key? key,
  }) : super(
          Condition_utilisationRoute.name,
          path: '/condition_utilisation-route',
          args: Condition_utilisationRouteArgs(
            doitEtreAccepte: doitEtreAccepte,
            key: key,
          ),
        );

  static const String name = 'Condition_utilisationRoute';
}

class Condition_utilisationRouteArgs {
  const Condition_utilisationRouteArgs({
    required this.doitEtreAccepte,
    this.key,
  });

  final bool doitEtreAccepte;

  final _i26.Key? key;

  @override
  String toString() {
    return 'Condition_utilisationRouteArgs{doitEtreAccepte: $doitEtreAccepte, key: $key}';
  }
}

/// generated route for
/// [_i20.Guide_avancePage]
class Guide_avanceRoute extends _i25.PageRouteInfo<void> {
  const Guide_avanceRoute()
      : super(
          Guide_avanceRoute.name,
          path: '/guide_avance-route',
        );

  static const String name = 'Guide_avanceRoute';
}

/// generated route for
/// [_i21.Info_applicationPage]
class Info_applicationRoute extends _i25.PageRouteInfo<void> {
  const Info_applicationRoute()
      : super(
          Info_applicationRoute.name,
          path: '/info_application-route',
        );

  static const String name = 'Info_applicationRoute';
}

/// generated route for
/// [_i22.ResumePage]
class ResumeRoute extends _i25.PageRouteInfo<void> {
  const ResumeRoute()
      : super(
          ResumeRoute.name,
          path: 'resume-route',
        );

  static const String name = 'ResumeRoute';
}

/// generated route for
/// [_i23.HistoriquePage]
class HistoriqueRoute extends _i25.PageRouteInfo<void> {
  const HistoriqueRoute()
      : super(
          HistoriqueRoute.name,
          path: 'historique-route',
        );

  static const String name = 'HistoriqueRoute';
}

/// generated route for
/// [_i24.AccountPage]
class AccountRoute extends _i25.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: 'account',
        );

  static const String name = 'AccountRoute';
}
