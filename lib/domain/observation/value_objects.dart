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

  factory CouleurAnalyse.fromString(String input) {
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
}

@immutable
class Sensation extends ValueObject<SensationState> {
  @override
  final Either<ValueFailure<SensationState>, SensationState> value;

  factory Sensation(SensationState input) {
    return Sensation._(right(input));
  }

  factory Sensation.fromString(String input) {
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
}

@immutable
class Sang extends ValueObject<SangState> {
  @override
  final Either<ValueFailure<SangState>, SangState> value;

  factory Sang(SangState input) {
    return Sang._(right(input));
  }

  factory Sang.fromString(String input) {
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
  opageBlancOuJaune,
  depotSecheBlancOuJaune,
  opaqueAvecTransparent_UnPeuEtirable,
  nuageuxATransparent_Elastique,
  transparentFilantOuTresFluide,
  aucunMucusVisible,
  none,
}

extension ParseToSringMucus on MucusState {
  String toShortString() {
    return this.toString().toLowerCase();
  }
}

@immutable
class Mucus extends ValueObject<MucusState> {
  @override
  final Either<ValueFailure<MucusState>, MucusState> value;

  factory Mucus(MucusState input) {
    return Mucus._(right(input));
  }

  factory Mucus.fromString(String input) {
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
}

@immutable
class Douleur extends ValueObject<DouleurState> {
  @override
  final Either<ValueFailure<DouleurState>, DouleurState> value;

  factory Douleur(DouleurState input) {
    return Douleur._(right(input));
  }

  factory Douleur.fromString(String input) {
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
}

@immutable
class Evenement extends ValueObject<EvenementState> {
  @override
  final Either<ValueFailure<EvenementState>, EvenementState> value;

  factory Evenement(EvenementState input) {
    return Evenement._(right(input));
  }

  factory Evenement.fromString(String input) {
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
}

@immutable
class Humeur extends ValueObject<HumeurState> {
  @override
  final Either<ValueFailure<HumeurState>, HumeurState> value;

  factory Humeur(HumeurState input) {
    return Humeur._(right(input));
  }

  factory Humeur.fromString(String input) {
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
