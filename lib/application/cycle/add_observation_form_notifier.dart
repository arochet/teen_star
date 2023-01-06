import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/observation_failure.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_repository.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';
part 'add_observation_form_notifier.freezed.dart';

@freezed
class AddObservationFormData with _$AddObservationFormData {
  const factory AddObservationFormData({
    required DateTime date,
    required Sensation sensation,
    required String sensationsAutre,
    required Sang sang,
    required Mucus mucus,
    required String mucusAutre,
    required List<Douleur> douleurs,
    required String? douleursAutre,
    required List<Evenement> evenements,
    required int? temperatureBasale,
    required Humeur humeur,
    required String humeurAutre,
    required String notesConfidentielles,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ObservationFailure, Unit>> authFailureOrSuccessOption,
  }) = _AddObservationFormData;

  factory AddObservationFormData.initial() => AddObservationFormData(
      date: AppDateUtils.todayAtMidnight,
      sensation: Sensation.init(),
      sensationsAutre: '',
      sang: Sang.init(),
      mucus: Mucus.init(),
      mucusAutre: '',
      douleurs: [],
      douleursAutre: '',
      evenements: [],
      temperatureBasale: null,
      humeur: Humeur.init(),
      humeurAutre: '',
      notesConfidentielles: '',
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class ObservationFormNotifier extends StateNotifier<AddObservationFormData> {
  final ICycleRepository _iObservationRepository;

  ObservationFormNotifier(this._iObservationRepository) : super(AddObservationFormData.initial());

  dateChanged(DateTime date) {
    state = state.copyWith(date: date, authFailureOrSuccessOption: none());
  }

  sensationChanged(Sensation sensation) {
    state = state.copyWith(sensation: sensation, authFailureOrSuccessOption: none());
  }

  sensationsAutreChanged(String param) {
    state = state.copyWith(sensationsAutre: param, authFailureOrSuccessOption: none());
  }

  sangChanged(Sang param) {
    state = state.copyWith(sang: param, authFailureOrSuccessOption: none());
  }

  mucusChanged(Mucus param) {
    state = state.copyWith(mucus: param, authFailureOrSuccessOption: none());
  }

  mucusAutreChanged(String param) {
    state = state.copyWith(mucusAutre: param, authFailureOrSuccessOption: none());
  }

  douleursChanged(DouleurState param) {
    List<Douleur> newList = [...state.douleurs];
    newList = newList.toSet().toList();
    if (newList.contains(Douleur(param))) {
      newList.remove(Douleur(param));
    } else {
      newList.add(Douleur(param));
    }
    state = state.copyWith(douleurs: newList, authFailureOrSuccessOption: none());
  }

  douleursAutreChanged(String param) {
    state = state.copyWith(douleursAutre: param, authFailureOrSuccessOption: none());
  }

  evenementsChanged(EvenementState param) {
    List<Evenement> newList = [...state.evenements];
    newList = newList.toSet().toList();
    if (newList.contains(Evenement(param))) {
      newList.remove(Evenement(param));
    } else {
      newList.add(Evenement(param));
    }
    state = state.copyWith(evenements: newList, authFailureOrSuccessOption: none());
  }

  temperatureBasaleChanged(int param) {
    state = state.copyWith(temperatureBasale: param, authFailureOrSuccessOption: none());
  }

  humeurChanged(Humeur param) {
    state = state.copyWith(humeur: (param), authFailureOrSuccessOption: none());
  }

  humeurAutreChanged(String param) {
    state = state.copyWith(humeurAutre: param, authFailureOrSuccessOption: none());
  }

  notesConfidentiellesChanged(String param) {
    state = state.copyWith(notesConfidentielles: param, authFailureOrSuccessOption: none());
  }
//insert-changed

  addObservationPressed(Cycle? cycle) async {
    printDev('addObservationPressed(Cycle? cycle)');
    Either<ObservationFailure, Unit>? failureOrSuccess;

    //insert-valid-params
    if (state.sensation.isValid() &&
        state.sang.isValid() &&
        state.mucus.isValid() &&
        state.humeur.isValid()) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._iObservationRepository.createObservation(
          cycle,
          Observation(
            id: UniqueId(),
            date: state.date,
            couleur: null,
            analyse: null,
            sensation: state.sensation,
            sensationsAutre: state.sensationsAutre,
            sang: state.sang,
            mucus: state.mucus,
            mucusAutre: state.mucusAutre,
            douleurs: state.douleurs,
            douleursAutre: state.douleursAutre,
            evenements: state.evenements,
            temperatureBasale: state.temperatureBasale,
            humeur: state.humeur,
            humeurAutre: state.humeurAutre,
            notesConfidentielles: state.notesConfidentielles,
            commentaireAnimatrice: null,
            marque: 0,
            jourFertile: true,
          ));

      if (failureOrSuccess.isRight()) {
        state = AddObservationFormData.initial();
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
