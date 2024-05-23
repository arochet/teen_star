// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'observation_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ObservationDTO _$ObservationDTOFromJson(Map<String, dynamic> json) {
  return _ObservationDTO.fromJson(json);
}

/// @nodoc
mixin _$ObservationDTO {
  int? get id => throw _privateConstructorUsedError;
  int? get date => throw _privateConstructorUsedError;
  String? get couleur => throw _privateConstructorUsedError;
  String? get analyse => throw _privateConstructorUsedError;
  String? get sensation => throw _privateConstructorUsedError;
  String? get sensationsAutre => throw _privateConstructorUsedError;
  String? get sang => throw _privateConstructorUsedError;
  String? get mucus => throw _privateConstructorUsedError;
  String? get mucusAutre => throw _privateConstructorUsedError;
  String get douleurs => throw _privateConstructorUsedError;
  String? get douleursAutre => throw _privateConstructorUsedError;
  String get evenements => throw _privateConstructorUsedError;
  String? get evenementsAutre => throw _privateConstructorUsedError;
  double? get temperatureBasale => throw _privateConstructorUsedError;
  String? get humeur => throw _privateConstructorUsedError;
  String? get humeurAutre => throw _privateConstructorUsedError;
  String? get notesConfidentielles => throw _privateConstructorUsedError;
  String? get commentaireAnimatrice => throw _privateConstructorUsedError;
  int? get marque => throw _privateConstructorUsedError;
  int? get jourFertile => throw _privateConstructorUsedError;
  int? get idCycle => throw _privateConstructorUsedError;
  int? get enleverPointInterrogation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationDTOCopyWith<ObservationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationDTOCopyWith<$Res> {
  factory $ObservationDTOCopyWith(
          ObservationDTO value, $Res Function(ObservationDTO) then) =
      _$ObservationDTOCopyWithImpl<$Res, ObservationDTO>;
  @useResult
  $Res call(
      {int? id,
      int? date,
      String? couleur,
      String? analyse,
      String? sensation,
      String? sensationsAutre,
      String? sang,
      String? mucus,
      String? mucusAutre,
      String douleurs,
      String? douleursAutre,
      String evenements,
      String? evenementsAutre,
      double? temperatureBasale,
      String? humeur,
      String? humeurAutre,
      String? notesConfidentielles,
      String? commentaireAnimatrice,
      int? marque,
      int? jourFertile,
      int? idCycle,
      int? enleverPointInterrogation});
}

/// @nodoc
class _$ObservationDTOCopyWithImpl<$Res, $Val extends ObservationDTO>
    implements $ObservationDTOCopyWith<$Res> {
  _$ObservationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? couleur = freezed,
    Object? analyse = freezed,
    Object? sensation = freezed,
    Object? sensationsAutre = freezed,
    Object? sang = freezed,
    Object? mucus = freezed,
    Object? mucusAutre = freezed,
    Object? douleurs = null,
    Object? douleursAutre = freezed,
    Object? evenements = null,
    Object? evenementsAutre = freezed,
    Object? temperatureBasale = freezed,
    Object? humeur = freezed,
    Object? humeurAutre = freezed,
    Object? notesConfidentielles = freezed,
    Object? commentaireAnimatrice = freezed,
    Object? marque = freezed,
    Object? jourFertile = freezed,
    Object? idCycle = freezed,
    Object? enleverPointInterrogation = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int?,
      couleur: freezed == couleur
          ? _value.couleur
          : couleur // ignore: cast_nullable_to_non_nullable
              as String?,
      analyse: freezed == analyse
          ? _value.analyse
          : analyse // ignore: cast_nullable_to_non_nullable
              as String?,
      sensation: freezed == sensation
          ? _value.sensation
          : sensation // ignore: cast_nullable_to_non_nullable
              as String?,
      sensationsAutre: freezed == sensationsAutre
          ? _value.sensationsAutre
          : sensationsAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      sang: freezed == sang
          ? _value.sang
          : sang // ignore: cast_nullable_to_non_nullable
              as String?,
      mucus: freezed == mucus
          ? _value.mucus
          : mucus // ignore: cast_nullable_to_non_nullable
              as String?,
      mucusAutre: freezed == mucusAutre
          ? _value.mucusAutre
          : mucusAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      douleurs: null == douleurs
          ? _value.douleurs
          : douleurs // ignore: cast_nullable_to_non_nullable
              as String,
      douleursAutre: freezed == douleursAutre
          ? _value.douleursAutre
          : douleursAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      evenements: null == evenements
          ? _value.evenements
          : evenements // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String?,
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
              as int?,
      idCycle: freezed == idCycle
          ? _value.idCycle
          : idCycle // ignore: cast_nullable_to_non_nullable
              as int?,
      enleverPointInterrogation: freezed == enleverPointInterrogation
          ? _value.enleverPointInterrogation
          : enleverPointInterrogation // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObservationDTOImplCopyWith<$Res>
    implements $ObservationDTOCopyWith<$Res> {
  factory _$$ObservationDTOImplCopyWith(_$ObservationDTOImpl value,
          $Res Function(_$ObservationDTOImpl) then) =
      __$$ObservationDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? date,
      String? couleur,
      String? analyse,
      String? sensation,
      String? sensationsAutre,
      String? sang,
      String? mucus,
      String? mucusAutre,
      String douleurs,
      String? douleursAutre,
      String evenements,
      String? evenementsAutre,
      double? temperatureBasale,
      String? humeur,
      String? humeurAutre,
      String? notesConfidentielles,
      String? commentaireAnimatrice,
      int? marque,
      int? jourFertile,
      int? idCycle,
      int? enleverPointInterrogation});
}

