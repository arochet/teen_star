import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/PRESENTATION/reglages/account/components/components_page.dart';
import 'package:teenstar/PRESENTATION/reglages/account/text_style/text_style.dart';
import 'package:teenstar/PRESENTATION/reglages/account/account_page.dart';
import 'package:teenstar/PRESENTATION/auth/condition_utilisation/condition_utilisation_page.dart';
import 'package:teenstar/PRESENTATION/reglages/delete_account/delete_account_page.dart';
import 'package:teenstar/PRESENTATION/reglages/guide_avance/guide_avance_page.dart';
import 'package:teenstar/PRESENTATION/reglages/info_application/info_application_page.dart';
import 'package:teenstar/PRESENTATION/reglages/langue/langue_page.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_page.dart';
import 'package:teenstar/PRESENTATION/reglages/new_password/new_password_page.dart';
import 'package:teenstar/PRESENTATION/reglages/guide_de_base/guide_de_base_page.dart';
import 'package:teenstar/PRESENTATION/reglages/reauthenticate/reauthenticate_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_connexion/auth_connexion_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_init/auth_init_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_register/auth_register_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_reset_password.dart/auth_reset_password_page.dart';
import 'package:teenstar/PRESENTATION/historique/historique_page.dart';
import 'package:teenstar/PRESENTATION/core/_main_navigation/main_navigation_page.dart';
import 'package:teenstar/PRESENTATION/core/_splash/splash_page.dart';
import 'package:teenstar/PRESENTATION/cycle/ajout_observation_journee/ajout_observation_journee_page.dart';
import 'package:teenstar/PRESENTATION/cycle/cycles_page.dart';
import 'package:teenstar/PRESENTATION/reglages/notifications/notifications_page.dart'; //insert-import

import '../../reglages/account/buttons/buttons.dart';
import '../../reglages/account/colors/colors.dart';
import '../../reglages/account/utils/utils_page.dart';
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //RedirectRoute(path: '*', redirectTo: '/'),
        AutoRoute(
          path: '/',
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/main',
          page: MainNavigationRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'resume-route'),
            AutoRoute(
              path: 'cycles-route',
              page: CyclesRoute.page,
            ),
            AutoRoute(
              path: 'historique-route',
              page: HistoriqueRoute.page,
            ),
            AutoRoute(
              path: 'account',
              page: AccountRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/auth-init',
          page: AuthInitRoute.page,
        ),
        AutoRoute(
          path: '/auth-connexion',
          page: AuthConnexionRoute.page,
        ),
        AutoRoute(
          path: '/auth-register',
          page: AuthRegisterRoute.page,
        ),
        AutoRoute(
          path: '/auth-reset-password',
          page: AuthResetPasswordRoute.page,
        ),
        AutoRoute(
          path: '/modify-account',
          page: ModifyAccountRoute.page,
        ),
        AutoRoute(
          path: '/reauthenticate',
          page: ReauthenticateRoute.page,
        ),
        AutoRoute(
          path: '/delete-account',
          page: DeleteAccountRoute.page,
        ),
        AutoRoute(
          path: '/new-password',
          page: NewPasswordRoute.page,
        ),
        AutoRoute(
          path: '/components-route',
          page: ComponentsRoute.page,
        ),
        AutoRoute(
          path: '/colors-route',
          page: ColorsRoute.page,
        ),
        AutoRoute(
          path: '/buttons-route',
          page: ButtonsRoute.page,
        ),
        AutoRoute(
          path: '/textStyle-route',
          page: TextStyleRoute.page,
        ),
        AutoRoute(
          path: '/utils-route',
          page: UtilsRoute.page,
        ),
        AutoRoute(
          path: '/observation-add-route',
          page: ObservationAddRoute.page,
        ),
        AutoRoute(
          path: '/langue-route',
          page: LangueRoute.page,
        ),
        AutoRoute(
          path: '/principes_de_base-route',
          page: Guide_de_baseRoute.page,
        ),
        AutoRoute(
          path: '/condition_utilisation-route',
          page: Condition_utilisationRoute.page,
        ),
        AutoRoute(
          path: '/guide_avance-route',
          page: Guide_avanceRoute.page,
        ),
        AutoRoute(
          path: '/info_application-route',
          page: Info_applicationRoute.page,
        ),
        AutoRoute(
          path: '/notifications-route',
          page: NotificationsRoute.page,
        ), //insert-route
      ];
}
