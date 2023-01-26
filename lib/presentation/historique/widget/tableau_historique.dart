import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_historique.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_historique_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/little_box.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_components/table_sticky_headers.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_utils/num_utils.dart';
import 'package:teenstar/PRESENTATION/cycle/cycles_page.dart';
import 'package:teenstar/providers.dart';

import '../../core/_utils/app_date_utils.dart';

class TableauHistorique extends ConsumerWidget {
  final List<CycleHistorique> listHistorique;
  TableauHistorique(this.listHistorique, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Titre des colonnes. Exemple : Cycle 1, Cycle 2, Cycle 3
    final List<String> title = listHistorique.map((e) => 'Cycle ${e.id.getOrCrash()}').toList();

    return ShowComponentFile(
      title: 'tableau_historique.dart',
      child: StickyHeadersTable(
        columnsLength: title.length,
        columnsTitleBuilder: (int colulmnIndex) => _CellHeader(title[colulmnIndex]), //Titre des colonnes
        contentCellBuilder: (int columnIndex, int rowIndex) {
          // Cellule observation
          if (columnIndex < listHistorique.length) {
            if (rowIndex < listHistorique[columnIndex].observations.length) {
              if (listHistorique[columnIndex].observations[rowIndex].isEmpty)
                return _CellEmpty();
              else
                return _Cell(
                  observation: listHistorique[columnIndex].observations[rowIndex],
                  isJourSommet: listHistorique[columnIndex].idJourneeSoleil.getOrCrash() ==
                      listHistorique[columnIndex].observations[rowIndex].id.getOrCrash(),
                  isInfertile: listHistorique[columnIndex].observations[rowIndex].jourFertile == false,
                );
            } else {
              return _CellEmpty();
            }
          } else {
            return _CellEmpty();
          }
        },
        rowsLength: _getCyclePlusLong(listHistorique),
        rowsTitleBuilder: (int rowIndex) => _CellObservation('${rowIndex + 1}'),
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
  final ObservationHistorique observation;
  final bool isJourSommet;
  final bool isInfertile;
  _Cell({
    Key? key,
    required this.observation,
    required this.isJourSommet,
    required this.isInfertile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isJourSommet)
          Center(
              child: Image.asset(AssetsPath.icon_fleur_sommet, color: Colors.white, width: 30, height: 30)),
        Center(
          child: LittleBox(
            width: 40,
            height: 35,
            color: observation.couleur?.getOrCrash().toColor() ?? Colors.white,
            child: Stack(
              children: [
                if (isJourSommet)
                  Center(
                      child: Image.asset(AssetsPath.icon_fleur_sommet,
                          color: Colors.white, width: 30, height: 30)),
                if (isInfertile)
                  Image.asset(AssetsPath.icon_hachurage, color: Colors.black, fit: BoxFit.fill, width: 40)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//Cellule vide
class _CellEmpty extends StatelessWidget {
  _CellEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 40,
          height: 35,
          child: Center(
            child: Text('', style: Theme.of(context).textTheme.headline5),
          )),
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
