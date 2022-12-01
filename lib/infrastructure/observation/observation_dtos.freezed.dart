// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'observation_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ObservationDTO _$ObservationDTOFromJson(Map<String, dynamic> json) {
  return _ObservationDTO.fromJson(json);
}

/// @nodoc
mixin _$ObservationDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;
  String get couleur => throw _privateConstructorUsedError;
  String get analyse => throw _privateConstructorUsedError;
  String get sensation => throw _privateConstructorUsedError;
  String get sensationsAutre => throw _privateConstructorUsedError;
  String get sang => throw _privateConstructorUsedError;
  String get mucus => throw _privateConstructorUsedError;
  String get mucusAutre => throw _privateConstructorUsedError;
  String get douleurs => throw _privateConstructorUsedError;
  String get douleursAutre => throw _privateConstructorUsedError;
  String get evenements => throw _privateConstructorUsedError;
  int get temperatureBasale => throw _privateConstructorUsedError;
  String get humeur => throw _privateConstructorUsedError;
  String get humeurAutre => throw _privateConstructorUsedError;
  String get notesConfidentielles => throw _privateConstructorUsedError;
  String get commentaireAnimatrice => throw _privateConstructorUsedError;

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
      {@JsonKey(ignore: true) String? id,
      int date,
      String couleur,
      String analyse,
      String sensation,
      String sensationsAutre,
      String sang,
      String mucus,
      String mucusAutre,
      String douleurs,
      String douleursAutre,
      String evenements,
      int temperatureBasale,
      String humeur,
      String humeurAutre,
      String notesConfidentielles,
      String commentaireAnimatrice});
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
    Object? date = null,
    Object? couleur = null,
    Object? analyse = null,
    Object? sensation = null,
    Object? sensationsAutre = null,
    Object? sang = null,
    Object? mucus = null,
    Object? mucusAutre = null,
    Object? douleurs = null,
    Object? douleursAutre = null,
    Object? evenements = null,
    Object? temperatureBasale = null,
    Object? humeur = null,
    Object? humeurAutre = null,
    Object? notesConfidentielles = null,
    Object? commentaireAnimatrice = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      couleur: null == couleur
          ? _value.couleur
          : couleur // ignore: cast_nullable_to_non_nullable
              as String,
      analyse: null == analyse
          ? _value.analyse
          : analyse // ignore: cast_nullable_to_non_nullable
              as String,
      sensation: null == sensation
          ? _value.sensation
          : sensation // ignore: cast_nullable_to_non_nullable
              as String,
      sensationsAutre: null == sensationsAutre
          ? _value.sensationsAutre
          : sensationsAutre // ignore: cast_nullable_to_non_nullable
              as String,
      sang: null == sang
          ? _value.sang
          : sang // ignore: cast_nullable_to_non_nullable
              as String,
      mucus: null == mucus
          ? _value.mucus
          : mucus // ignore: cast_nullable_to_non_nullable
              as String,
      mucusAutre: null == mucusAutre
          ? _value.mucusAutre
          : mucusAutre // ignore: cast_nullable_to_non_nullable
              as String,
      douleurs: null == douleurs
          ? _value.douleurs
          : douleurs // ignore: cast_nullable_to_non_nullable
              as String,
      douleursAutre: null == douleursAutre
          ? _value.douleursAutre
          : douleursAutre // ignore: cast_nullable_to_non_nullable
              as String,
      evenements: null == evenements
          ? _value.evenements
          : evenements // ignore: cast_nullable_to_non_nullable
              as String,
      temperatureBasale: null == temperatureBasale
          ? _value.temperatureBasale
          : temperatureBasale // ignore: cast_nullable_to_non_nullable
              as int,
      humeur: null == humeur
          ? _value.humeur
          : humeur // ignore: cast_nullable_to_non_nullable
              as String,
      humeurAutre: null == humeurAutre
          ? _value.humeurAutre
          : humeurAutre // ignore: cast_nullable_to_non_nullable
              as String,
      notesConfidentielles: null == notesConfidentielles
          ? _value.notesConfidentielles
          : notesConfidentielles // ignore: cast_nullable_to_non_nullable
              as String,
      commentaireAnimatrice: null == commentaireAnimatrice
          ? _value.commentaireAnimatrice
          : commentaireAnimatrice // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ObservationDTOCopyWith<$Res>
    implements $ObservationDTOCopyWith<$Res> {
  factory _$$_ObservationDTOCopyWith(
          _$_ObservationDTO value, $Res Function(_$_ObservationDTO) then) =
      __$$_ObservationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      int date,
      String couleur,
      String analyse,
      String sensation,
      String sensationsAutre,
      String sang,
      String mucus,
      String mucusAutre,
      String douleurs,
      String douleursAutre,
      String evenements,
      int temperatureBasale,
      String humeur,
      String humeurAutre,
      String notesConfidentielles,
      String commentaireAnimatrice});
}

