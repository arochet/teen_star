// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'observation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Observation {
  UniqueId get id => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  CouleurAnalyse? get couleur =>
      throw _privateConstructorUsedError; //Ce champ ne sert à rien, on prend la couleur générée en fonction des paramètres (mucus , sang , ...)
  CouleurAnalyse? get analyse => throw _privateConstructorUsedError;
  Sensation? get sensation => throw _privateConstructorUsedError;
  String? get sensationsAutre => throw _privateConstructorUsedError;
  Sang? get sang => throw _privateConstructorUsedError;
  Mucus? get mucus => throw _privateConstructorUsedError;
  String? get mucusAutre => throw _privateConstructorUsedError;
  List<Douleur>? get douleurs => throw _privateConstructorUsedError;
  String? get douleursAutre => throw _privateConstructorUsedError;
  List<Evenement>? get evenements => throw _privateConstructorUsedError;
  String? get evenementsAutre => throw _privateConstructorUsedError;
  double? get temperatureBasale => throw _privateConstructorUsedError;
  Humeur? get humeur => throw _privateConstructorUsedError;
  String? get humeurAutre => throw _privateConstructorUsedError;
  String? get notesConfidentielles => throw _privateConstructorUsedError;
  String? get commentaireAnimatrice => throw _privateConstructorUsedError;
  int? get marque => throw _privateConstructorUsedError; //Jour marqué 1,2,3
  bool? get jourFertile =>
      throw _privateConstructorUsedError; //Jour de certitude d'infertilité, sinon il y'a toujours le doute.
  bool? get enleverPointInterrogation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ObservationCopyWith<Observation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationCopyWith<$Res> {
  factory $ObservationCopyWith(
          Observation value, $Res Function(Observation) then) =
      _$ObservationCopyWithImpl<$Res, Observation>;
  @useResult
  $Res call(
      {UniqueId id,
      DateTime? date,
      CouleurAnalyse? couleur,
      CouleurAnalyse? analyse,
      Sensation? sensation,
      String? sensationsAutre,
      Sang? sang,
      Mucus? mucus,
      String? mucusAutre,
      List<Douleur>? douleurs,
      String? douleursAutre,
      List<Evenement>? evenements,
      String? evenementsAutre,
      double? temperatureBasale,
      Humeur? humeur,
      String? humeurAutre,
      String? notesConfidentielles,
      String? commentaireAnimatrice,
      int? marque,
      bool? jourFertile,
      bool? enleverPointInterrogation});
}

