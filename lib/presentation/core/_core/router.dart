import 'package:auto_route/auto_route.dart';
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
import 'package:teenstar/PRESENTATION/reglages/principes_de_base/principes_de_base_page.dart';
import 'package:teenstar/PRESENTATION/reglages/reauthenticate/reauthenticate_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_connexion/auth_connexion_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_init/auth_init_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_register/auth_register_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_reset_password.dart/auth_reset_password_page.dart';
import 'package:teenstar/PRESENTATION/historique/historique_page.dart';
import 'package:teenstar/PRESENTATION/core/_main_navigation/main_navigation_page.dart';
import 'package:teenstar/PRESENTATION/core/_splash/splash_page.dart';
import 'package:teenstar/PRESENTATION/resume/ajout_observation_journee/ajout_observation_journee_page.dart';
import 'package:teenstar/PRESENTATION/resume/resume_page.dart';

import '../../reglages/account/buttons/buttons.dart';
import '../../reglages/account/colors/colors.dart';
import '../../reglages/account/utils/utils_page.dart';

@MaterialAutoRouter(replaceInRouteName: "Page,Route", routes: [
  //RedirectRoute(path: '*', redirectTo: '/'),
  AutoRoute(
    path: '/',
    name: 'SplashRoute',
    page: SplashPage,
    initial: true,
  ),
  AutoRoute(
    path: '/main',
    page: MainNavigationPage,
    children: [
      RedirectRoute(path: '', redirectTo: 'resume-route'),
      AutoRoute(
        path: 'resume-route',
        name: 'ResumeRoute',
        page: ResumePage,
      ),
      AutoRoute(
        path: 'historique-route',
        name: 'HistoriqueRoute',
        page: HistoriquePage,
      ),
      AutoRoute(
        path: 'account',
        name: 'AccountRoute',
        page: AccountPage,
      ),
    ],
  ),
  AutoRoute(
    path: '/auth-init',
    name: 'AuthInitRoute',
    page: AuthInitPage,
  ),
  AutoRoute(
    path: '/auth-connexion',
    name: 'AuthConnexionRoute',
    page: AuthConnexionPage,
  ),
  AutoRoute(
    path: '/auth-register',
    name: 'AuthRegisterRoute',
    page: AuthRegisterPage,
  ),
  AutoRoute(
    path: '/auth-reset-password',
    name: 'AuthResetPasswordRoute',
    page: AuthResetPasswordPage,
  ),
  AutoRoute(
    path: '/modify-account',
    name: 'ModifyAccountRoute',
    page: ModifyAccountPage,
  ),
  AutoRoute(
    path: '/reauthenticate',
    name: 'ReauthenticateRoute',
    page: ReauthenticatePage,
  ),
  AutoRoute(
    path: '/delete-account',
    name: 'DeleteAccountRoute',
    page: DeleteAccountPage,
  ),
  AutoRoute(
    path: '/new-password',
    name: 'NewPasswordRoute',
    page: NewPasswordPage,
  ),
  AutoRoute(
    path: '/components-route',
    name: 'ComponentsRoute',
    page: ComponentsPage,
  ),
  AutoRoute(
    path: '/colors-route',
    name: 'ColorsRoute',
    page: ColorsPage,
  ),
  AutoRoute(
    path: '/buttons-route',
    name: 'ButtonsRoute',
    page: ButtonsPage,
  ),
  AutoRoute(
    path: '/textStyle-route',
    name: 'TextStyleRoute',
    page: TextStylePage,
  ),
  AutoRoute(
    path: '/utils-route',
    name: 'UtilsRoute',
    page: UtilsPage,
  ),
  AutoRoute(
    path: '/observation-add-route',
    name: 'ObservationAddRoute',
    page: ObservationAddPage,
  ),
  AutoRoute(
    path: '/langue-route',
    name: 'LangueRoute',
    page: LanguePage,
  ),
  AutoRoute(
    path: '/principes_de_base-route',
    name: 'Principes_de_baseRoute',
    page: Principes_de_basePage,
  ),
  AutoRoute(
    path: '/condition_utilisation-route',
    name: 'Condition_utilisationRoute',
    page: Condition_utilisationPage,
  ),
  AutoRoute(
    path: '/guide_avance-route',
    name: 'Guide_avanceRoute',
    page: Guide_avancePage,
  ),
  AutoRoute(
    path: '/info_application-route',
    name: 'Info_applicationRoute',
    page: Info_applicationPage,
  ), //insert-route
])
class $AppRouter {}