/// @nodoc
class __$$ObservationDTOImplCopyWithImpl<$Res>
    extends _$ObservationDTOCopyWithImpl<$Res, _$ObservationDTOImpl>
    implements _$$ObservationDTOImplCopyWith<$Res> {
  __$$ObservationDTOImplCopyWithImpl(
      _$ObservationDTOImpl _value, $Res Function(_$ObservationDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? couleur = freezed,
    Object? analyse = freezed,
    Object? sensation = freezed,
    Object? sensationsAutre = freezed,
    Object? sang = freezed,
    Object? mucus = freezed,
    Object? mucusAutre = freezed,
    Object? douleurs = null,
    Object? douleursAutre = freezed,
    Object? evenements = null,
    Object? evenementsAutre = freezed,
    Object? temperatureBasale = freezed,
    Object? humeur = freezed,
    Object? humeurAutre = freezed,
    Object? notesConfidentielles = freezed,
    Object? commentaireAnimatrice = freezed,
    Object? marque = freezed,
    Object? jourFertile = freezed,
    Object? idCycle = freezed,
    Object? enleverPointInterrogation = freezed,
  }) {
    return _then(_$ObservationDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int?,
      couleur: freezed == couleur
          ? _value.couleur
          : couleur // ignore: cast_nullable_to_non_nullable
              as String?,
      analyse: freezed == analyse
          ? _value.analyse
          : analyse // ignore: cast_nullable_to_non_nullable
              as String?,
      sensation: freezed == sensation
          ? _value.sensation
          : sensation // ignore: cast_nullable_to_non_nullable
              as String?,
      sensationsAutre: freezed == sensationsAutre
          ? _value.sensationsAutre
          : sensationsAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      sang: freezed == sang
          ? _value.sang
          : sang // ignore: cast_nullable_to_non_nullable
              as String?,
      mucus: freezed == mucus
          ? _value.mucus
          : mucus // ignore: cast_nullable_to_non_nullable
              as String?,
      mucusAutre: freezed == mucusAutre
          ? _value.mucusAutre
          : mucusAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      douleurs: null == douleurs
          ? _value.douleurs
          : douleurs // ignore: cast_nullable_to_non_nullable
              as String,
      douleursAutre: freezed == douleursAutre
          ? _value.douleursAutre
          : douleursAutre // ignore: cast_nullable_to_non_nullable
              as String?,
      evenements: null == evenements
          ? _value.evenements
          : evenements // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String?,
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
              as int?,
      idCycle: freezed == idCycle
          ? _value.idCycle
          : idCycle // ignore: cast_nullable_to_non_nullable
              as int?,
      enleverPointInterrogation: freezed == enleverPointInterrogation
          ? _value.enleverPointInterrogation
          : enleverPointInterrogation // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObservationDTOImpl extends _ObservationDTO {
  const _$ObservationDTOImpl(
      {required this.id,
      required this.date,
      required this.couleur,
      required this.analyse,
      required this.sensation,
      required this.sensationsAutre,
      required this.sang,
      required this.mucus,
      required this.mucusAutre,
      required this.douleurs,
      required this.douleursAutre,
      required this.evenements,
      required this.evenementsAutre,
      required this.temperatureBasale,
      required this.humeur,
      required this.humeurAutre,
      required this.notesConfidentielles,
      required this.commentaireAnimatrice,
      required this.marque,
      required this.jourFertile,
      required this.idCycle,
      required this.enleverPointInterrogation})
      : super._();

  factory _$ObservationDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObservationDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final int? date;
  @override
  final String? couleur;
  @override
  final String? analyse;
  @override
  final String? sensation;
  @override
  final String? sensationsAutre;
  @override
  final String? sang;
  @override
  final String? mucus;
  @override
  final String? mucusAutre;
  @override
  final String douleurs;
  @override
  final String? douleursAutre;
  @override
  final String evenements;
  @override
  final String? evenementsAutre;
  @override
  final double? temperatureBasale;
  @override
  final String? humeur;
  @override
  final String? humeurAutre;
  @override
  final String? notesConfidentielles;
  @override
  final String? commentaireAnimatrice;
  @override
  final int? marque;
  @override
  final int? jourFertile;
  @override
  final int? idCycle;
  @override
  final int? enleverPointInterrogation;

  @override
  String toString() {
    return 'ObservationDTO(id: $id, date: $date, couleur: $couleur, analyse: $analyse, sensation: $sensation, sensationsAutre: $sensationsAutre, sang: $sang, mucus: $mucus, mucusAutre: $mucusAutre, douleurs: $douleurs, douleursAutre: $douleursAutre, evenements: $evenements, evenementsAutre: $evenementsAutre, temperatureBasale: $temperatureBasale, humeur: $humeur, humeurAutre: $humeurAutre, notesConfidentielles: $notesConfidentielles, commentaireAnimatrice: $commentaireAnimatrice, marque: $marque, jourFertile: $jourFertile, idCycle: $idCycle, enleverPointInterrogation: $enleverPointInterrogation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObservationDTOImpl &&
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
            (identical(other.douleurs, douleurs) ||
                other.douleurs == douleurs) &&
            (identical(other.douleursAutre, douleursAutre) ||
                other.douleursAutre == douleursAutre) &&
            (identical(other.evenements, evenements) ||
                other.evenements == evenements) &&
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
            (identical(other.idCycle, idCycle) || other.idCycle == idCycle) &&
            (identical(other.enleverPointInterrogation,
                    enleverPointInterrogation) ||
                other.enleverPointInterrogation == enleverPointInterrogation));
  }

  @JsonKey(ignore: true)
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
        douleurs,
        douleursAutre,
        evenements,
        evenementsAutre,
        temperatureBasale,
        humeur,
        humeurAutre,
        notesConfidentielles,
        commentaireAnimatrice,
        marque,
        jourFertile,
        idCycle,
        enleverPointInterrogation
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObservationDTOImplCopyWith<_$ObservationDTOImpl> get copyWith =>
      __$$ObservationDTOImplCopyWithImpl<_$ObservationDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObservationDTOImplToJson(
      this,
    );
  }
}

