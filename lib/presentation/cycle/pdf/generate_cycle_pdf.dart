import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io' show Platform;

generatePDF(UserData? userData, List<Cycle> listCycles, Password password, BuildContext context) async {
  //VERIFICATION DES PERMISSIONS !
  PermissionStatus status = await Permission.storage.status;

  if (status.isDenied) {
    final permission = await Permission.storage.request();

    if (permission.isDenied) {
      return;
    }
  }

  final PdfDocument pdf = PdfDocument();
  header(pdf, userData, listCycles, context);

  //CHARGEMENT LISTE DES ICONES
  Map<SangState, PdfBitmap> listImageSang = {};
  for (var sang in SangState.values) {
    listImageSang[sang] = PdfBitmap((await rootBundle.load(sang.toIconPath())).buffer.asUint8List());
  }

  Map<MucusState, PdfBitmap> listImageMucus = {};
  for (var mucus in MucusState.values) {
    listImageMucus[mucus] = PdfBitmap((await rootBundle.load(mucus.toIconPath())).buffer.asUint8List());
  }

  Map<EvenementState, PdfBitmap> listImageEvenement = {};
  for (var evenement in EvenementState.values) {
    listImageEvenement[evenement] =
        PdfBitmap((await rootBundle.load(evenement.toIconPath())).buffer.asUint8List());
  }

  Map<HumeurState, PdfBitmap> listImageHumeur = {};
  for (var humeur in HumeurState.values) {
    listImageHumeur[humeur] = PdfBitmap((await rootBundle.load(humeur.toIconPath())).buffer.asUint8List());
  }

  PdfBitmap imgHachurage =
      PdfBitmap((await rootBundle.load(AssetsPath.icon_hachurage_noir)).buffer.asUint8List());
  PdfBitmap imgJourSommet =
      PdfBitmap((await rootBundle.load(AssetsPath.icon_fleur_sommet)).buffer.asUint8List());

  //Entete du tableau
  final List<CellHeader> tabTitleCycle = [
    CellHeader(AppLocalizations.of(context)!.day, width: 35),
    CellHeader(AppLocalizations.of(context)!.date, width: 45),
    CellHeader(AppLocalizations.of(context)!.colour),
    CellHeader(AppLocalizations.of(context)!.analyse),
    CellHeader(AppLocalizations.of(context)!.sensation),
    CellHeader(AppLocalizations.of(context)!.blood),
    CellHeader(AppLocalizations.of(context)!.mucus),
    CellHeader(AppLocalizations.of(context)!.mood),
    CellHeader(AppLocalizations.of(context)!.temperature),
    CellHeader(AppLocalizations.of(context)!.event, width: 170),
  ];

  final List<CellHeader> tabTitleCycleCommentaire = [
    CellHeader(AppLocalizations.of(context)!.day, width: 35),
    CellHeader(AppLocalizations.of(context)!.date, width: 45),
    CellHeader(AppLocalizations.of(context)!.comments),
  ];

  //IMAGE
  final PdfBitmap image = PdfBitmap(
    (await rootBundle.load(AssetsPath.icon_humeur_pas_emotion_particuliere)).buffer.asUint8List(),
  );

  //POUR CHAQUE CYCLE
  for (Cycle cycle in listCycles) {
    PdfPage page = pdf.pages.add();

    //Entete du text Cycle
    PdfTextElement textElement = PdfTextElement(
        text: '${AppLocalizations.of(context)!.cycle} ${cycle.id.getOrCrash()}',
        font: PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfBrushes.black);

    PdfLayoutResult? layoutResult = textElement.draw(
        page: page, bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, page.getClientSize().height))!;

    DateTime? datePremierJourCycle = cycle.getDateObservationFirstDay();

    //TABLEAU CYCLE
    layoutResult = tableauCycle(
      page: page,
      tabTitleHeader: tabTitleCycle,
      data: cycle.getObservationsWithEmptyDays().map((Observation observation) {
        String evenements = (observation.evenements
                    ?.map<String>((evenement) => evenement.getOrCrash().toDisplayShort())
                    .toList() ??
                [])
            .join(' ');
        String douleurs = (observation.douleurs
                    ?.map<String>((douleur) => douleur.getOrCrash().toDisplayShort(context))
                    .toList() ??
                [])
            .join(' ');
        return !observation.isNone
            ? <_Cell>[
                _CellText(
                    '${AppLocalizations.of(context)!.d_day}${cycle.getDayOfObservation(observation, datePremierJourCycle)}'),
                _CellText(AppDateUtils.formatDate(observation.date)),
                observation.toCellColor(), //Cellule couleur
                observation.toCellAnalyse(cycle.isJourneeSoleil(observation)), //Cellule analyse
                _CellIcon(
                    observation.sensation?.getOrCrash().toDisplayShort(context) ?? ''), //Cellule sensation
                _CellImage(listImageSang[observation.sang?.getOrCrash()]!), //Cellule sang
                _CellImage(listImageMucus[observation.mucus?.getOrCrash()]!), //Cellule mucus
                _CellImage(listImageHumeur[observation.humeur?.getOrCrash()]!), //Cellule humeur
                _CellText('${observation.temperatureBasale ?? ''}'), //Cellule temperature
                _CellText('$douleurs $evenements'), //Cellule evenement
              ]
            :
            //Ligne Vide
            <_Cell>[
                _CellText(
                    '${AppLocalizations.of(context)!.d_day}${cycle.getDayOfObservation(observation, datePremierJourCycle)}'),
                _CellNone(),
                _CellNone(),
                _CellNone(),
                _CellNone(),
                _CellNone(),
                _CellNone(),
                _CellNone(),
                _CellNone(),
                _CellNone(),
              ];
      }).toList(),
      iconEmpty: listImageMucus[MucusState.none]!,
      imgHachurage: imgHachurage,
      imgJourSommet: imgJourSommet,
      layout: layoutResult,
    );

    //PAGE COMMENTAIRES
    page = pdf.pages.add();
    textElement = PdfTextElement(
        text: '${AppLocalizations.of(context)!.cycle_comments} ${cycle.id.getOrCrash()}',
        font: PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.black);
    layoutResult = textElement.draw(
        page: page, bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, page.getClientSize().height))!;

    //TABLEAU COMMENTAIRES
    tableauCycle(
        page: page,
        tabTitleHeader: tabTitleCycleCommentaire,
        data: cycle.observations
            .map((Observation observation) => <_Cell>[
                  _CellText(
                      '${AppLocalizations.of(context)!.d_day_1_etc}${cycle.getDayOfObservation(observation, datePremierJourCycle)}'),
                  _CellText(AppDateUtils.formatDate(observation.date)),
                  _CellText(
                      '${observation.commentaireAnimatrice ?? '-'}/${observation.sensationsAutre ?? '-'}/${observation.mucusAutre ?? '-'}/${observation.douleursAutre ?? '-'}/${observation.humeurAutre ?? '-'}/${observation.evenementsAutre ?? '-'}/${observation.notesConfidentielles != null && observation.notesConfidentielles!.length > 1 ? AppLocalizations.of(context)!.notes_confidential : ''}'),
                ])
            .toList(),
        iconEmpty: listImageMucus[MucusState.none]!,
        imgHachurage: imgHachurage,
        imgJourSommet: imgJourSommet,
        layout: layoutResult);
  }

  //PAGE HISTORIQUE
  PdfPage page = pdf.pages.add();
  PdfTextElement textElement = PdfTextElement(
      text: AppLocalizations.of(context)!.history,
      font: PdfStandardFont(PdfFontFamily.helvetica, 16),
      brush: PdfBrushes.black);
  PdfLayoutResult layoutResult = textElement.draw(
      page: page, bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, page.getClientSize().height))!;
  List<CellHeader> headerHistorique = [
    CellHeader(AppLocalizations.of(context)!.day, width: 30),
    ...listCycles.map((Cycle cycle) => CellHeader('${cycle.id.getOrCrash()}', width: 32)).toList()
  ];

  int maxRow = 0;
  List<List<Observation>> observations = [];
  for (int i = 0; i < listCycles.length; i++ /* Cycle cycle in listCycles */) {
    observations.add(listCycles[i].getObservationsWithEmptyDays());
    if (observations[i].length > maxRow) {
      maxRow = observations[i].length;
    }
  }

  //Données du tableau de la page historique
  List<List<_Cell>> data = [];
  for (int u = 0; u < maxRow; u++) {
    List<_Cell> day = [_CellText('${AppLocalizations.of(context)!.d_day}${u + 1}')];
    for (int i = 0; i < observations.length; i++) {
      if (u < observations[i].length) {
        final obs = observations[i][u];
        final couleurAnalyse = obs.analyse?.getOrCrash();
        day.add(obs.toCellAnalyse(listCycles[i].isJourneeSoleil(obs)));
      } else {
        day.add(_CellNone());
      }
    }

    data.add(day);
  }

  //TABLEAU HISTORIQUE
  tableauCycle(
      page: page,
      tabTitleHeader: headerHistorique,
      data: data,
      iconEmpty: listImageMucus[MucusState.none]!,
      imgHachurage: imgHachurage,
      imgJourSommet: imgJourSommet,
      layout: layoutResult!,
      isHistorique: true);

  //CREATION DU FICHIER
  String nomFichier =
      '${userData!.userName.getOrCrash()}-${AppDateUtils.formatDate(userData?.dateNaissance, 'dd_MM_yyyy')}-${userData.anneePremiereRegle}-Cycle${listCycles.first.id.getOrCrash()}_${AppLocalizations.of(context)!.vers}_${listCycles.last.id.getOrCrash()}';
  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  PdfSecurity security = pdf.security;
  security.algorithm = PdfEncryptionAlgorithm.rc4x128Bit;
  if (password.getOrCrash().length > 1) {
    security.userPassword = password.getOrCrash(); //Set user password
  }
  String path = '';
  if (Platform.isAndroid) {
    path = '/storage/emulated/0/Download/$nomFichier.pdf';
  } else {
    path = appDocDirectory.path + '/$nomFichier.pdf';
  }

  final File file = File(path);

  await file.writeAsBytes(await pdf.save());

  await OpenFilex.open(path);
  pdf.dispose();
}

