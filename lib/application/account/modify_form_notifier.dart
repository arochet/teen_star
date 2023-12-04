import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/auth/auth_failure.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_form.dart';
part 'modify_form_notifier.freezed.dart';

@freezed
class ModifyFormData with _$ModifyFormData {
  const factory ModifyFormData({
    required Nom nomUtilisateur,
    required int annePremiereRegle,
    required DateTime? dateNaissance,
    required ThemeApp? themeApp,
    required LanguageApp? languageApp,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _ModifyFormData;

  factory ModifyFormData.initial() => ModifyFormData(
      nomUtilisateur: Nom(''),
      annePremiereRegle: 0,
      dateNaissance: null,
      themeApp: null,
      languageApp: null,
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

  themeChanged(ThemeApp? themeApp) {
    state = state.copyWith(themeApp: themeApp, authFailureOrSuccessOption: none());
  }

  languageChanged(LanguageApp? languageApp) {
    state = state.copyWith(languageApp: languageApp, authFailureOrSuccessOption: none());
  }

  anneePremiereRegleChanged(int annee) {
    state = state.copyWith(annePremiereRegle: annee, authFailureOrSuccessOption: none());
  }

  modifyPressed() async {
    printDev();
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isUserNameValid = state.nomUtilisateur.isValid();
    if (isUserNameValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());
      failureOrSuccess = await this._authRepository.modifyAccount(
            nomUtilisateur: state.nomUtilisateur,
            annePremiereRegle: state.annePremiereRegle,
            dateNaissance: state.dateNaissance,
            themeApp: state.themeApp,
            languageApp: state.languageApp,
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