/// @nodoc
class __$$_ObservationDTOCopyWithImpl<$Res>
    extends _$ObservationDTOCopyWithImpl<$Res, _$_ObservationDTO>
    implements _$$_ObservationDTOCopyWith<$Res> {
  __$$_ObservationDTOCopyWithImpl(
      _$_ObservationDTO _value, $Res Function(_$_ObservationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? couleur = null,
    Object? analyse = null,
    Object? sensation = null,
    Object? sensationsAutre = null,
    Object? sang = null,
    Object? mucus = null,
    Object? mucusAutre = null,
    Object? douleurs = null,
    Object? douleursAutre = null,
    Object? evenements = null,
    Object? temperatureBasale = null,
    Object? humeur = null,
    Object? humeurAutre = null,
    Object? notesConfidentielles = null,
    Object? commentaireAnimatrice = null,
  }) {
    return _then(_$_ObservationDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      couleur: null == couleur
          ? _value.couleur
          : couleur // ignore: cast_nullable_to_non_nullable
              as String,
      analyse: null == analyse
          ? _value.analyse
          : analyse // ignore: cast_nullable_to_non_nullable
              as String,
      sensation: null == sensation
          ? _value.sensation
          : sensation // ignore: cast_nullable_to_non_nullable
              as String,
      sensationsAutre: null == sensationsAutre
          ? _value.sensationsAutre
          : sensationsAutre // ignore: cast_nullable_to_non_nullable
              as String,
      sang: null == sang
          ? _value.sang
          : sang // ignore: cast_nullable_to_non_nullable
              as String,
      mucus: null == mucus
          ? _value.mucus
          : mucus // ignore: cast_nullable_to_non_nullable
              as String,
      mucusAutre: null == mucusAutre
          ? _value.mucusAutre
          : mucusAutre // ignore: cast_nullable_to_non_nullable
              as String,
      douleurs: null == douleurs
          ? _value.douleurs
          : douleurs // ignore: cast_nullable_to_non_nullable
              as String,
      douleursAutre: null == douleursAutre
          ? _value.douleursAutre
          : douleursAutre // ignore: cast_nullable_to_non_nullable
              as String,
      evenements: null == evenements
          ? _value.evenements
          : evenements // ignore: cast_nullable_to_non_nullable
              as String,
      temperatureBasale: null == temperatureBasale
          ? _value.temperatureBasale
          : temperatureBasale // ignore: cast_nullable_to_non_nullable
              as int,
      humeur: null == humeur
          ? _value.humeur
          : humeur // ignore: cast_nullable_to_non_nullable
              as String,
      humeurAutre: null == humeurAutre
          ? _value.humeurAutre
          : humeurAutre // ignore: cast_nullable_to_non_nullable
              as String,
      notesConfidentielles: null == notesConfidentielles
          ? _value.notesConfidentielles
          : notesConfidentielles // ignore: cast_nullable_to_non_nullable
              as String,
      commentaireAnimatrice: null == commentaireAnimatrice
          ? _value.commentaireAnimatrice
          : commentaireAnimatrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ObservationDTO extends _ObservationDTO {
  const _$_ObservationDTO(
      {@JsonKey(ignore: true) this.id,
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
      required this.temperatureBasale,
      required this.humeur,
      required this.humeurAutre,
      required this.notesConfidentielles,
      required this.commentaireAnimatrice})
      : super._();

  factory _$_ObservationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ObservationDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final int date;
  @override
  final String couleur;
  @override
  final String analyse;
  @override
  final String sensation;
  @override
  final String sensationsAutre;
  @override
  final String sang;
  @override
  final String mucus;
  @override
  final String mucusAutre;
  @override
  final String douleurs;
  @override
  final String douleursAutre;
  @override
  final String evenements;
  @override
  final int temperatureBasale;
  @override
  final String humeur;
  @override
  final String humeurAutre;
  @override
  final String notesConfidentielles;
  @override
  final String commentaireAnimatrice;

  @override
  String toString() {
    return 'ObservationDTO(id: $id, date: $date, couleur: $couleur, analyse: $analyse, sensation: $sensation, sensationsAutre: $sensationsAutre, sang: $sang, mucus: $mucus, mucusAutre: $mucusAutre, douleurs: $douleurs, douleursAutre: $douleursAutre, evenements: $evenements, temperatureBasale: $temperatureBasale, humeur: $humeur, humeurAutre: $humeurAutre, notesConfidentielles: $notesConfidentielles, commentaireAnimatrice: $commentaireAnimatrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ObservationDTO &&
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
            (identical(other.temperatureBasale, temperatureBasale) ||
                other.temperatureBasale == temperatureBasale) &&
            (identical(other.humeur, humeur) || other.humeur == humeur) &&
            (identical(other.humeurAutre, humeurAutre) ||
                other.humeurAutre == humeurAutre) &&
            (identical(other.notesConfidentielles, notesConfidentielles) ||
                other.notesConfidentielles == notesConfidentielles) &&
            (identical(other.commentaireAnimatrice, commentaireAnimatrice) ||
                other.commentaireAnimatrice == commentaireAnimatrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
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
      temperatureBasale,
      humeur,
      humeurAutre,
      notesConfidentielles,
      commentaireAnimatrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ObservationDTOCopyWith<_$_ObservationDTO> get copyWith =>
      __$$_ObservationDTOCopyWithImpl<_$_ObservationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ObservationDTOToJson(
      this,
    );
  }
}

abstract class _ObservationDTO extends ObservationDTO {
  const factory _ObservationDTO(
      {@JsonKey(ignore: true) final String? id,
      required final int date,
      required final String couleur,
      required final String analyse,
      required final String sensation,
      required final String sensationsAutre,
      required final String sang,
      required final String mucus,
      required final String mucusAutre,
      required final String douleurs,
      required final String douleursAutre,
      required final String evenements,
      required final int temperatureBasale,
      required final String humeur,
      required final String humeurAutre,
      required final String notesConfidentielles,
      required final String commentaireAnimatrice}) = _$_ObservationDTO;
  const _ObservationDTO._() : super._();

  factory _ObservationDTO.fromJson(Map<String, dynamic> json) =
      _$_ObservationDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  int get date;
  @override
  String get couleur;
  @override
  String get analyse;
  @override
  String get sensation;
  @override
  String get sensationsAutre;
  @override
  String get sang;
  @override
  String get mucus;
  @override
  String get mucusAutre;
  @override
  String get douleurs;
  @override
  String get douleursAutre;
  @override
  String get evenements;
  @override
  int get temperatureBasale;
  @override
  String get humeur;
  @override
  String get humeurAutre;
  @override
  String get notesConfidentielles;
  @override
  String get commentaireAnimatrice;
  @override
  @JsonKey(ignore: true)
  _$$_ObservationDTOCopyWith<_$_ObservationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