/// @nodoc
class _$ObservationCopyWithImpl<$Res, $Val extends Observation>
    implements $ObservationCopyWith<$Res> {
  _$ObservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = freezed,
    Object? couleur = freezed,
    Object? analyse = freezed,
    Object? sensation = freezed,
    Object? sensationsAutre = freezed,
    Object? sang = freezed,
    Object? mucus = freezed,
    Object? mucusAutre = freezed,
    Object? douleurs = freezed,
    Object? douleursAutre = freezed,
    Object? evenements = freezed,
    Object? evenementsAutre = freezed,
    Object? temperatureBasale = freezed,
    Object? humeur = freezed,
    Object? humeurAutre = freezed,
    Object? notesConfidentielles = freezed,
    Object? commentaireAnimatrice = freezed,
    Object? marque = freezed,
    Object? jourFertile = freezed,
    Object? enleverPointInterrogation = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      couleur: freezed == couleur
          ? _value.couleur
          : couleur // ignore: cast_nullable_to_non_nullable
              as CouleurAnalyse?,
      analyse: freezed == analyse
          ? _value.analyse
          : analyse // ignore: cast_nullable_to_non_nullable
              as CouleurAnalyse?,
      sensation: freezed == sensation
          ? _value.sensation
          : sensation // ignore: cast_nullable_to_non_nullable
              as Sensation?,
      sensationsAutre: freezed == sensationsAutre
          ? _value.sensationsAutre
          : sensationsAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      sang: freezed == sang
          ? _value.sang
          : sang // ignore: cast_nullable_to_non_nullable
              as Sang?,
      mucus: freezed == mucus
          ? _value.mucus
          : mucus // ignore: cast_nullable_to_non_nullable
              as Mucus?,
      mucusAutre: freezed == mucusAutre
          ? _value.mucusAutre
          : mucusAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      douleurs: freezed == douleurs
          ? _value.douleurs
          : douleurs // ignore: cast_nullable_to_non_nullable
              as List<Douleur>?,
      douleursAutre: freezed == douleursAutre
          ? _value.douleursAutre
          : douleursAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      evenements: freezed == evenements
          ? _value.evenements
          : evenements // ignore: cast_nullable_to_non_nullable
              as List<Evenement>?,
      evenementsAutre: freezed == evenementsAutre
          ? _value.evenementsAutre
          : evenementsAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      temperatureBasale: freezed == temperatureBasale
          ? _value.temperatureBasale
          : temperatureBasale // ignore: cast_nullable_to_non_nullable
              as double?,
      humeur: freezed == humeur
          ? _value.humeur
          : humeur // ignore: cast_nullable_to_non_nullable
              as Humeur?,
      humeurAutre: freezed == humeurAutre
          ? _value.humeurAutre
          : humeurAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      notesConfidentielles: freezed == notesConfidentielles
          ? _value.notesConfidentielles
          : notesConfidentielles // ignore: cast_nullable_to_non_nullable
              as String?,
      commentaireAnimatrice: freezed == commentaireAnimatrice
          ? _value.commentaireAnimatrice
          : commentaireAnimatrice // ignore: cast_nullable_to_non_nullable
              as String?,
      marque: freezed == marque
          ? _value.marque
          : marque // ignore: cast_nullable_to_non_nullable
              as int?,
      jourFertile: freezed == jourFertile
          ? _value.jourFertile
          : jourFertile // ignore: cast_nullable_to_non_nullable
              as bool?,
      enleverPointInterrogation: freezed == enleverPointInterrogation
          ? _value.enleverPointInterrogation
          : enleverPointInterrogation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObservationImplCopyWith<$Res>
    implements $ObservationCopyWith<$Res> {
  factory _$$ObservationImplCopyWith(
          _$ObservationImpl value, $Res Function(_$ObservationImpl) then) =
      __$$ObservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      DateTime? date,
      CouleurAnalyse? couleur,
      CouleurAnalyse? analyse,
      Sensation? sensation,
      String? sensationsAutre,
      Sang? sang,
      Mucus? mucus,
      String? mucusAutre,
      List<Douleur>? douleurs,
      String? douleursAutre,
      List<Evenement>? evenements,
      String? evenementsAutre,
      double? temperatureBasale,
      Humeur? humeur,
      String? humeurAutre,
      String? notesConfidentielles,
      String? commentaireAnimatrice,
      int? marque,
      bool? jourFertile,
      bool? enleverPointInterrogation});
}

