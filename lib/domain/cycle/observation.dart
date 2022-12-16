import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';

import 'value_objects.dart';

part 'observation.freezed.dart';

@freezed
abstract class Observation with _$Observation {
  const Observation._();

  const factory Observation({
    required UniqueId id,
    required DateTime? date,
    required CouleurAnalyse? couleur,
    required CouleurAnalyse? analyse,
    required Sensation? sensation,
    required String? sensationsAutre,
    required Sang? sang,
    required Mucus? mucus,
    required String? mucusAutre,
    required List<Douleur>? douleurs,
    required String? douleursAutre,
    required List<Evenement>? evenements,
    required int? temperatureBasale,
    required Humeur? humeur,
    required String? humeurAutre,
    required String? notesConfidentielles,
    required String? commentaireAnimatrice,
    required int? marque,
  }) = _Observation;

  factory Observation.empty() => Observation(
        id: UniqueId(),
        date: DateTime.now(),
        couleur: CouleurAnalyse.init(),
        analyse: CouleurAnalyse.init(),
        sensation: Sensation.init(),
        sensationsAutre: '',
        sang: Sang.init(),
        mucus: Mucus.init(),
        mucusAutre: '',
        douleurs: [],
        douleursAutre: '',
        evenements: [],
        temperatureBasale: 0,
        humeur: Humeur.init(),
        humeurAutre: '',
        notesConfidentielles: '',
        commentaireAnimatrice: '',
        marque: 0,
      );
}