abstract class _ObservationDTO extends ObservationDTO {
  const factory _ObservationDTO(
      {required final int? id,
      required final int? date,
      required final String? couleur,
      required final String? analyse,
      required final String? sensation,
      required final String? sensationsAutre,
      required final String? sang,
      required final String? mucus,
      required final String? mucusAutre,
      required final String douleurs,
      required final String? douleursAutre,
      required final String evenements,
      required final String? evenementsAutre,
      required final double? temperatureBasale,
      required final String? humeur,
      required final String? humeurAutre,
      required final String? notesConfidentielles,
      required final String? commentaireAnimatrice,
      required final int? marque,
      required final int? jourFertile,
      required final int? idCycle,
      required final int? enleverPointInterrogation}) = _$ObservationDTOImpl;
  const _ObservationDTO._() : super._();

  factory _ObservationDTO.fromJson(Map<String, dynamic> json) =
      _$ObservationDTOImpl.fromJson;

  @override
  int? get id;
  @override
  int? get date;
  @override
  String? get couleur;
  @override
  String? get analyse;
  @override
  String? get sensation;
  @override
  String? get sensationsAutre;
  @override
  String? get sang;
  @override
  String? get mucus;
  @override
  String? get mucusAutre;
  @override
  String get douleurs;
  @override
  String? get douleursAutre;
  @override
  String get evenements;
  @override
  String? get evenementsAutre;
  @override
  double? get temperatureBasale;
  @override
  String? get humeur;
  @override
  String? get humeurAutre;
  @override
  String? get notesConfidentielles;
  @override
  String? get commentaireAnimatrice;
  @override
  int? get marque;
  @override
  int? get jourFertile;
  @override
  int? get idCycle;
  @override
  int? get enleverPointInterrogation;
  @override
  @JsonKey(ignore: true)
  _$$ObservationDTOImplCopyWith<_$ObservationDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