/// @nodoc
class __$$ObservationImplCopyWithImpl<$Res>
    extends _$ObservationCopyWithImpl<$Res, _$ObservationImpl>
    implements _$$ObservationImplCopyWith<$Res> {
  __$$ObservationImplCopyWithImpl(
      _$ObservationImpl _value, $Res Function(_$ObservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = freezed,
    Object? couleur = freezed,
    Object? analyse = freezed,
    Object? sensation = freezed,
    Object? sensationsAutre = freezed,
    Object? sang = freezed,
    Object? mucus = freezed,
    Object? mucusAutre = freezed,
    Object? douleurs = freezed,
    Object? douleursAutre = freezed,
    Object? evenements = freezed,
    Object? evenementsAutre = freezed,
    Object? temperatureBasale = freezed,
    Object? humeur = freezed,
    Object? humeurAutre = freezed,
    Object? notesConfidentielles = freezed,
    Object? commentaireAnimatrice = freezed,
    Object? marque = freezed,
    Object? jourFertile = freezed,
    Object? enleverPointInterrogation = freezed,
  }) {
    return _then(_$ObservationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      couleur: freezed == couleur
          ? _value.couleur
          : couleur // ignore: cast_nullable_to_non_nullable
              as CouleurAnalyse?,
      analyse: freezed == analyse
          ? _value.analyse
          : analyse // ignore: cast_nullable_to_non_nullable
              as CouleurAnalyse?,
      sensation: freezed == sensation
          ? _value.sensation
          : sensation // ignore: cast_nullable_to_non_nullable
              as Sensation?,
      sensationsAutre: freezed == sensationsAutre
          ? _value.sensationsAutre
          : sensationsAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      sang: freezed == sang
          ? _value.sang
          : sang // ignore: cast_nullable_to_non_nullable
              as Sang?,
      mucus: freezed == mucus
          ? _value.mucus
          : mucus // ignore: cast_nullable_to_non_nullable
              as Mucus?,
      mucusAutre: freezed == mucusAutre
          ? _value.mucusAutre
          : mucusAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      douleurs: freezed == douleurs
          ? _value._douleurs
          : douleurs // ignore: cast_nullable_to_non_nullable
              as List<Douleur>?,
      douleursAutre: freezed == douleursAutre
          ? _value.douleursAutre
          : douleursAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      evenements: freezed == evenements
          ? _value._evenements
          : evenements // ignore: cast_nullable_to_non_nullable
              as List<Evenement>?,
      evenementsAutre: freezed == evenementsAutre
          ? _value.evenementsAutre
          : evenementsAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      temperatureBasale: freezed == temperatureBasale
          ? _value.temperatureBasale
          : temperatureBasale // ignore: cast_nullable_to_non_nullable
              as double?,
      humeur: freezed == humeur
          ? _value.humeur
          : humeur // ignore: cast_nullable_to_non_nullable
              as Humeur?,
      humeurAutre: freezed == humeurAutre
          ? _value.humeurAutre
          : humeurAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      notesConfidentielles: freezed == notesConfidentielles
          ? _value.notesConfidentielles
          : notesConfidentielles // ignore: cast_nullable_to_non_nullable
              as String?,
      commentaireAnimatrice: freezed == commentaireAnimatrice
          ? _value.commentaireAnimatrice
          : commentaireAnimatrice // ignore: cast_nullable_to_non_nullable
              as String?,
      marque: freezed == marque
          ? _value.marque
          : marque // ignore: cast_nullable_to_non_nullable
              as int?,
      jourFertile: freezed == jourFertile
          ? _value.jourFertile
          : jourFertile // ignore: cast_nullable_to_non_nullable
              as bool?,
      enleverPointInterrogation: freezed == enleverPointInterrogation
          ? _value.enleverPointInterrogation
          : enleverPointInterrogation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ObservationImpl extends _Observation {
  const _$ObservationImpl(
      {required this.id,
      required this.date,
      required this.couleur,
      required this.analyse,
      required this.sensation,
      required this.sensationsAutre,
      required this.sang,
      required this.mucus,
      required this.mucusAutre,
      required final List<Douleur>? douleurs,
      required this.douleursAutre,
      required final List<Evenement>? evenements,
      required this.evenementsAutre,
      required this.temperatureBasale,
      required this.humeur,
      required this.humeurAutre,
      required this.notesConfidentielles,
      required this.commentaireAnimatrice,
      required this.marque,
      required this.jourFertile,
      required this.enleverPointInterrogation})
      : _douleurs = douleurs,
        _evenements = evenements,
        super._();

  @override
  final UniqueId id;
  @override
  final DateTime? date;
  @override
  final CouleurAnalyse? couleur;
//Ce champ ne sert à rien, on prend la couleur générée en fonction des paramètres (mucus , sang , ...)
  @override
  final CouleurAnalyse? analyse;
  @override
  final Sensation? sensation;
  @override
  final String? sensationsAutre;
  @override
  final Sang? sang;
  @override
  final Mucus? mucus;
  @override
  final String? mucusAutre;
  final List<Douleur>? _douleurs;
  @override
  List<Douleur>? get douleurs {
    final value = _douleurs;
    if (value == null) return null;
    if (_douleurs is EqualUnmodifiableListView) return _douleurs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? douleursAutre;
  final List<Evenement>? _evenements;
  @override
  List<Evenement>? get evenements {
    final value = _evenements;
    if (value == null) return null;
    if (_evenements is EqualUnmodifiableListView) return _evenements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? evenementsAutre;
  @override
  final double? temperatureBasale;
  @override
  final Humeur? humeur;
  @override
  final String? humeurAutre;
  @override
  final String? notesConfidentielles;
  @override
  final String? commentaireAnimatrice;
  @override
  final int? marque;
//Jour marqué 1,2,3
  @override
  final bool? jourFertile;
//Jour de certitude d'infertilité, sinon il y'a toujours le doute.
  @override
  final bool? enleverPointInterrogation;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObservationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.couleur, couleur) || other.couleur == couleur) &&
            (identical(other.analyse, analyse) || other.analyse == analyse) &&
            (identical(other.sensation, sensation) ||
                other.sensation == sensation) &&
            (identical(other.sensationsAutre, sensationsAutre) ||
                other.sensationsAutre == sensationsAutre) &&
            (identical(other.sang, sang) || other.sang == sang) &&
            (identical(other.mucus, mucus) || other.mucus == mucus) &&
            (identical(other.mucusAutre, mucusAutre) ||
                other.mucusAutre == mucusAutre) &&
            const DeepCollectionEquality().equals(other._douleurs, _douleurs) &&
            (identical(other.douleursAutre, douleursAutre) ||
                other.douleursAutre == douleursAutre) &&
            const DeepCollectionEquality()
                .equals(other._evenements, _evenements) &&
            (identical(other.evenementsAutre, evenementsAutre) ||
                other.evenementsAutre == evenementsAutre) &&
            (identical(other.temperatureBasale, temperatureBasale) ||
                other.temperatureBasale == temperatureBasale) &&
            (identical(other.humeur, humeur) || other.humeur == humeur) &&
            (identical(other.humeurAutre, humeurAutre) ||
                other.humeurAutre == humeurAutre) &&
            (identical(other.notesConfidentielles, notesConfidentielles) ||
                other.notesConfidentielles == notesConfidentielles) &&
            (identical(other.commentaireAnimatrice, commentaireAnimatrice) ||
                other.commentaireAnimatrice == commentaireAnimatrice) &&
            (identical(other.marque, marque) || other.marque == marque) &&
            (identical(other.jourFertile, jourFertile) ||
                other.jourFertile == jourFertile) &&
            (identical(other.enleverPointInterrogation,
                    enleverPointInterrogation) ||
                other.enleverPointInterrogation == enleverPointInterrogation));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        date,
        couleur,
        analyse,
        sensation,
        sensationsAutre,
        sang,
        mucus,
        mucusAutre,
        const DeepCollectionEquality().hash(_douleurs),
        douleursAutre,
        const DeepCollectionEquality().hash(_evenements),
        evenementsAutre,
        temperatureBasale,
        humeur,
        humeurAutre,
        notesConfidentielles,
        commentaireAnimatrice,
        marque,
        jourFertile,
        enleverPointInterrogation
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObservationImplCopyWith<_$ObservationImpl> get copyWith =>
      __$$ObservationImplCopyWithImpl<_$ObservationImpl>(this, _$identity);
}

abstract class _Observation extends Observation {
  const factory _Observation(
      {required final UniqueId id,
      required final DateTime? date,
      required final CouleurAnalyse? couleur,
      required final CouleurAnalyse? analyse,
      required final Sensation? sensation,
      required final String? sensationsAutre,
      required final Sang? sang,
      required final Mucus? mucus,
      required final String? mucusAutre,
      required final List<Douleur>? douleurs,
      required final String? douleursAutre,
      required final List<Evenement>? evenements,
      required final String? evenementsAutre,
      required final double? temperatureBasale,
      required final Humeur? humeur,
      required final String? humeurAutre,
      required final String? notesConfidentielles,
      required final String? commentaireAnimatrice,
      required final int? marque,
      required final bool? jourFertile,
      required final bool? enleverPointInterrogation}) = _$ObservationImpl;
  const _Observation._() : super._();

  @override
  UniqueId get id;
  @override
  DateTime? get date;
  @override
  CouleurAnalyse? get couleur;
  @override //Ce champ ne sert à rien, on prend la couleur générée en fonction des paramètres (mucus , sang , ...)
  CouleurAnalyse? get analyse;
  @override
  Sensation? get sensation;
  @override
  String? get sensationsAutre;
  @override
  Sang? get sang;
  @override
  Mucus? get mucus;
  @override
  String? get mucusAutre;
  @override
  List<Douleur>? get douleurs;
  @override
  String? get douleursAutre;
  @override
  List<Evenement>? get evenements;
  @override
  String? get evenementsAutre;
  @override
  double? get temperatureBasale;
  @override
  Humeur? get humeur;
  @override
  String? get humeurAutre;
  @override
  String? get notesConfidentielles;
  @override
  String? get commentaireAnimatrice;
  @override
  int? get marque;
  @override //Jour marqué 1,2,3
  bool? get jourFertile;
  @override //Jour de certitude d'infertilité, sinon il y'a toujours le doute.
  bool? get enleverPointInterrogation;
  @override
  @JsonKey(ignore: true)
  _$$ObservationImplCopyWith<_$ObservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
