import 'package:dartz/dartz.dart';
import 'package:teenstar/APPLICATION/account/modify_form_notifier.dart';
import 'package:teenstar/APPLICATION/auth/auth_notifier.dart';
import 'package:teenstar/APPLICATION/account/new_password_form_notifier.dart';
import 'package:teenstar/APPLICATION/account/reauthenticate_form_notifier.dart';
import 'package:teenstar/APPLICATION/auth/register_form_notifier.dart';
import 'package:teenstar/APPLICATION/auth/reset_password_notifier.dart';
import 'package:teenstar/APPLICATION/auth/sign_in_form_notifier.dart';
import 'package:teenstar/APPLICATION/observation/add_observation_form_notifier.dart';
import 'package:teenstar/DOMAIN/auth/user_auth.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:teenstar/INFRASTRUCTURE/observation/observation_repository.dart';

import 'DOMAIN/core/errors.dart';
import 'DOMAIN/core/value_objects.dart';
import 'DOMAIN/observation/observation.dart';
import 'DOMAIN/observation/observation_failure.dart';
import 'INFRASTRUCTURE/auth/auth_repository.dart';
import 'injection.dart';

//ENVIRONNEMENT
final environment = StateProvider<Environment>((ref) => Environment(Environment.dev));
final showFilePath = StateProvider<bool>((ref) => false);

//AUTHENTIFICATION
final authRepositoryProvider = Provider<AuthRepository>((ref) => getIt<AuthRepository>());

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authRepositoryProvider))..authCheckRequested(),
);

//FORM => Formulaire de connexion
final signInFormNotifierProvider = StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormData>(
  (ref) => SignInFormNotifier(ref.watch(authRepositoryProvider)),
);

//FORM - Formulaire d'inscription
final registerFormNotifierProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormData>(
  (ref) => RegisterFormNotifier(ref.watch(authRepositoryProvider)),
);

//FORM - Formulaire de modification des données utilisateurs
final modifyFormNotifierProvider = StateNotifierProvider.autoDispose<ModifyFormNotifier, ModifyFormData>(
  (ref) => ModifyFormNotifier(ref.watch(authRepositoryProvider)),
);

//FORM - Formulaire de réauthentification
final reauthenticateFormNotifierProvider =
    StateNotifierProvider.autoDispose<ReauthenticateFormNotifier, ReauthenticateFormData>(
  (ref) => ReauthenticateFormNotifier(ref.watch(authRepositoryProvider)),
);

//FORM - Formulaire de demande de nouveau mot de passe
final newPasswordFormNotifierProvider =
    StateNotifierProvider.autoDispose<NewPasswordFormNotifier, NewPasswordFormData>(
  (ref) => NewPasswordFormNotifier(ref.watch(authRepositoryProvider)),
);

//FORM - Formulaire pour réinitialiser le mot de passe
final resetPasswordFormNotifierProvider =
    StateNotifierProvider.autoDispose<ResetPasswordFormNotifier, ResetPasswordFormData>(
  (ref) => ResetPasswordFormNotifier(ref.watch(authRepositoryProvider)),
);

//HOME PAGE
final currentPageNavProvider = StateProvider<int?>((ref) => null);

//USER
//Utilisateur courant (comprend son identifiant FirebaseAuth)
final currentUser = FutureProvider.autoDispose<UserAuth>((ref) async {
  final userOption = await getIt<AuthRepository>().getSignedUser();
  return userOption.getOrElse(() => throw NotAuthenticatedError);
});

//Utilisateur courant (comprend ses données FireStore)
final currentUserData = FutureProvider.autoDispose<UserData?>((ref) async {
  ref.watch(currentUser);
  final userOption = await getIt<AuthRepository>().getUserData();
  final user = userOption.getOrElse(() => UserData.empty());

  if (user == UserData.empty() || userOption.isNone())
    return null;
  else
    return user;
});

//Observation

final observationRepositoryProvider =
    Provider<IObservationRepository>((ref) => getIt<IObservationRepository>());

final observationFormNotifierProvider =
    StateNotifierProvider.autoDispose<ObservationFormNotifier, AddObservationFormData>(
  (ref) => ObservationFormNotifier(ref.watch(observationRepositoryProvider)),
);

final allObservationProviderRead = FutureProvider<Either<ObservationFailure, List<Observation>>>((ref) {
  return ref.read(observationRepositoryProvider).read();
});

/* final oneObservationProvider = FutureProvider.autoDispose
    .family<Either<ObservationFailure, Observation>, UniqueId>(
        (ref, id) => ref.watch(observationRepositoryProvider).watchWithId(id)); */


//insert-provider
//Ne pas supprimer la balise ci-dessus
