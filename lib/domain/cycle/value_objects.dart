import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:teenstar/DOMAIN/core/failures.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum CouleurAnalyseState { rougePlusPlus, rougePlus, rougeClair, brun, vert, jaune, bleue, none, invalide }

extension ParseToSringTA on CouleurAnalyseState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  Color? toColor() {
    switch (this) {
      case CouleurAnalyseState.rougePlusPlus:
        return Color.fromARGB(255, 197, 52, 29);
      case CouleurAnalyseState.rougePlus:
        return Color.fromARGB(255, 214, 97, 96);
      case CouleurAnalyseState.rougeClair:
        return Color.fromARGB(255, 250, 174, 174);
      case CouleurAnalyseState.brun:
        return Color.fromARGB(255, 198, 148, 115);
      case CouleurAnalyseState.vert:
        return Color.fromARGB(255, 164, 187, 67);
      case CouleurAnalyseState.jaune:
        return Color.fromARGB(255, 252, 221, 146);
      case CouleurAnalyseState.bleue:
        return Color.fromARGB(255, 135, 178, 210);
      case CouleurAnalyseState.none:
        return null;
      case CouleurAnalyseState.invalide:
        return Color.fromARGB(255, 186, 88, 210);
    }
  }

  PdfBrush toColorPDF() {
    switch (this) {
      case CouleurAnalyseState.rougePlusPlus:
        return PdfSolidBrush(PdfColor(197, 52, 29)); //red;
      case CouleurAnalyseState.rougePlus:
        return PdfSolidBrush(PdfColor(214, 97, 96)); //red;
      case CouleurAnalyseState.rougeClair:
        return PdfSolidBrush(PdfColor(250, 174, 174)); //red;
      case CouleurAnalyseState.brun:
        return PdfSolidBrush(PdfColor(198, 148, 115)); //brown;
      case CouleurAnalyseState.vert:
        return PdfSolidBrush(PdfColor(198, 148, 115)); //green;
      case CouleurAnalyseState.jaune:
        return PdfSolidBrush(PdfColor(252, 221, 146)); //yellow;
      case CouleurAnalyseState.bleue:
        return PdfSolidBrush(PdfColor(135, 178, 210)); //yellow;
      case CouleurAnalyseState.none:
        return PdfSolidBrush(PdfColor(210, 210, 210)); //amber50;
      case CouleurAnalyseState.invalide:
        return PdfBrushes.beige;
    }
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
    if (input == null) return CouleurAnalyse._(right(CouleurAnalyseState.none));
    try {
      try {
        final CouleurAnalyseState state = CouleurAnalyseState.values
            .firstWhere((e) => e.toString() == input, orElse: () => CouleurAnalyseState.invalide);
        return CouleurAnalyse._(right(state));
      } catch (e) {
        print('Error la couleur $input n\'existe pas');
        return CouleurAnalyse._(left(ValueFailure.invalidEnum(failedValue: CouleurAnalyseState.none)));
      }
    } catch (e) {
      return CouleurAnalyse._(left(ValueFailure.invalidEnum(failedValue: CouleurAnalyseState.rougePlusPlus)));
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

  String toDisplayString(BuildContext context) {
    switch (this) {
      case SensationState.sec:
        return AppLocalizations.of(context)!.dry_legend_icon_d;
      case SensationState.humide:
        return AppLocalizations.of(context)!.humid;
      case SensationState.mouille:
        return AppLocalizations.of(context)!.wet;
      case SensationState.glissantLubrifie:
        return AppLocalizations.of(context)!.slippery_lubricated;
      case SensationState.nonpercu:
        return AppLocalizations.of(context)!.not_perceived;
      case SensationState.autre:
        return AppLocalizations.of(context)!.other_sensation;
      case SensationState.none:
        return '';
    }
  }

  String toDisplayShort(BuildContext context) {
    switch (this) {
      case SensationState.sec:
        return AppLocalizations.of(context)!.d_letter_in_icon;
      case SensationState.humide:
        return 'H';
      case SensationState.mouille:
        return AppLocalizations.of(context)!.w;
      case SensationState.glissantLubrifie:
        return 'L';
      case SensationState.nonpercu:
        return 'np';
      case SensationState.autre:
        return '?';
      case SensationState.none:
        return '';
    }
  }

  String toIconPath() {
    return AssetsPath.icon_sensation_vide;
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

  String toDisplayString(BuildContext context) {
    switch (this) {
      case SangState.fluxPP:
        return AppLocalizations.of(context)!.flow_pp;
      case SangState.fluxP:
        return AppLocalizations.of(context)!.flow_p;
      case SangState.traces:
        return AppLocalizations.of(context)!.traces;
      case SangState.rien:
        return AppLocalizations.of(context)!.nothing;
      case SangState.none:
        return '';
    }
  }

  String toIconPath() {
    switch (this) {
      case SangState.fluxPP:
        return AssetsPath.icon_sang_flux_pp;
      case SangState.fluxP:
        return AssetsPath.icon_sang_flux_p;
      case SangState.traces:
        return AssetsPath.icon_sang_traces;
      case SangState.rien:
        return AssetsPath.icon_sang_vide;
      case SangState.none:
        return AssetsPath.icon_sang_vide;
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
  opaqueAvecTransparent_UnPeuEtirable,
  nuageuxATransparent_Elastique,
  transparentFilantOuTresFluide,
  aucunMucusVisible,
  depotSecheBlancOuJaune,
  autre,
  none,
}

extension ParseToSringMucus on MucusState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString(BuildContext context) {
    switch (this) {
      case MucusState.opaqueBlancOuJaune:
        return AppLocalizations.of(context)!.white_or_yellow_opaque;
      case MucusState.depotSecheBlancOuJaune:
        return AppLocalizations.of(context)!.dried_white_or_yellow_deposit;
      case MucusState.opaqueAvecTransparent_UnPeuEtirable:
        return AppLocalizations.of(context)!.opaque_with_transparency;
      case MucusState.nuageuxATransparent_Elastique:
        return AppLocalizations.of(context)!.cloudy_to_transparent;
      case MucusState.transparentFilantOuTresFluide:
        return AppLocalizations.of(context)!.stringy_transparent;
      case MucusState.aucunMucusVisible:
        return AppLocalizations.of(context)!.no_visible_mucus;
      case MucusState.autre:
        return AppLocalizations.of(context)!.other_observation;
      case MucusState.none:
        return '';
    }
  }

  String toIconPath() {
    switch (this) {
      case MucusState.opaqueBlancOuJaune:
        return AssetsPath.icon_mucus_opaque_blanc_jaune;
      case MucusState.depotSecheBlancOuJaune:
        return AssetsPath.icon_mucus_depot_seche_blanc;
      case MucusState.opaqueAvecTransparent_UnPeuEtirable:
        return AssetsPath.icon_mucus_opaque_transparent;
      case MucusState.nuageuxATransparent_Elastique:
        return AssetsPath.icon_mucus_nuageux;
      case MucusState.transparentFilantOuTresFluide:
        return AssetsPath.icon_mucus_transparent_filant;
      case MucusState.aucunMucusVisible:
        return AssetsPath.icon_mucus_visible;
      case MucusState.autre:
        return AssetsPath.icon_autre;
      case MucusState.none:
        return AssetsPath.icon_vide;
    }
  }

  double toHeight() {
    switch (this) {
      case MucusState.opaqueBlancOuJaune:
        return 100;
      case MucusState.depotSecheBlancOuJaune:
        return 100;
      case MucusState.opaqueAvecTransparent_UnPeuEtirable:
        return 100;
      case MucusState.nuageuxATransparent_Elastique:
        return 100;
      case MucusState.transparentFilantOuTresFluide:
        return 100;
      case MucusState.aucunMucusVisible:
        return 100;
      case MucusState.autre:
        return 100;
      case MucusState.none:
        return 100;
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

enum DouleurState { aucune, seins, ventre, malDeTete, acne, none }

extension ParseToSringDouleur on DouleurState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString(BuildContext context) {
    switch (this) {
      case DouleurState.seins:
        return AppLocalizations.of(context)!.breast_tension;
      case DouleurState.ventre:
        return AppLocalizations.of(context)!.belly_pain;
      case DouleurState.malDeTete:
        return AppLocalizations.of(context)!.headache;
      case DouleurState.aucune:
        return AppLocalizations.of(context)!.nothing;
      case DouleurState.acne:
        return AppLocalizations.of(context)!.acne;
      case DouleurState.none:
        return '';
    }
  }

  String toDisplayShort(BuildContext context) {
    switch (this) {
      case DouleurState.seins:
        return AppLocalizations.of(context)!.bt;
      case DouleurState.ventre:
        return AppLocalizations.of(context)!.bp;
      case DouleurState.malDeTete:
        return AppLocalizations.of(context)!.ha;
      case DouleurState.acne:
        return AppLocalizations.of(context)!.ac;
      case DouleurState.aucune:
        return '-';
      case DouleurState.none:
        return '';
    }
  }

  String toIconPath() {
    switch (this) {
      case DouleurState.seins:
        return AssetsPath.icon_vide_verte;
      case DouleurState.ventre:
        return AssetsPath.icon_vide_verte;
      case DouleurState.malDeTete:
        return AssetsPath.icon_vide_verte;
      case DouleurState.acne:
        return AssetsPath.icon_vide_verte;
      case DouleurState.aucune:
        return AssetsPath.icon_vide_verte;
      case DouleurState.none:
        return AssetsPath.icon_vide;
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

enum EvenementState {
  fatigue,
  stress,
  personnelType1,
  personnelType2,
  voyage,
  maladie,
  medicament,
  autre,
  none
}

extension ParseToSringEvenement on EvenementState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString(BuildContext context) {
    switch (this) {
      case EvenementState.fatigue:
        return AppLocalizations.of(context)!.fatigue;
      case EvenementState.stress:
        return AppLocalizations.of(context)!.stress;
      case EvenementState.voyage:
        return AppLocalizations.of(context)!.travel_unusual_schedules;
      case EvenementState.personnelType1:
        return AppLocalizations.of(context)!.personal_1;
      case EvenementState.personnelType2:
        return AppLocalizations.of(context)!.personal_2;
      case EvenementState.maladie:
        return AppLocalizations.of(context)!.illness_or_fever;
      case EvenementState.medicament:
        return AppLocalizations.of(context)!.medication;
      case EvenementState.autre:
        return AppLocalizations.of(context)!.other_note;
      case EvenementState.none:
        return '';
    }
  }

  String toDisplayShort() {
    switch (this) {
      case EvenementState.fatigue:
        return 'Fat';
      case EvenementState.stress:
        return 'Str';
      case EvenementState.voyage:
        return 'Voy';
      case EvenementState.personnelType1:
        return 'PersT1';
      case EvenementState.personnelType2:
        return 'PersT2';
      case EvenementState.maladie:
        return 'Mal';
      case EvenementState.medicament:
        return 'Méd';
      case EvenementState.autre:
        return 'Aut';
      case EvenementState.none:
        return '';
    }
  }

  String toIconPath() {
    switch (this) {
      case EvenementState.fatigue:
        return AssetsPath.icon_evt_fatigue;
      case EvenementState.stress:
        return AssetsPath.icon_evt_stress;
      case EvenementState.voyage:
        return AssetsPath.icon_evt_voyage;
      case EvenementState.personnelType1:
        return AssetsPath.icon_evt_perso1;
      case EvenementState.personnelType2:
        return AssetsPath.icon_evt_perso2;
      case EvenementState.maladie:
        return AssetsPath.icon_evt_maladie;
      case EvenementState.medicament:
        return AssetsPath.icon_evt_medicament;
      case EvenementState.autre:
        return AssetsPath.icon_evt_autre;
      case EvenementState.none:
        return AssetsPath.icon_vide;
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

  String toDisplayString(BuildContext context) {
    switch (this) {
      case HumeurState.tresBonne:
        return AppLocalizations.of(context)!.very_good;
      case HumeurState.bonne:
        return AppLocalizations.of(context)!.good;
      case HumeurState.pasEmotionParticuliere:
        return AppLocalizations.of(context)!.no_particular_emotion_balanced;
      case HumeurState.EnvieEtreTranquille:
        return AppLocalizations.of(context)!.desire_to_be_undisturbed;
      case HumeurState.humeurChangeante:
        return AppLocalizations.of(context)!.mood_swings;
      case HumeurState.nervositeIrritable:
        return AppLocalizations.of(context)!.nervous_irritable;
      case HumeurState.tristesse:
        return AppLocalizations.of(context)!.sadness_discouragement_hypersensitivity;
      case HumeurState.autre:
        return AppLocalizations.of(context)!.other;
      case HumeurState.none:
        return '';
    }
  }

  String toIconPath() {
    switch (this) {
      case HumeurState.tresBonne:
        return AssetsPath.icon_humeur_tres_bonne;
      case HumeurState.bonne:
        return AssetsPath.icon_humeur_bonne;
      case HumeurState.pasEmotionParticuliere:
        return AssetsPath.icon_humeur_pas_emotion_particuliere;
      case HumeurState.EnvieEtreTranquille:
        return AssetsPath.icon_humeur_envie_tranquille;
      case HumeurState.humeurChangeante:
        return AssetsPath.icon_humeur_changeante;
      case HumeurState.nervositeIrritable:
        return AssetsPath.icon_humeur_nervosite;
      case HumeurState.tristesse:
        return AssetsPath.icon_humeur_tristesse;
      case HumeurState.autre:
        return AssetsPath.icon_humeur_autre;
      case HumeurState.none:
        return AssetsPath.icon_vide;
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
