import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/failures.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/core/value_validators.dart';

enum CouleurAnalyseState { rouge, brun, vert, none }

extension ParseToSringTA on CouleurAnalyseState {
  String toShortString() {
    return this.toString().toLowerCase();
  }
}

@immutable
class CouleurAnalyse extends ValueObject<CouleurAnalyseState> {
  @override
  final Either<ValueFailure<CouleurAnalyseState>, CouleurAnalyseState> value;

  factory CouleurAnalyse(CouleurAnalyseState input) {
    return CouleurAnalyse._(right(input));
  }

  factory CouleurAnalyse.fromString(String? input) {
    try {
      final CouleurAnalyseState state =
          CouleurAnalyseState.values.firstWhere((e) => e.toShortString() == input);
      if (state == null) return CouleurAnalyse._(left(ValueFailure.invalidEnum(failedValue: state)));
      return CouleurAnalyse._(right(state));
    } catch (e) {
      return CouleurAnalyse._(left(ValueFailure.invalidEnum(failedValue: CouleurAnalyseState.rouge)));
    }
  }

  factory CouleurAnalyse.init() {
    return CouleurAnalyse._(right(CouleurAnalyseState.none));
  }

  const CouleurAnalyse._(this.value);
}

enum SensationState { sec, humide, mouille, glissantLubrifie, nonpercu, autre, none }

extension ParseToSringSensation on SensationState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString() {
    switch (this) {
      case SensationState.sec:
        return 'sec';
      case SensationState.humide:
        return 'humide';
      case SensationState.mouille:
        return 'mouillé';
      case SensationState.glissantLubrifie:
        return 'glissant lubrifié';
      case SensationState.nonpercu:
        return 'non perçu';
      case SensationState.autre:
        return 'autre';
      case SensationState.none:
        return '';
    }
  }

  String toDisplayShort() {
    switch (this) {
      case SensationState.sec:
        return 'S';
      case SensationState.humide:
        return 'H';
      case SensationState.mouille:
        return 'M';
      case SensationState.glissantLubrifie:
        return 'GL';
      case SensationState.nonpercu:
        return 'np';
      case SensationState.autre:
        return '?';
      case SensationState.none:
        return '';
    }
  }
}

@immutable
class Sensation extends ValueObject<SensationState> {
  @override
  final Either<ValueFailure<SensationState>, SensationState> value;

  factory Sensation(SensationState input) {
    return Sensation._(right(input));
  }

  factory Sensation.fromString(String? input) {
    try {
      final SensationState state = SensationState.values.firstWhere((e) => e.toShortString() == input);
      if (state == null) return Sensation._(left(ValueFailure.invalidEnum(failedValue: state)));
      return Sensation._(right(state));
    } catch (e) {
      return Sensation._(left(ValueFailure.invalidEnum(failedValue: SensationState.none)));
    }
  }

  factory Sensation.init() {
    return Sensation._(right(SensationState.none));
  }

  const Sensation._(this.value);
}

enum SangState { fluxPP, fluxP, traces, rien, none }

extension ParseToSringSang on SangState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString() {
    switch (this) {
      case SangState.fluxPP:
        return 'flux ++';
      case SangState.fluxP:
        return 'flux +';
      case SangState.traces:
        return 'traces';
      case SangState.rien:
        return 'rien';
      case SangState.none:
        return '';
    }
  }
}

@immutable
class Sang extends ValueObject<SangState> {
  @override
  final Either<ValueFailure<SangState>, SangState> value;

  factory Sang(SangState input) {
    return Sang._(right(input));
  }

  factory Sang.fromString(String? input) {
    try {
      final SangState state = SangState.values.firstWhere((e) => e.toShortString() == input);
      if (state == null) return Sang._(left(ValueFailure.invalidEnum(failedValue: state)));
      return Sang._(right(state));
    } catch (e) {
      return Sang._(left(ValueFailure.invalidEnum(failedValue: SangState.none)));
    }
  }

  factory Sang.init() {
    return Sang._(right(SangState.none));
  }

  const Sang._(this.value);
}

enum MucusState {
  opaqueBlancOuJaune,
  depotSecheBlancOuJaune,
  opaqueAvecTransparent_UnPeuEtirable,
  nuageuxATransparent_Elastique,
  transparentFilantOuTresFluide,
  aucunMucusVisible,
  autre,
  none,
}

extension ParseToSringMucus on MucusState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString() {
    switch (this) {
      case MucusState.opaqueBlancOuJaune:
        return 'Opaque blanc ou jaune';
      case MucusState.depotSecheBlancOuJaune:
        return 'Dépôt séché blanc ou jaune';
      case MucusState.opaqueAvecTransparent_UnPeuEtirable:
        return 'Opaque avec transparent. Un peu étirable';
      case MucusState.nuageuxATransparent_Elastique:
        return 'Nuageux (blanc) à transparent; élastique';
      case MucusState.transparentFilantOuTresFluide:
        return 'Transparent; filant ou très fluide';
      case MucusState.aucunMucusVisible:
        return 'Aucun mucus visible';
      case MucusState.autre:
        return 'Autre';
      case MucusState.none:
        return '';
    }
  }
}

@immutable
class Mucus extends ValueObject<MucusState> {
  @override
  final Either<ValueFailure<MucusState>, MucusState> value;

