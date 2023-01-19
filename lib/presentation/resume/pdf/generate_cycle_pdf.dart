import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
//import 'package:pdf/widgets.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';

generatePDF(UserData? userData, List<Cycle> listCycles) async {
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

  //LISTE DES CYCLES
  //Données tableau
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
        font: PdfStandardFont(PdfFontFamily.helvetica, 20),
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
                    _CellColor(observation.couleur?.getOrCrash().toColorPDF()),
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
/* 
      //Draw image on the page in the specified location and with required size
      page.graphics.drawImage(listImageEvenement[EvenementState.fatigue]!, Rect.fromLTWH(150, 30, 30, 30)); */

    /* page.graphics.pdf.addPage(Page(
          pageFormat: PdfPageFormat.a4,
          orientation: PageOrientation.portrait,
          build: (Context context) {
            //Pour chaque cycle
            Widget w = Column(children: [
              header(context, userData, listCycles),
              SizedBox(height: 15),
              paddedHeader(context, 'Cycle ${cycle.id.getOrCrash()}', fontSize: 16, bold: true),
              SizedBox(height: 5),
              //TABLEAU CYCLE
              tableauWidget(
                  context,
                  tabTitleCycle,
                  cycle.observations
                      .getRange(rangeStart, rangeEnd) //A CHANGER !!!!!
                      .map((Observation observation) => [
                            'J${cycle.getDayOfObservation(observation)}',
                            AppDateUtils.formatDate(observation.date),
                            observation.couleur?.getOrCrash().toColorPDF(),
                            observation.analyse?.getOrCrash().toColorPDF(),
                            listImageSensation[observation.sensation?.getOrCrash()],
                            listImageSang[observation.sang?.getOrCrash()],
                            listImageMucus[observation.mucus?.getOrCrash()],
                            observation.douleurs
                                ?.map((douleur) => listWidgetDouleur[douleur.getOrCrash()])
                                .toList(),
                            listImageHumeur[observation.humeur?.getOrCrash()],
                            observation.evenements
                                ?.map((evenement) => listImageEvenement[evenement.getOrCrash()])
                                .toList(),
                          ])
                      .toList()),
              SizedBox(height: 15),
              //TABLEAU COMMENTAIRES
              tableauWidget(
                  context,
                  tabTitleCycleCommentaire,
                  cycle.observations
                      .getRange(rangeStart, rangeEnd) ////A CHANGER !!!!!
                      .map((Observation observation) => [
                            'J${cycle.getDayOfObservation(observation)}',
                            AppDateUtils.formatDate(observation.date),
                            '${observation.commentaireAnimatrice ?? "-"}',
                          ])
                      .toList())
            ]);

            return w;
          })); // Page */

  }

  //PAGE HISTORIQUE
  /* List<Cell> headerHistorique = [
    Cell('Jour'),
    ...listCycles.map((Cycle cycle) => Cell('${cycle.id.getOrCrash()}')).toList()
  ];
  int maxRow = 0;
  for (Cycle cycle in listCycles) {
    if (cycle.observations.length > maxRow) {
      maxRow = cycle.observations.length;
    }
  }

  List<List<dynamic>> rows = [];
  for (int i = 0; i < maxRow; i++) {
    List day = ['J${i + 1}'];
    for (Cycle cycle in listCycles) {
      if (i < cycle.observations.length) {
        day.add(cycle.observations[i].analyse?.getOrCrash().toColorPDF());
      }
    }
    rows.add(day);
  }

  pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.portrait,
      build: (Context context) {
        return Column(children: [
          paddedHeader(context, 'Historique', fontSize: 16, bold: true),
          SizedBox(height: 5),
          tableauWidget(context, headerHistorique, rows),
        ]);
      })); // Page
 */
  //CREATION DU FICHIER
  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  final File file = File('${appDocDirectory.path}/cycles.pdf');
  await file.writeAsBytes(await pdf.save());

  OpenFilex.open('${appDocDirectory.path}/cycles.pdf');
  pdf.dispose();
}

