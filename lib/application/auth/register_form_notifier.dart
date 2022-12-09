import 'package:teenstar/DOMAIN/auth/auth_failure.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_form_notifier.freezed.dart';

@freezed
class RegisterFormData with _$RegisterFormData {
  const factory RegisterFormData({
    required Nom nomUtilisateur,
    required int annePremiereRegle,
    required DateTime? dateNaissance,
    required Password passwordAppli,
    required PasswordConfirmation passwordAppliConfirmation,
    required Password passwordPDF,
    required PasswordConfirmation passwordPDFConfirmation,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _RegisterFormData;

  factory RegisterFormData.initial() => RegisterFormData(
      nomUtilisateur: Nom(''),
      annePremiereRegle: 0,
      dateNaissance: null,
      passwordAppli: Password(''),
      passwordAppliConfirmation: PasswordConfirmation('', ''),
      passwordPDF: Password(''),
      passwordPDFConfirmation: PasswordConfirmation('', ''),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class RegisterFormNotifier extends StateNotifier<RegisterFormData> {
  final AuthRepository _authRepository;

  RegisterFormNotifier(this._authRepository) : super(RegisterFormData.initial());

  nomUtilisateurChanged(String nomStr) {
    state = state.copyWith(nomUtilisateur: Nom(nomStr), authFailureOrSuccessOption: none());
  }

  dateNaissanceChanged(DateTime? dateNaissance) {
    state = state.copyWith(dateNaissance: dateNaissance, authFailureOrSuccessOption: none());
  }

  anneePremiereRegleChanged(int annee) {
    print('annne $annee');
    state = state.copyWith(annePremiereRegle: annee, authFailureOrSuccessOption: none());
  }

  passwordAppliChanged(String passwordStr) {
    state = state.copyWith(passwordAppli: Password(passwordStr), authFailureOrSuccessOption: none());
  }

  passwordAppliConfirmationChanged(String passwordStr) {
    state = state.copyWith(
        passwordAppliConfirmation:
            PasswordConfirmation(state.passwordAppli.value.getOrElse(() => ''), passwordStr),
        authFailureOrSuccessOption: none());
  }

  passwordPDFChanged(String passwordStr) {
    state = state.copyWith(passwordPDF: Password(passwordStr), authFailureOrSuccessOption: none());
  }

  passwordPDFConfirmationChanged(String passwordStr) {
    state = state.copyWith(
        passwordPDFConfirmation:
            PasswordConfirmation(state.passwordPDF.value.getOrElse(() => ''), passwordStr),
        authFailureOrSuccessOption: none());
  }

  registerWithEmailAndPasswordPressed() async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isUserNameValid = state.nomUtilisateur.isValid();
    final isPasswordAppliValid = state.passwordAppli.isValid();
    final isPasswordPDFValid = state.passwordPDF.isValid();
    final isPasswordAppliConfirmationValid = state.passwordAppliConfirmation.isValid();
    final isPasswordPDFConfirmationValid = state.passwordPDFConfirmation.isValid();
    if (isUserNameValid &&
        isPasswordAppliValid &&
        isPasswordPDFValid &&
        isPasswordAppliConfirmationValid &&
        isPasswordPDFConfirmationValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._authRepository.registerWithEmailAndPassword(
          userData: UserData(
              id: UniqueId(),
              userName: state.nomUtilisateur,
              anneePremiereRegle: state.annePremiereRegle,
              dateNaissance: state.dateNaissance,
              theme: 0),
          passwordAppli: state.passwordAppli,
          passwordPDF: state.passwordPDF);

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(
          nomUtilisateur: Nom(""),
          annePremiereRegle: 0,
          dateNaissance: null,
          passwordAppli: Password(''),
          passwordAppliConfirmation: PasswordConfirmation('', ''),
          passwordPDF: Password(''),
          passwordPDFConfirmation: PasswordConfirmation('', ''),
        );
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
