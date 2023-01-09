import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';

generatePDF(UserData? userData, List<Cycle> listCycles) async {
  final Document pdf = Document();

  //LISTE DES CYCLES
  //Données tableau
  final List<Cell> tabTitleCycle = [
    Cell('Jour', flex: 1),
    Cell('Date', flex: 1),
    Cell('Couleur', flex: 1),
    Cell('Analyse', flex: 1),
    Cell('Sensation', flex: 1),
    Cell('Sang', flex: 1),
    Cell('Mucus', flex: 1),
    Cell('Douleurs', flex: 2),
    Cell('Humeur', flex: 1),
    Cell('Evénement', flex: 2),
  ];

  final List<Cell> tabTitleCycleCommentaire = [
    Cell('Jour', flex: 1),
    Cell('Date', flex: 2),
    Cell('Commentaires animatrice', flex: 8),
  ];

  //IMAGE
  final MemoryImage image = MemoryImage(
    (await rootBundle.load(AssetsPath.icon_humeur_neutre)).buffer.asUint8List(),
  );

  //POUR CHAQUE CYCLE
  final int nombreObservationAffichee = 15;
  for (Cycle cycle in listCycles) {
    for (int i = 0; i < cycle.observations.length / nombreObservationAffichee; i++) {
      //Range des observations à afficher
      int rangeStart = i * nombreObservationAffichee;
      int rangeEnd = (i * nombreObservationAffichee) + nombreObservationAffichee;
      if (rangeEnd > cycle.observations.length) {
        rangeEnd = (i * nombreObservationAffichee) + (cycle.observations.length % nombreObservationAffichee);
      }

      //CHARGEMENT LISTE DES ICONES
      Map<SensationState, Widget> listImageSensation = {};
      for (var sensation in SensationState.values) {
        listImageSensation[sensation] = await _iconFromTxt(sensation.toDisplayShort());
      }

      Map<SangState, MemoryImage> listImageSang = {};
      for (var sang in SangState.values) {
        listImageSang[sang] = MemoryImage((await rootBundle.load(sang.toIconPath())).buffer.asUint8List());
      }

      Map<MucusState, MemoryImage> listImageMucus = {};
      for (var mucus in MucusState.values) {
        listImageMucus[mucus] = MemoryImage((await rootBundle.load(mucus.toIconPath())).buffer.asUint8List());
      }

      Map<DouleurState, Widget> listWidgetDouleur = {};
      for (var douleur in DouleurState.values) {
        listWidgetDouleur[douleur] = await _iconFromTxt(douleur.toDisplayShort());
      }

      Map<EvenementState, MemoryImage> listImageEvenement = {};
      for (var evenement in EvenementState.values) {
        listImageEvenement[evenement] =
            MemoryImage((await rootBundle.load(evenement.toIconPath())).buffer.asUint8List());
      }

      Map<HumeurState, MemoryImage> listImageHumeur = {};
      for (var humeur in HumeurState.values) {
        listImageHumeur[humeur] =
            MemoryImage((await rootBundle.load(humeur.toIconPath())).buffer.asUint8List());
      }

      pdf.addPage(Page(
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
          })); // Page
    }
  }

  //PAGE HISTORIQUE
  List<Cell> headerHistorique = [
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
      })); // Pag

  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  final File file = File('${appDocDirectory.path}/alertes.pdf');
  await file.writeAsBytes(await pdf.save());

  OpenFilex.open('${appDocDirectory.path}/alertes.pdf');
}

//HEAD
Widget header(Context context, UserData? userData, List<Cycle> listCycle) {
  final TextStyle styleMain = TextStyle(fontWeight: FontWeight.bold, color: PdfColors.black, fontSize: 16);
  final TextStyle styleSecond = TextStyle(fontWeight: FontWeight.normal, fontSize: 12);

  return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(children: [
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  listCycle.length > 1
                      ? 'Résumé / Analyse du cycle ${listCycle.first.id.getOrCrash()} au cycle ${listCycle.last.id.getOrCrash()}'
                      : 'Résumé / Analyse du cycle ${listCycle.first.id.getOrCrash()}',
                  style: styleMain),
              Text(
                  '${userData?.userName.getOrCrash()} - ${userData?.dateNaissance?.year} - PR ${userData?.anneePremiereRegle}',
                  style: styleSecond),
            ]),
          ])));
}

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
            } else if (e is MemoryImage) {
              return Padding(
                  padding: EdgeInsets.all(3), child: Center(child: Image(e, width: 18, height: 18)));
            } else if (e is List<MemoryImage> || e is List<MemoryImage?>) {
              return Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: e
                          .map<Widget>((MemoryImage? image) =>
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
    );

class Cell {
  int flex;
  String label;

  Cell(this.label, {this.flex = 1});
}

Future<Widget> _iconFromTxt(String txt) async => Container(
    width: 20,
    height: 20,
    child: Stack(children: [
      Center(child: Image(MemoryImage((await rootBundle.load(AssetsPath.icon_vide)).buffer.asUint8List()))),
      Center(child: Text(txt, style: TextStyle(fontSize: 10))),
    ]));
