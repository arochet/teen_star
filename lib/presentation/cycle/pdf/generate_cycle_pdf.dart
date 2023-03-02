import 'dart:io';
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
import 'dart:io' show Platform;

generatePDF(UserData? userData, List<Cycle> listCycles, Password password) async {
  final PdfDocument pdf = PdfDocument();
  header(pdf, userData, listCycles);

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

  //Entete du tableau
  final List<CellHeader> tabTitleCycle = [
    CellHeader('Jour', width: 20),
    CellHeader('Date'),
    CellHeader('Couleur'),
    CellHeader('Analyse'),
    CellHeader('Sensation'),
    CellHeader('Sang'),
    CellHeader('Mucus'),
    CellHeader('Douleurs', width: 80),
    CellHeader('Humeur'),
    CellHeader('Evénement', width: 80),
  ];

  final List<CellHeader> tabTitleCycleCommentaire = [
    CellHeader('Jour', width: 20),
    CellHeader('Date', width: 40),
    CellHeader('Commentaires animatrice'),
  ];

  //IMAGE
  final PdfBitmap image = PdfBitmap(
    (await rootBundle.load(AssetsPath.icon_humeur_neutre)).buffer.asUint8List(),
  );

  //POUR CHAQUE CYCLE
  for (Cycle cycle in listCycles) {
    PdfPage page = pdf.pages.add();

    //Entete du text Cycle
    PdfTextElement textElement = PdfTextElement(
        text: 'Cycle ${cycle.id.getOrCrash()}',
        font: PdfStandardFont(PdfFontFamily.helvetica, 16),
        brush: PdfBrushes.black);

    PdfLayoutResult? layoutResult = textElement.draw(
        page: page, bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, page.getClientSize().height))!;

    layoutResult = tableauCycle(
        page,
        tabTitleCycle,
        cycle
            .getObservationsWithEmptyDays()
            .map((Observation observation) => !observation.isNone
                ? <_Cell>[
                    _CellText('J${cycle.getDayOfObservation(observation)}'),
                    _CellText(AppDateUtils.formatDate(observation.date)),
                    _CellColor(observation.couleurGeneree.toColorPDF()),
                    _CellColor(observation.analyse?.getOrCrash().toColorPDF()),
                    _CellIcon(observation.sensation?.getOrCrash().toDisplayShort() ?? ''),
                    _CellImage(listImageSang[observation.sang?.getOrCrash()]!),
                    _CellImage(listImageMucus[observation.mucus?.getOrCrash()]!),
                    _CellList(observation.douleurs
                            ?.map<String>((douleur) => douleur.getOrCrash().toDisplayString())
                            .toList() ??
                        []),
                    _CellImage(listImageHumeur[observation.humeur?.getOrCrash()]!),
                    _CellList(observation.evenements
                            ?.map<String>((evenement) => evenement.getOrCrash().toDisplayString())
                            .toList() ??
                        []),
                  ]
                : <_Cell>[
                    _CellText('J${cycle.getDayOfObservation(observation)}'),
                    _CellNone(),
                    _CellNone(),
                    _CellNone(),
                    _CellNone(),
                    _CellNone(),
                    _CellNone(),
                    _CellNone(),
                    _CellNone(),
                    _CellNone(),
                  ])
            .toList(),
        listImageMucus[MucusState.none]!,
        layoutResult);

    //PAGE COMMENTAIRES
    page = pdf.pages.add();
    textElement = PdfTextElement(
        text: 'Commentaire du cycle ${cycle.id.getOrCrash()}',
        font: PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.black);
    layoutResult = textElement.draw(
        page: page, bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, page.getClientSize().height))!;

    //TABLEAU COMMENTAIRES
    tableauCycle(
        page,
        tabTitleCycleCommentaire,
        cycle.observations
            .map((Observation observation) => <_Cell>[
                  _CellText('J${cycle.getDayOfObservation(observation)}'),
                  _CellText(AppDateUtils.formatDate(observation.date)),
                  _CellText('${observation.commentaireAnimatrice ?? "-"}'),
                ])
            .toList(),
        listImageMucus[MucusState.none]!,
        layoutResult!);
  }

  //PAGE HISTORIQUE
  PdfPage page = pdf.pages.add();
  PdfTextElement textElement = PdfTextElement(
      text: 'Historique', font: PdfStandardFont(PdfFontFamily.helvetica, 16), brush: PdfBrushes.black);
  PdfLayoutResult layoutResult = textElement.draw(
      page: page, bounds: Rect.fromLTWH(0, 0, page.getClientSize().width, page.getClientSize().height))!;
  List<CellHeader> headerHistorique = [
    CellHeader('Jour', width: 30),
    ...listCycles.map((Cycle cycle) => CellHeader('${cycle.id.getOrCrash()}')).toList()
  ];

  int maxRow = 0;
  List<List<Observation>> observations = [];
  for (int i = 0; i < listCycles.length; i++ /* Cycle cycle in listCycles */) {
    observations.add(listCycles[i].getObservationsWithEmptyDays());
    if (observations[i].length > maxRow) {
      maxRow = observations[i].length;
    }
  }

  List<List<_Cell>> data = [];
  for (int i = 0; i < maxRow; i++) {
    List<_Cell> day = [_CellText('J${i + 1}')];
    for (int u = 0; u < observations.length; u++) {
      if (i < observations[u].length) {
        final obs = observations[u][i];
        final couleurAnalyse = obs.analyse?.getOrCrash();
        if (couleurAnalyse == null || couleurAnalyse == CouleurAnalyseState.none) {
          day.add(_CellColor(obs.couleurGeneree.toColorPDF()));
        } else {
          day.add(_CellColor(obs.analyse!.getOrCrash().toColorPDF()));
        }
      } else {
        day.add(_CellNone());
      }
    }

    data.add(day);
  }

  tableauCycle(page, headerHistorique, data, listImageMucus[MucusState.none]!, layoutResult!);

  //CREATION DU FICHIER
  String nomFichier =
      '${userData!.userName.getOrCrash()}-${AppDateUtils.formatDate(userData?.dateNaissance, 'dd_MM_yyyy')}-${userData.anneePremiereRegle}-Cycle${listCycles.first.id.getOrCrash()}_a_${listCycles.last.id.getOrCrash()}';
  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  PdfSecurity security = pdf.security;
  security.algorithm = PdfEncryptionAlgorithm.rc4x128Bit;
  security.userPassword = password.getOrCrash(); //Set user password
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

