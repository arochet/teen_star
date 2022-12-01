import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/DOMAIN/observation/observation.dart';
import 'package:teenstar/DOMAIN/observation/observation_failure.dart';
import 'package:teenstar/DOMAIN/observation/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/observation/observation_repository.dart';
part 'add_observation_form_notifier.freezed.dart';

@freezed
class AddObservationFormData with _$AddObservationFormData {
  const factory AddObservationFormData({
    required Observation observation,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ObservationFailure, Unit>> authFailureOrSuccessOption,
  }) = _AddObservationFormData;

  factory AddObservationFormData.initial() => AddObservationFormData(
      observation: Observation.empty(),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class ObservationFormNotifier extends StateNotifier<AddObservationFormData> {
  final IObservationRepository _iObservationRepository;

  ObservationFormNotifier(this._iObservationRepository) : super(AddObservationFormData.initial());

  dateChanged(int param) {
    state = state.copyWith(
        observation: state.observation.copyWith(date: DateTime.fromMillisecondsSinceEpoch(param)),
        authFailureOrSuccessOption: none());
  }

  couleurChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(couleur: CouleurAnalyse.fromString(param)),
        authFailureOrSuccessOption: none());
  }

  analyseChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(analyse: CouleurAnalyse.fromString(param)),
        authFailureOrSuccessOption: none());
  }

  sensationChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(sensation: Sensation.fromString(param)),
        authFailureOrSuccessOption: none());
  }

  sensationsAutreChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(sensationsAutre: param), authFailureOrSuccessOption: none());
  }

  sangChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(sang: Sang.fromString(param)),
        authFailureOrSuccessOption: none());
  }

  mucusChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(mucus: Mucus.fromString(param)),
        authFailureOrSuccessOption: none());
  }

  mucusAutreChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(mucusAutre: param), authFailureOrSuccessOption: none());
  }

  douleursChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(douleurs: [Douleur(DouleurState.aucune)]),
        authFailureOrSuccessOption: none());
  }

  douleursAutreChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(douleursAutre: param), authFailureOrSuccessOption: none());
  }

  evenementsChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(evenements: [Evenement(EvenementState.none)]),
        authFailureOrSuccessOption: none());
  }

  temperatureBasaleChanged(int param) {
    state = state.copyWith(
        observation: state.observation.copyWith(temperatureBasale: param),
        authFailureOrSuccessOption: none());
  }

  humeurChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(humeur: Humeur.fromString(param)),
        authFailureOrSuccessOption: none());
  }

  humeurAutreChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(humeurAutre: param), authFailureOrSuccessOption: none());
  }

  notesConfidentiellesChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(notesConfidentielles: param),
        authFailureOrSuccessOption: none());
  }

  commentaireAnimatriceChanged(String param) {
    state = state.copyWith(
        observation: state.observation.copyWith(commentaireAnimatrice: param),
        authFailureOrSuccessOption: none());
  }
//insert-changed

  addObservationPressed() async {
    Either<ObservationFailure, Unit>? failureOrSuccess;

    //insert-valid-params
    if (false /* insert-valid-condition */) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._iObservationRepository.create(state.observation);

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(observation: Observation.empty());
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