header(PdfDocument pdf, UserData? userData, List<Cycle> listCycle, BuildContext context) {
  final PdfPageTemplateElement headerTemplate = PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 500, 60));
  //Résumé / Analyse du cycle 1 au cycle 2
  headerTemplate.graphics.drawString(
      listCycle.length > 1
          ? '${AppLocalizations.of(context)!.summary_analysis_of_cycle_} ${listCycle.first.id.getOrCrash()} ${AppLocalizations.of(context)!.to_cycle} ${listCycle.last.id.getOrCrash()}'
          : '${AppLocalizations.of(context)!.summary_analysis_of_cycle_} ${listCycle.first.id.getOrCrash()}',
      PdfStandardFont(PdfFontFamily.helvetica, 16, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(0, 15, 500, 20));
  //Nom - Age - PR 2001
  headerTemplate.graphics.drawString(
      '${userData?.userName.getOrCrash()} - ${userData?.dateNaissance?.year} - ${AppLocalizations.of(context)!.premier_regle} ${userData?.anneePremiereRegle}',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTWH(0, 35, 500, 20));
  pdf.template.top = headerTemplate;
}

//TABLEAU CYCLE
PdfLayoutResult? tableauCycle({
  required PdfPage page,
  required List<CellHeader> tabTitleHeader,
  required List<List<_Cell>> data,
  required PdfBitmap iconEmpty,
  required PdfBitmap imgHachurage,
  required PdfBitmap imgJourSommet,
  required PdfLayoutResult layout,
  bool isHistorique = false,
}) {
  final PdfGrid grid = PdfGrid();
  grid.columns.add(count: tabTitleHeader.length); // Specify the grid column count.

  //WIDTH COLUMNS
  for (int i = 0; i < tabTitleHeader.length; i++) {
    if (tabTitleHeader[i].width != null) {
      grid.columns[i].width = tabTitleHeader[i].width!;
    }
  }

  //HEADER
  final PdfGridRow headerRow = grid.headers.add(1)[0];
  for (int i = 0; i < tabTitleHeader.length; i++) {
    headerRow.cells[i].value = tabTitleHeader[i].text;
    headerRow.cells[i].style.backgroundBrush = PdfSolidBrush(PdfColor(230, 230, 230));
  }
  headerRow.style.font = PdfStandardFont(PdfFontFamily.helvetica, 8, style: PdfFontStyle.bold);

  //DATA
  for (List<_Cell> rowData in data) {
    PdfGridRow row = grid.rows.add();
    row.height = 18;
    for (int i = 0; i < tabTitleHeader.length; i++) {
      final cellData = rowData[i];
      if (cellData is _CellText)
        row.cells[i].value = cellData.display();
      else if (cellData is CellPDFColor) {
        //CASE COULEUR
        row.cells[i].style.backgroundBrush = cellData.display();
        //Chiffre
        if (cellData.chiffre != null &&
            cellData.chiffre != 0 &&
            (i != 2 || isHistorique) /* Truc de porcasse */) {
          row.cells[i].value = '${cellData.chiffre}';
        }
        //Trois points
        if (cellData.troisPoints == true) {
          row.cells[i].value = '...';
        }
        //Point d'interrrogation
        if (cellData.pointInterrogation == true) {
          row.cells[i].value = '?';
        }
        //Hachurage
        if (cellData.hachure == true) {
          row.cells[i].style.backgroundImage = imgHachurage;
          row.cells[i].style.cellPadding = PdfPaddings(bottom: 0, top: 0, right: 0, left: 0);
        }
        //Jour sommet
        if (cellData.jourSommet == true) {
          row.cells[i].style.backgroundImage = imgJourSommet;
          row.cells[i].style.cellPadding = PdfPaddings(bottom: 2, top: 2, right: 10, left: 10);
        }
      } else if (cellData is _CellIcon) {
        //CASE ICON
        row.cells[i].imagePosition = PdfGridImagePosition.stretch;
        row.cells[i].style.backgroundImage = iconEmpty;
        row.cells[i].value = cellData.display();
        double paddH = 2;
        double paddV = 10;
        row.cells[i].style.font = PdfStandardFont(PdfFontFamily.helvetica, 13);
        row.cells[i].style.cellPadding = PdfPaddings(bottom: paddH, top: paddH, right: paddV, left: paddV);
        row.cells[i].style.stringFormat = PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.middle,
        );
      } else if (cellData is _CellImage) {
        //CASE IMAGE
        row.cells[i].imagePosition = PdfGridImagePosition.stretch;
        row.cells[i].style.backgroundImage = cellData.display();
        double paddH = 2;
        double paddV = 11;
        row.cells[i].style.cellPadding = PdfPaddings(bottom: paddH, top: paddH, right: paddV, left: paddV);
      } else if (cellData is _CellNone) {
        //CASE RIEN
        row.cells[i].value = '';
      } else {
        //CASE AUTRE
        row.cells[i].value = cellData.display();
      }
    }
  }

  grid.style.cellPadding = PdfPaddings(left: 5, top: 5);

  // Draw table in the PDF page.
  return grid.draw(
      page: page, bounds: Rect.fromLTWH(0, 40, page.getClientSize().width, page.getClientSize().height));
}