header(PdfDocument pdf, UserData? userData, List<Cycle> listCycle) {
  final PdfPageTemplateElement headerTemplate = PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 70));
//Draw text in the header.
  headerTemplate.graphics.drawString(
      listCycle.length > 1
          ? 'Résumé / Analyse du cycle ${listCycle.first.id.getOrCrash()} au cycle ${listCycle.last.id.getOrCrash()}'
          : 'Résumé / Analyse du cycle ${listCycle.first.id.getOrCrash()}',
      PdfStandardFont(PdfFontFamily.helvetica, 16, style: PdfFontStyle.bold),
      bounds: const Rect.fromLTWH(0, 15, 200, 20));
  headerTemplate.graphics.drawString(
      '${userData?.userName.getOrCrash()} - ${userData?.dateNaissance?.year} - PR ${userData?.anneePremiereRegle}',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTWH(0, 35, 200, 20));
//Add the header element to the document.
  pdf.template.top = headerTemplate;
//Create a PDF page template and add footer content.
  final PdfPageTemplateElement footerTemplate = PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
//Draw text in the footer.
  footerTemplate.graphics.drawString('This is page footer', PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 15, 200, 20));
//Set footer in the pdf.
  pdf.template.bottom = footerTemplate;
}

PdfLayoutResult? tableauCycle(PdfPage page, List<CellHeader> tabTitleHeader, List<List<_Cell>> data,
    PdfBitmap iconEmpty, PdfLayoutResult layout) {
  final PdfGrid grid = PdfGrid();
  grid.columns.add(count: tabTitleHeader.length); // Specify the grid column count.

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

  //ROWS
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
        double paddV = 12;
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
      page: page,
      bounds: Rect.fromLTWH(
          0, /* layout.bounds.bottom + */ 40, page.getClientSize().width, page.getClientSize().height));
}

/*
//CONTENT
Widget tableauWidget(Context context, List<Cell> title, List<List<dynamic>> data) {
  return Table(
    border: TableBorder.all(color: PdfColors.black),
    children: [
      TableRow(
        decoration: BoxDecoration(color: PdfColors.blueGrey50),
        children: title
            .map<Widget>(
                (Cell t) => Expanded(child: paddedHeader(context, t.label, bold: true), flex: t.flex))
            .toList(),
      ),
      ...data.map(
        (List row) => TableRow(
          children: row.map<Widget>((e) {
            if (e is String) {
              return Center(child: paddedText('$e'));
            } else if (e is PdfColor) {
              return Center(child: Container(height: 20, width: 20, color: e));
            } else if (e is PdfBitmap) {
              return Padding(
                  padding: EdgeInsets.all(3), child: Center(child: Image(e, width: 18, height: 18)));
            } else if (e is List<PdfBitmap> || e is List<PdfBitmap?>) {
              return Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: e
                          .map<Widget>((PdfBitmap? image) =>
                              image != null ? Image(image, width: 18, height: 18) : Container())
                          .toList()));
            } else if (e is List<Widget> || e is List<Widget?>) {
              return Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: e.map<Widget>((Widget? w) {
                        if (w != null) {
                          return w;
                        }
                        return Container();
                      }).toList()));
            } else if (e is Widget) {
              return Padding(padding: EdgeInsets.all(3), child: e);
            }

            return Center(child: Text('Inconnu'));
          }).toList(),
        ),
      ),
    ],
  );
}

Widget paddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(3),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(fontSize: 6),
      ),
    );

Widget paddedHeader(
  final Context context,
  final String text, {
  final TextAlign align = TextAlign.left,
  final double fontSize = 6,
  final bool bold = false,
}) =>
    Padding(
      padding: EdgeInsets.all(3),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(fontSize: fontSize, fontWeight: bold ? FontWeight.bold : FontWeight.normal),
      ),
    );*/

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