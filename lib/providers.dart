import 'package:dartz/dartz.dart';
import 'package:teenstar/APPLICATION/account/modify_form_notifier.dart';
import 'package:teenstar/APPLICATION/auth/auth_notifier.dart';
import 'package:teenstar/APPLICATION/account/new_password_form_notifier.dart';
import 'package:teenstar/APPLICATION/account/reauthenticate_form_notifier.dart';
import 'package:teenstar/APPLICATION/auth/register_form_notifier.dart';
import 'package:teenstar/APPLICATION/auth/reset_password_notifier.dart';
import 'package:teenstar/APPLICATION/auth/sign_in_form_notifier.dart';
import 'package:teenstar/APPLICATION/cycle/add_observation_form_notifier.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';

import 'DOMAIN/core/value_objects.dart';
import 'DOMAIN/cycle/cycle_failure.dart';
import 'INFRASTRUCTURE/auth/auth_repository.dart';
import 'INFRASTRUCTURE/cycle/cycle_repository.dart';
import 'INFRASTRUCTURE/cycle/observation_historique_dtos.dart';
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

//FORM - Formulaire de modification des donn??es utilisateurs
final modifyFormNotifierProvider = StateNotifierProvider.autoDispose<ModifyFormNotifier, ModifyFormData>(
  (ref) => ModifyFormNotifier(ref.watch(authRepositoryProvider)),
);

//FORM - Formulaire de r??authentification
final reauthenticateFormNotifierProvider =
    StateNotifierProvider.autoDispose<ReauthenticateFormNotifier, ReauthenticateFormData>(
  (ref) => ReauthenticateFormNotifier(ref.watch(authRepositoryProvider)),
);

//FORM - Formulaire de demande de nouveau mot de passe
final newPasswordFormNotifierProvider =
    StateNotifierProvider.autoDispose<NewPasswordFormNotifier, NewPasswordFormData>(
  (ref) => NewPasswordFormNotifier(ref.watch(authRepositoryProvider)),
);

//FORM - Formulaire pour r??initialiser le mot de passe
final resetPasswordFormNotifierProvider =
    StateNotifierProvider.autoDispose<ResetPasswordFormNotifier, ResetPasswordFormData>(
  (ref) => ResetPasswordFormNotifier(ref.watch(authRepositoryProvider)),
);

//HOME PAGE
final currentPageNavProvider = StateProvider<int?>((ref) => null);

//USER
//Utilisateur courant (comprend ses donn??es FireStore)
final currentUserData = FutureProvider.autoDispose<UserData?>((ref) async {
  final userOption = await ref.read(authRepositoryProvider).getUserData();
  return userOption.fold(() => null, (user) => user);
});

//CYCLE
final cycleRepositoryProvider = Provider<ICycleRepository>((ref) => getIt<ICycleRepository>());

final idCycleCourant = StateProvider<UniqueId?>((ref) => null);

//Tous les cycles
final allCycleProvider = FutureProvider<Either<CycleFailure, List<CycleDTO>>>((ref) {
  return ref.read(cycleRepositoryProvider).readAllCycles();
});

//Page Historique
final allCycleHistoriqueProvider =
    FutureProvider<Either<CycleFailure, List<ObservationHistoriqueDTO>>>((ref) {
  return ref.read(cycleRepositoryProvider).readAllCyclesHistorique();
});

//Un cycle par id
final cycleProvider = FutureProvider.family<Either<CycleFailure, Cycle>, UniqueId>((ref, id) {
  return ref.read(cycleRepositoryProvider).readCycle(id);
});

//FORM - Formulaire d'ajout d'observation
final cycleFormNotifierProvider =
    StateNotifierProvider.autoDispose<ObservationFormNotifier, AddObservationFormData>(
  (ref) => ObservationFormNotifier(ref.watch(cycleRepositoryProvider)),
);

//insert-provider
//Ne pas supprimer la balise ci-dessus
