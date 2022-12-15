import 'package:teenstar/DOMAIN/auth/auth_failure.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
part 'modify_form_notifier.freezed.dart';

@freezed
class ModifyFormData with _$ModifyFormData {
  const factory ModifyFormData({
    required Nom nomUtilisateur,
    required int annePremiereRegle,
    required DateTime? dateNaissance,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _ModifyFormData;

  factory ModifyFormData.initial() => ModifyFormData(
      nomUtilisateur: Nom(''),
      annePremiereRegle: 0,
      dateNaissance: null,
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class ModifyFormNotifier extends StateNotifier<ModifyFormData> {
  final AuthRepository _authRepository;

  ModifyFormNotifier(this._authRepository) : super(ModifyFormData.initial());

  setValueWithUserData(UserData userData) {
    state = state.copyWith(
      nomUtilisateur: userData.userName,
    );
  }

  nomUtilisateurChanged(String nomStr) {
    state = state.copyWith(nomUtilisateur: Nom(nomStr), authFailureOrSuccessOption: none());
  }

  dateNaissanceChanged(DateTime? dateNaissance) {
    state = state.copyWith(dateNaissance: dateNaissance, authFailureOrSuccessOption: none());
  }

  anneePremiereRegleChanged(int annee) {
    state = state.copyWith(annePremiereRegle: annee, authFailureOrSuccessOption: none());
  }

  modifyPressed() async {
    printDev('modifyPressed');
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isUserNameValid = state.nomUtilisateur.isValid();
    if (isUserNameValid && state.dateNaissance != null) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());
      failureOrSuccess = await this._authRepository.modifyAccount(
            nomUtilisateur: state.nomUtilisateur,
            annePremiereRegle: state.annePremiereRegle,
            dateNaissance: state.dateNaissance!,
          );
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}
