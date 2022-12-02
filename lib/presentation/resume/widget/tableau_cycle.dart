import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/observation/observation.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/table_sticky_headers.dart';
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
    return ShowComponentFile(
      title: 'tableau_cycle.dart',
      child: StickyHeadersTable(
        columnsLength: title.length,
        columnsTitleBuilder: (int colulmnIndex) => _CellHeader(title[colulmnIndex]),
        contentCellBuilder: (int columnIndex, int rowIndex) => _Cell(list[rowIndex], title[columnIndex]),
        rowsLength: list.length,
        rowsTitleBuilder: (int rowIndex) => _CellDay('$rowIndex'),
        cellDimensions: CellDimensions(
          stickyLegendWidth: 40,
          stickyLegendHeight: 50,
          contentCellWidth: 60,
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
        info = Text(AppDateUtils.formatDate(observation.date, 'dd/MM'),
            style: Theme.of(context).textTheme.headline5);
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
        info = Container(
          width: 40,
          height: 35,
          child: Text("H", style: Theme.of(context).textTheme.headline4),
        );
        break;
      case 'Observation':
        info = Container(
          width: 40,
          height: 35,
          child: Icon(Icons.accessibility),
        );
        break;
      case 'Douleur':
        info = Container(
          width: 40,
          height: 35,
          child: Text("DV", style: Theme.of(context).textTheme.headline4),
        );
        break;
      case 'Humeur':
        info = Container(
          width: 40,
          height: 35,
          child: Icon(Icons.tag_faces),
        );
        break;
      case 'Evenements':
        info = Container(
          width: 40,
          height: 35,
          child: Text("#2", style: Theme.of(context).textTheme.headline4),
        );
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
