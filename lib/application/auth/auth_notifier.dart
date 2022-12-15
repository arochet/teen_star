import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Ajouter freezed !
abstract class AuthState {
  const AuthState();
}

class AuthInital extends AuthState {
  const AuthInital();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated();
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthInital());

  Future authCheckRequested() async {
    final optionUser = await _authRepository.getUserData();
    if (optionUser.isNone()) {
      state = AuthUnauthenticated();
    } else {
      state = AuthAuthenticated();
    }

    state = state;
  }

  Future signOut() async {
    await _authRepository.signOut();
    state = AuthUnauthenticated();
  }

  Future deleteAccount() async {
    await _authRepository.deleteALL();
  }
}
