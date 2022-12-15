import 'package:teenstar/DOMAIN/auth/auth_failure.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
part 'sign_in_form_notifier.freezed.dart';

@freezed
class SignInFormData with _$SignInFormData {
  const factory SignInFormData({
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormData;

  factory SignInFormData.initial() => SignInFormData(
      password: Password(''),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class SignInFormNotifier extends StateNotifier<SignInFormData> {
  final AuthRepository _authRepository;

  SignInFormNotifier(this._authRepository) : super(SignInFormData.initial());

  passwordChanged(String passwordStr) {
    state = state.copyWith(password: Password(passwordStr), authFailureOrSuccessOption: none());
  }

  signInWithEmailAndPasswordPressed() async {
    printDev('signInWithEmailAndPasswordPressed()');
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isPasswordValid = state.password.isValid();
    if (isPasswordValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._authRepository.signInWithEmailAndPassword(password: state.password);

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(password: Password(""));
      }
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}
