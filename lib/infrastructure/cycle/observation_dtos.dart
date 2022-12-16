import 'dart:convert';

import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
part 'observation_dtos.freezed.dart';
part 'observation_dtos.g.dart';

@freezed
abstract class ObservationDTO implements _$ObservationDTO {
  const ObservationDTO._();

  const factory ObservationDTO({
    required int? id,
    required int? date,
    required String? couleur,
    required String? analyse,
    required String? sensation,
    required String? sensationsAutre,
    required String? sang,
    required String? mucus,
    required String? mucusAutre,
    required String douleurs,
    required String? douleursAutre,
    required String evenements,
    required int? temperatureBasale,
    required String? humeur,
    required String? humeurAutre,
    required String? notesConfidentielles,
    required String? commentaireAnimatrice,
    required int? marque,
    required int? idCycle,
  }) = _ObservationDTO;

  factory ObservationDTO.fromDomain(Observation obj, int idCycle) {
    return ObservationDTO(
      id: obj.id.getOrCrash(),
      date: obj.date?.millisecondsSinceEpoch,
      couleur: obj.couleur?.getOrCrash().toShortString(),
      analyse: obj.analyse?.getOrCrash().toShortString(),
      sensation: obj.sensation?.getOrCrash().toShortString(),
      sensationsAutre: obj.sensationsAutre,
      sang: obj.sang?.getOrCrash().toShortString(),
      mucus: obj.mucus?.getOrCrash().toShortString(),
      mucusAutre: obj.mucusAutre,
      douleurs: jsonEncode(obj.douleurs?.map((e) => e.getOrCrash().toShortString()).toList()),
      douleursAutre: obj.douleursAutre,
      evenements: jsonEncode(obj.evenements?.map((e) => e.getOrCrash().toShortString()).toList()),
      temperatureBasale: obj.temperatureBasale,
      humeur: obj.humeur?.getOrCrash().toShortString(),
      humeurAutre: obj.humeurAutre,
      notesConfidentielles: obj.notesConfidentielles,
      commentaireAnimatrice: obj.commentaireAnimatrice,
      marque: obj.marque,
      idCycle: idCycle,
    );
  }

  Observation toDomain() {
    return Observation(
      id: UniqueId.fromUniqueInt(id!),
      date: DateTime.fromMillisecondsSinceEpoch(date!),
      couleur: CouleurAnalyse.fromString(couleur),
      analyse: CouleurAnalyse.fromString(analyse),
      sensation: Sensation.fromString(sensation),
      sensationsAutre: sensationsAutre,
      sang: Sang.fromString(sang),
      mucus: Mucus.fromString(mucus),
      mucusAutre: mucusAutre,
      douleurs: (jsonDecode(douleurs) as List).map((e) => Douleur.fromString(e)).toList(),
      douleursAutre: douleursAutre,
      evenements: (jsonDecode(evenements) as List).map((e) => Evenement.fromString(e)).toList(),
      temperatureBasale: temperatureBasale,
      humeur: Humeur.fromString(humeur),
      humeurAutre: humeurAutre,
      notesConfidentielles: notesConfidentielles,
      commentaireAnimatrice: commentaireAnimatrice,
      marque: marque,
    );
  }

  factory ObservationDTO.fromJson(Map<String, dynamic> json) => _$ObservationDTOFromJson(json);
}
