import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_historique.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_historique_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/table_sticky_headers.dart';
import 'package:teenstar/PRESENTATION/core/_utils/num_utils.dart';
import 'package:teenstar/PRESENTATION/resume/resume_page.dart';

import '../../core/_utils/app_date_utils.dart';

class TableauHistorique extends ConsumerWidget {
  final List<ObservationHistoriqueDTO> listObservation;
  TableauHistorique(
    this.listObservation, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CycleHistorique> listHistorique = [];
    print('listCyclesDTO ${listObservation.length}');

    //Alimente listHistorique
    //Liste Cycle avec la liste des observations
    for (var observation in listObservation) {
      bool found = false;
      for (var cycle in listHistorique) {
        if (found == false) {
          print('${observation.idCycle} - ${cycle.id.getOrCrash()}');
          if (observation.idCycle == cycle.id.getOrCrash()) {
            //cycle.observations.add(observation.toDomain());
            found = true;
          }
        }
      }

      if (found == false) {
        listHistorique.add(CycleHistorique.fromListDTO(listObservation, observation.idCycle));
      }
    }

    final title = listHistorique.map((e) => '${e.id}').toList();
    print('title $title');

    return ShowComponentFile(
      title: 'tableau_historique.dart',
      child: StickyHeadersTable(
        columnsLength: title.length,
        columnsTitleBuilder: (int colulmnIndex) =>
            _CellHeader(/* title[colulmnIndex].getOrCrash() as String */ '-'),
        contentCellBuilder: (int columnIndex, int rowIndex) {
          return _Cell(Color.fromARGB(255, 160, 141, 140));
        },
        rowsLength: _getCyclePlusLong(listHistorique),
        rowsTitleBuilder: (int rowIndex) =>
            rowIndex == listObservation.length ? Container() : _CellObservation('$rowIndex'),
        cellDimensions: CellDimensions(
          stickyLegendWidth: 40,
          stickyLegendHeight: 50,
          contentCellWidth: 60, //Sert à rien car il y'a widthCell
          contentCellHeight: 50,
        ),
      ),
    );
  }

  int _getCyclePlusLong(List<CycleHistorique> listHistorique) {
    int lenght = 0;

    for (var cycle in listHistorique) {
      if (cycle.observations.length > lenght) {
        lenght = cycle.observations.length;
      }
    }

    return lenght;
  }
}

class _Cell extends StatelessWidget {
  Color couleur;
  _Cell(
    this.couleur, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget info;

    return Center(
      child: Container(
        width: 40,
        height: 35,
        color: couleur,
      ),
    );
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

class _CellObservation extends StatelessWidget {
  String value;
  _CellObservation(
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('J$value', style: Theme.of(context).textTheme.headline5));
  }
}