class CellHeader {
  double? width;
  String text;

  CellHeader(this.text, {this.width});
}

abstract class _Cell {
  display();
}

class _CellText extends _Cell {
  String value;

  _CellText(this.value);

  @override
  display() {
    return value;
  }
}

class CellPDFColor extends _Cell {
  PdfBrush? couleur;
  bool? pointInterrogation;
  bool? jourSommet;
  int? chiffre;
  bool? hachure;
  bool? troisPoints;

  CellPDFColor({
    this.couleur,
    this.pointInterrogation,
    this.jourSommet,
    this.chiffre,
    this.hachure,
    this.troisPoints,
  });

  @override
  display() {
    return couleur;
  }
}

class _CellIcon extends _Cell {
  String value;

  _CellIcon(this.value);

  @override
  display() {
    return value;
  }
}

class _CellList extends _Cell {
  List<String> value;

  _CellList(this.value);

  @override
  display() {
    String str = '';
    for (var element in value) {
      str += '$element\n';
    }
    return str;
  }
}

class _CellImage extends _Cell {
  PdfBitmap value;

  _CellImage(this.value);

  @override
  display() {
    return value;
  }
}

class _CellNone extends _Cell {
  _CellNone();

  @override
  display() {
    return null;
  }
}

/*
Future<Widget> _iconFromTxt(String txt) async => Container(
    width: 20,
    height: 20,
    child: Stack(children: [
      Center(child: Image(PdfBitmap((await rootBundle.load(AssetsPath.icon_vide)).buffer.asUint8List()))),
      Center(child: Text(txt, style: TextStyle(fontSize: 10))),
    ]));
 */