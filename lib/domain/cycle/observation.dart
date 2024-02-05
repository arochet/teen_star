import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/PRESENTATION/cycle/pdf/generate_cycle_pdf.dart';

import 'value_objects.dart';

part 'observation.freezed.dart';

@freezed
abstract class Observation with _$Observation {
  const Observation._();

  const factory Observation({
    required UniqueId id,
    required DateTime? date,
    required CouleurAnalyse?
        couleur, //Ce champ ne sert à rien, on prend la couleur générée en fonction des paramètres (mucus , sang , ...)
    required CouleurAnalyse? analyse,
    required Sensation? sensation,
    required String? sensationsAutre,
    required Sang? sang,
    required Mucus? mucus,
    required String? mucusAutre,
    required List<Douleur>? douleurs,
    required String? douleursAutre,
    required List<Evenement>? evenements,
    required String? evenementsAutre,
    required double? temperatureBasale,
    required Humeur? humeur,
    required String? humeurAutre,
    required String? notesConfidentielles,
    required String? commentaireAnimatrice,
    required int? marque, //Jour marqué 1,2,3
    required bool? jourFertile, //Jour de certitude d'infertilité, sinon il y'a toujours le doute.
    required bool? enleverPointInterrogation,
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
        evenementsAutre: '',
        temperatureBasale: 0,
        humeur: Humeur.init(),
        humeurAutre: '',
        notesConfidentielles: '',
        commentaireAnimatrice: '',
        marque: 0,
        jourFertile: true,
        enleverPointInterrogation: false,
      );

  factory Observation.none(DateTime date) => Observation(
        id: UniqueId(),
        date: date,
        couleur: null,
        analyse: null,
        sensation: null,
        sensationsAutre: null,
        sang: null,
        mucus: null,
        mucusAutre: null,
        douleurs: null,
        douleursAutre: null,
        evenements: null,
        evenementsAutre: null,
        temperatureBasale: null,
        humeur: null,
        humeurAutre: null,
        notesConfidentielles: null,
        commentaireAnimatrice: null,
        marque: null,
        jourFertile: null,
        enleverPointInterrogation: null,
      );

  bool get isNone =>
      couleur == null &&
      analyse == null &&
      sensation == null &&
      sensationsAutre == null &&
      sang == null &&
      mucus == null &&
      mucusAutre == null &&
      douleurs == null &&
      douleursAutre == null &&
      evenements == null &&
      temperatureBasale == null &&
      humeur == null &&
      humeurAutre == null &&
      notesConfidentielles == null &&
      commentaireAnimatrice == null &&
      marque == null &&
      jourFertile == null;

  CouleurAnalyseState get couleurGeneree {
    if (sang?.getOrCrash() == SangState.fluxPP) {
      return CouleurAnalyseState.rougePlusPlus;
    } else if (sang?.getOrCrash() == SangState.fluxP) {
      return CouleurAnalyseState.rougePlus;
    } else if (sang?.getOrCrash() == SangState.traces) {
      return CouleurAnalyseState.rougeClair;
    } else if (mucus?.getOrCrash() == MucusState.depotSecheBlancOuJaune &&
        sensation?.getOrCrash() == SensationState.sec) {
      return CouleurAnalyseState.none;
    } else if (sensation?.getOrCrash() == SensationState.humide ||
        sensation?.getOrCrash() == SensationState.mouille ||
        sensation?.getOrCrash() == SensationState.glissantLubrifie ||
        mucus?.getOrCrash() == MucusState.opaqueAvecTransparent_UnPeuEtirable ||
        mucus?.getOrCrash() == MucusState.nuageuxATransparent_Elastique ||
        mucus?.getOrCrash() == MucusState.transparentFilantOuTresFluide) {
      return CouleurAnalyseState.bleue;
    } else if (sensation?.getOrCrash() == SensationState.sec &&
        mucus?.getOrCrash() == MucusState.aucunMucusVisible &&
        sang?.getOrCrash() == SangState.rien) {
      return CouleurAnalyseState.brun;
    } else if (sensation?.getOrCrash() == SensationState.sec &&
        (mucus?.getOrCrash() == MucusState.opaqueBlancOuJaune ||
            mucus?.getOrCrash() == MucusState.depotSecheBlancOuJaune) &&
        sang?.getOrCrash() == SangState.rien) {
      return CouleurAnalyseState.jaune;
    } else {
      return CouleurAnalyseState.none;
    }
  }

  ///Pour le PDF, créer la cellule couleur
  CellPDFColor toCellColor() {
    return CellPDFColor(
      couleur: this.couleurGeneree.toColorPDF(),
      pointInterrogation: isPointInterrogation(false),
      chiffre: this.marque,
      hachure: false,
    ); //Cellule couleur
  }

  ///Pour le PDF, créer la cellule Analyse
  CellPDFColor toCellAnalyse(bool isJourSommet) {
    return CellPDFColor(
      couleur: this.analyse?.getOrCrash() == CouleurAnalyseState.none
          ? this.couleurGeneree.toColorPDF()
          : this.analyse?.getOrCrash().toColorPDF() ?? this.couleurGeneree.toColorPDF(),
      pointInterrogation: false,
      chiffre: this.marque,
      hachure: this.displayHachure,
      jourSommet: isJourSommet,
      troisPoints: isNone,
    ); //Cellule couleur
  }

  ///Est-ce qu'on affiche les hachures
  bool get displayHachure => this.jourFertile == false;

  ///Point d'interrogation -> Doute sur le renseignemnt de l'observation
  bool isPointInterrogation(bool analyse) {
    if (analyse)
      return (this.sensation?.getOrCrash() == SensationState.autre ||
              this.mucus?.getOrCrash() == MucusState.autre) &&
          this.enleverPointInterrogation != true;
    else
      return (this.sensation?.getOrCrash() == SensationState.autre ||
          this.mucus?.getOrCrash() == MucusState.autre);
  }

  //Overide toString
  @override
  String toString() {
    return 'Observation{id: $id, date: $date, couleur: ${couleur?.getOrCrash()}, analyse: ${analyse?.getOrCrash()}, sensation: ${sensation?.getOrCrash()}, sensationsAutre: $sensationsAutre, sang: ${sang?.getOrCrash()}, mucus: ${mucus?.getOrCrash()}, mucusAutre: $mucusAutre, douleurs: ${douleurs?.map((e) => e.getOrCrash())}, douleursAutre: $douleursAutre, evenements: ${evenements?.map((e) => e.getOrCrash())}, evenementsAutre: $evenementsAutre, temperatureBasale: $temperatureBasale, humeur: ${humeur?.getOrCrash()}, humeurAutre: $humeurAutre, notesConfidentielles: $notesConfidentielles, commentaireAnimatrice: $commentaireAnimatrice, marque: $marque, jourFertile: $jourFertile, enleverPointInterrogation: $enleverPointInterrogation}';
  }
}
