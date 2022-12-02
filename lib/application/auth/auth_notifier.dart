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
    print('authCheckRequested() called');
    print('A voir pour se déconnecté !');
    state = AuthAuthenticated();
    /* try {
      final userOption = await _authRepository.getSignedUser();
      state = await userOption.fold(() => AuthUnauthenticated(), (a) async {
        if (_authRepository.isUserEmailVerified())
          return AuthAuthenticated();
        else
          return AuthAuthenticated();
      });
    } catch (e) {
      print(e);
    } */
  }

  bool authCheckEmail() {
    return _authRepository.isUserEmailVerified();
  }

  Future signOut() async {
    await _authRepository.signOut();
    state = AuthUnauthenticated();
  }

  Future deleteAccount(TypeAccountState type) async {
    switch (type) {
      case TypeAccountState.email:
        await _authRepository.deleteAccountWithEmailAndPassword();
        break;
      default:
        break;
    }
    state = AuthUnauthenticated();
  }

  Future sendEmailVerification() async {
    this._authRepository.sendEmailVerification();
  }
}
