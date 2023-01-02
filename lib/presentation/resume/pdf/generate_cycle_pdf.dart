import 'dart:io';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';

generatePDF(UserData? userData, List<Cycle> listCycles) async {
  final Document pdf = Document();

  /* final logo = MemoryImage((await rootBundle.load(AppStaticImages.icOnePerson))
      .buffer
      .asUint8List()); */

  //LISTE DES CYCLES
  //Données tableau
  final List<Cell> tabTitleCycle = [
    Cell('Jour', flex: 1),
    Cell('Date', flex: 2),
    Cell('Couleur', flex: 1),
    Cell('Analyse', flex: 1),
    Cell('Sensation', flex: 2),
    Cell('Observation', flex: 1),
    Cell('Douleur', flex: 1),
    Cell('Humeur', flex: 1),
    Cell('Evénement', flex: 1),
  ];

  final List<Cell> tabTitleCycleCommentaire = [
    Cell('Jour', flex: 1),
    Cell('Date', flex: 2),
    Cell('Commentaires animatrice', flex: 8),
  ];

  //POUR CHAQUE CYCLE
  final int nombreObservationAffichee = 15;
  for (Cycle cycle in listCycles) {
    for (int i = 0; i < cycle.observations.length / nombreObservationAffichee; i++) {
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
                      .getRange(
                          i * nombreObservationAffichee,
                          (i * nombreObservationAffichee) +
                              (cycle.observations.length % nombreObservationAffichee)) //A CHANGER !!!!!
                      .map((Observation observation) => [
                            'J${cycle.getDayOfObservation(observation)}',
                            AppDateUtils.formatDate(observation.date),
                            observation.couleur?.getOrCrash().toColorPDF(),
                            observation.analyse?.getOrCrash().toColorPDF(),
                            observation.sensation?.getOrCrash().toDisplayShort(),
                            '${observation.sang?.getOrCrash().toDisplayString()} ${observation.mucus?.getOrCrash().toDisplayString()}',
                            observation.douleurs
                                ?.map((douleur) => douleur.getOrCrash().toDisplayShort())
                                .toString(),
                            observation.humeur?.getOrCrash().toDisplayString(),
                            observation.evenements
                                ?.map((evenement) => evenement.getOrCrash().toDisplayString())
                                .toString(),
                          ])
                      .toList()),
              SizedBox(height: 15),
              //TABLEAU COMMENTAIRES
              tableauWidget(
                  context,
                  tabTitleCycleCommentaire,
                  cycle.observations
                      .getRange(i * 10, (i * 10) + (cycle.observations.length % 10)) ////A CHANGER !!!!!
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
              return paddedText('$e');
            } else if (e is PdfColor) {
              return Container(height: 20, width: 20, color: e);
            }

            return Container();
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