header(PdfDocument pdf, UserData? userData, List<Cycle> listCycle) {
  final PdfPageTemplateElement headerTemplate = PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 500, 70));
  //Résumé / Analyse du cycle 1 au cycle 2
  headerTemplate.graphics.drawString(
      listCycle.length > 1
          ? 'Résumé / Analyse du cycle ${listCycle.first.id.getOrCrash()} au cycle ${listCycle.last.id.getOrCrash()}'
          : 'Résumé / Analyse du cycle ${listCycle.first.id.getOrCrash()}',
      PdfStandardFont(PdfFontFamily.helvetica, 16, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(0, 15, 500, 20));
  //Nom - Age - PR 2001
  headerTemplate.graphics.drawString(
      '${userData?.userName.getOrCrash()} - ${userData?.dateNaissance?.year} - PR ${userData?.anneePremiereRegle}',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTWH(0, 35, 500, 20));
  pdf.template.top = headerTemplate;
}

//TABLEAU CYCLE
PdfLayoutResult? tableauCycle(PdfPage page, List<CellHeader> tabTitleHeader, List<List<_Cell>> data,
    PdfBitmap iconEmpty, PdfLayoutResult layout) {
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
    row.height = 30;
    for (int i = 0; i < tabTitleHeader.length; i++) {
      final cell = rowData[i];
      if (cell is _CellText)
        row.cells[i].value = cell.display();
      else if (cell is _CellColor) {
        row.cells[i].style.backgroundBrush = cell.display();
      } else if (cell is _CellIcon) {
        row.cells[i].imagePosition = PdfGridImagePosition.stretch;
        row.cells[i].style.backgroundImage = iconEmpty;
        row.cells[i].value = cell.display();
        double paddH = 6;
        double paddV = 12;
        row.cells[i].style.font = PdfStandardFont(PdfFontFamily.helvetica, 13);
        row.cells[i].style.cellPadding = PdfPaddings(bottom: paddH, top: paddH, right: paddV, left: paddV);
        row.cells[i].style.stringFormat = PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.middle,
        );
      } else if (cell is _CellImage) {
        row.cells[i].imagePosition = PdfGridImagePosition.stretch;
        row.cells[i].style.backgroundImage = cell.display();
        double paddH = 6;
        double paddV = 14;
        row.cells[i].style.cellPadding = PdfPaddings(bottom: paddH, top: paddH, right: paddV, left: paddV);
      } else if (cell is _CellNone) {
        row.cells[i].value = '';
      } else {
        row.cells[i].value = cell.display();
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

class _CellColor extends _Cell {
  PdfBrush? value;

  _CellColor(this.value);

  @override
  display() {
    return value;
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