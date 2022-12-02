import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/account/account/components/components_page.dart';
import 'package:teenstar/PRESENTATION/account/account/text_style/text_style.dart';
import 'package:teenstar/PRESENTATION/account/account/account_page.dart';
import 'package:teenstar/PRESENTATION/account/delete_account/delete_account_page.dart';
import 'package:teenstar/PRESENTATION/account/modify_account/modify_account_page.dart';
import 'package:teenstar/PRESENTATION/account/new_password/new_password_page.dart';
import 'package:teenstar/PRESENTATION/account/reauthenticate/reauthenticate_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_check_email/auth_check_email_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_connexion/auth_connexion_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_init/auth_init_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_register/auth_register_page.dart';
import 'package:teenstar/PRESENTATION/auth/auth_reset_password.dart/auth_reset_password_page.dart';
import 'package:teenstar/PRESENTATION/historique/historique_page.dart';
import 'package:teenstar/PRESENTATION/core/_main_navigation/main_navigation_page.dart';
import 'package:teenstar/PRESENTATION/core/_splash/splash_page.dart';
import 'package:teenstar/PRESENTATION/observation/observation_add/observation_add_page.dart';
import 'package:teenstar/PRESENTATION/resume/resume_page.dart';

import '../../account/account/buttons/buttons.dart';
import '../../account/account/colors/colors.dart';
import '../../account/account/utils/utils_page.dart';
import '../../observation/observation_view/observation_view_page.dart';

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
    path: '/auth-check-email',
    name: 'AuthCheckEmailRoute',
    page: AuthCheckEmailPage,
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
  /* AutoRoute(
    path: '/observation-view-route',
    name: 'ObservationViewRoute',
    page: ObservationViewPage,
  ), */
  //insert-route
])
class $AppRouter {}