  factory Mucus(MucusState input) {
    return Mucus._(right(input));
  }

  factory Mucus.fromString(String? input) {
    try {
      final MucusState state = MucusState.values.firstWhere((e) => e.toShortString() == input);
      if (state == null) return Mucus._(left(ValueFailure.invalidEnum(failedValue: state)));
      return Mucus._(right(state));
    } catch (e) {
      return Mucus._(left(ValueFailure.invalidEnum(failedValue: MucusState.none)));
    }
  }

  factory Mucus.init() {
    return Mucus._(right(MucusState.none));
  }

  const Mucus._(this.value);
}

enum DouleurState { seins, ventre, malDeTete, aucune, none }

extension ParseToSringDouleur on DouleurState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString() {
    switch (this) {
      case DouleurState.seins:
        return 'Douleurs seins';
      case DouleurState.ventre:
        return 'Douleurs ventre';
      case DouleurState.malDeTete:
        return 'Mal de tête';
      case DouleurState.aucune:
        return 'Aucune';
      case DouleurState.none:
        return '';
    }
  }

  String toDisplayShort() {
    switch (this) {
      case DouleurState.seins:
        return 'DS';
      case DouleurState.ventre:
        return 'DV';
      case DouleurState.malDeTete:
        return 'MT';
      case DouleurState.aucune:
        return '-';
      case DouleurState.none:
        return '';
    }
  }
}

@immutable
class Douleur extends ValueObject<DouleurState> {
  @override
  final Either<ValueFailure<DouleurState>, DouleurState> value;

  factory Douleur(DouleurState input) {
    return Douleur._(right(input));
  }

  factory Douleur.fromString(String? input) {
    try {
      final DouleurState state = DouleurState.values.firstWhere((e) => e.toShortString() == input);
      if (state == null) return Douleur._(left(ValueFailure.invalidEnum(failedValue: state)));
      return Douleur._(right(state));
    } catch (e) {
      return Douleur._(left(ValueFailure.invalidEnum(failedValue: DouleurState.none)));
    }
  }

  factory Douleur.init() {
    return Douleur._(right(DouleurState.none));
  }

  const Douleur._(this.value);
}

enum EvenementState { fatigue, stress, voyage, personnelType1, personnelType2, autre, none }

extension ParseToSringEvenement on EvenementState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString() {
    switch (this) {
      case EvenementState.fatigue:
        return 'Fatigue';
      case EvenementState.stress:
        return 'Stress';
      case EvenementState.voyage:
        return 'Voyage';
      case EvenementState.personnelType1:
        return 'Personnel Type 1';
      case EvenementState.personnelType2:
        return 'Personnel Type 2';
      case EvenementState.autre:
        return 'Autre';
      case EvenementState.none:
        return '';
    }
  }
}

@immutable
class Evenement extends ValueObject<EvenementState> {
  @override
  final Either<ValueFailure<EvenementState>, EvenementState> value;

  factory Evenement(EvenementState input) {
    return Evenement._(right(input));
  }

  factory Evenement.fromString(String? input) {
    try {
      final EvenementState state = EvenementState.values.firstWhere((e) => e.toShortString() == input);
      if (state == null) return Evenement._(left(ValueFailure.invalidEnum(failedValue: state)));
      return Evenement._(right(state));
    } catch (e) {
      return Evenement._(left(ValueFailure.invalidEnum(failedValue: EvenementState.none)));
    }
  }

  factory Evenement.init() {
    return Evenement._(right(EvenementState.none));
  }

  const Evenement._(this.value);
}

enum HumeurState {
  tresBonne,
  bonne,
  pasEmotionParticuliere,
  EnvieEtreTranquille,
  humeurChangeante,
  nervositeIrritable,
  tristesse,
  autre,
  none,
}

extension ParseToSringHumeur on HumeurState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString() {
    switch (this) {
      case HumeurState.tresBonne:
        return 'Très bonne';
      case HumeurState.bonne:
        return 'Bonne';
      case HumeurState.pasEmotionParticuliere:
        return 'Pas d\'émotion particulière';
      case HumeurState.EnvieEtreTranquille:
        return 'Envie d\'être tranquille';
      case HumeurState.humeurChangeante:
        return 'Humeur Changeante';
      case HumeurState.nervositeIrritable:
        return 'Nervosité Irritable';
      case HumeurState.tristesse:
        return 'Tristesse';
      case HumeurState.autre:
        return 'Autre';
      case HumeurState.none:
        return '';
    }
  }
}

@immutable
class Humeur extends ValueObject<HumeurState> {
  @override
  final Either<ValueFailure<HumeurState>, HumeurState> value;

  factory Humeur(HumeurState input) {
    return Humeur._(right(input));
  }

  factory Humeur.fromString(String? input) {
    try {
      final HumeurState state = HumeurState.values.firstWhere((e) => e.toShortString() == input);
      if (state == null) return Humeur._(left(ValueFailure.invalidEnum(failedValue: state)));
      return Humeur._(right(state));
    } catch (e) {
      return Humeur._(left(ValueFailure.invalidEnum(failedValue: HumeurState.none)));
    }
  }

  factory Humeur.init() {
    return Humeur._(right(HumeurState.none));
  }

  const Humeur._(this.value);
}
