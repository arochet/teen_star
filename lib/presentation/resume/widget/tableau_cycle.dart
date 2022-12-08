import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/table_sticky_headers.dart';
import 'package:teenstar/PRESENTATION/core/_utils/num_utils.dart';
import 'package:teenstar/PRESENTATION/resume/resume_page.dart';

import '../../core/_utils/app_date_utils.dart';

class TableauCycle extends ConsumerWidget {
  List<Observation> list;
  TableauCycle(
    this.list, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = [
      'Date',
      'Couleur',
      if (ref.watch(showAnalyse)) 'Analyse',
      'Sensation',
      'Observation',
      'Douleur',
      'Humeur',
      'Evenements'
    ];

    Map cellsWidth = {'Observation': 150, 'Evenements': 120};
    return ShowComponentFile(
      title: 'tableau_cycle.dart',
      child: StickyHeadersTable(
        columnsLength: title.length,
        columnsTitleBuilder: (int colulmnIndex) => _CellHeader(title[colulmnIndex]),
        contentCellBuilder: (int columnIndex, int rowIndex) => rowIndex == list.length
            ? Container(height: 50, width: 50)
            : _Cell(list[rowIndex], title[columnIndex]),
        rowsLength: list.length + 1,
        rowsTitleBuilder: (int rowIndex) => rowIndex == list.length ? Container() : _CellDay('$rowIndex'),
        widthCell: (int rowIndex) => NumUtils.parseDouble(cellsWidth[title[rowIndex]] ?? 60.0),
        cellDimensions: CellDimensions(
          stickyLegendWidth: 40,
          stickyLegendHeight: 50,
          contentCellWidth: 60, //Sert à rien car il y'a widthCell
          contentCellHeight: 50,
        ),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  Observation observation;
  String column;
  _Cell(
    this.observation,
    this.column, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget info;
    switch (column) {
      case 'Date':
        info = Center(
          child: Text(AppDateUtils.formatDate(observation.date, 'dd/MM'),
              style: Theme.of(context).textTheme.headline5),
        );
        break;
      case 'Couleur':
        info = Container(
          width: 40,
          height: 35,
          color: Color.fromARGB(255, 198, 84, 75),
        );
        break;
      case 'Analyse':
        info = Container(
          width: 40,
          height: 35,
          color: Color.fromARGB(255, 198, 84, 75),
        );
        break;
      case 'Sensation':
        info = Center(
          child: Text(observation.sensation?.getOrCrash().toDisplayShort() ?? '',
              style: Theme.of(context).textTheme.headline4),
        );
        break;
      case 'Observation':
        info = Row(
          children: [
            Container(
              width: 40,
              height: 35,
              color: Color.fromARGB(255, 160, 141, 140),
            ),
            ...observation.evenements?.map((evt) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 40,
                        height: 35,
                        color: Color.fromARGB(255, 160, 141, 140),
                      ),
                    )) ??
                []
          ],
        );
        break;
      case 'Douleur':
        info = Text(
            observation.douleurs
                    ?.map((Douleur douleur) => douleur.getOrCrash().toDisplayShort())
                    .toList()
                    .toString() ??
                '/',
            style: Theme.of(context).textTheme.headline5);
        break;
      case 'Humeur':
        info = Icon(Icons.tag_faces);
        break;
      case 'Evenements':
        info = Text("#2", style: Theme.of(context).textTheme.headline4);
        break;
      default:
        info = Text(' ** ', style: Theme.of(context).textTheme.headline5);
        break;
    }

    return Center(child: info);
  }
}

class _CellHeader extends StatelessWidget {
  String value;
  _CellHeader(
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(value, style: Theme.of(context).textTheme.headline6));
  }
}

class _CellDay extends StatelessWidget {
  String value;
  _CellDay(
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('J$value', style: Theme.of(context).textTheme.headline5));
  }
}
