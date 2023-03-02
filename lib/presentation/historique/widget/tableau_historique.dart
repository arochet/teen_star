import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_components/little_box.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/table_sticky_headers.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';

import '../../../providers.dart';

class TableauHistorique extends ConsumerWidget {
  final List<Cycle> listHistorique;
  TableauHistorique(this.listHistorique, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Titre des colonnes. Exemple : Cycle 1, Cycle 2, Cycle 3
    final List<String> title = listHistorique.map((e) => 'Cycle ${e.id.getOrCrash()}').toList();

    return ShowComponentFile(
      title: 'TableauHistorique',
      child: StickyHeadersTable(
        columnsLength: title.length,
        columnsTitleBuilder: (int colulmnIndex) =>
            _CellHeader(title[colulmnIndex], listHistorique[colulmnIndex].id), //Titre des colonnes
        contentCellBuilder: (int columnIndex, int rowIndex) {
          List<Observation> listObservation = listHistorique[columnIndex].observations;
          // Cellule observation
          if (columnIndex < listHistorique.length) {
            if (rowIndex < listObservation.length) {
              if (listObservation[rowIndex].isNone)
                return _CellEmpty();
              else
                return _Cell(
                  observation: listObservation[rowIndex],
                  isJourSommet: listHistorique[columnIndex].idJourneeSoleil.getOrCrash() ==
                      listObservation[rowIndex].id.getOrCrash(),
                  isInfertile: listObservation[rowIndex].jourFertile == false,
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

  int _getCyclePlusLong(List<Cycle> listHistorique) {
    int lenght = 0;

    for (var cycle in listHistorique) {
      if (cycle.getObservationsWithEmptyDays(allowDoubleDays: false).length > lenght) {
        lenght = cycle.getObservationsWithEmptyDays(allowDoubleDays: false).length;
      }
    }

    return lenght;
  }
}

class _Cell extends StatelessWidget {
  final Observation observation;
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
    CouleurAnalyseState? couleurAnalyse = observation.analyse?.getOrCrash();
    Color? couleur = couleurAnalyse?.toColor();
    if (couleurAnalyse == CouleurAnalyseState.none) couleur = null;

    return Stack(
      children: [
        if (isJourSommet)
          Center(
              child: Image.asset(AssetsPath.icon_fleur_sommet, color: Colors.white, width: 30, height: 30)),
        Center(
          child: LittleBox(
            width: 40,
            height: 35,
            color: couleur ?? observation.couleurGeneree.toColor(),
            child: Stack(
              children: [
                if (isJourSommet)
                  Center(
                      child: Image.asset(AssetsPath.icon_fleur_sommet,
                          color: Colors.white, width: 30, height: 30)),
                if (isInfertile)
                  Image.asset(AssetsPath.icon_hachurage, color: Colors.black, fit: BoxFit.fill, width: 40),
                if (observation.sensation?.getOrCrash() == SensationState.autre ||
                    observation.sensation?.getOrCrash() == SensationState.nonpercu ||
                    observation.mucus?.getOrCrash() == MucusState.autre)
                  Center(child: Text("?", style: Theme.of(context).textTheme.headline5)),
                if (observation.marque != null && observation.marque! > 0)
                  Center(child: Text('${observation.marque}', style: Theme.of(context).textTheme.headline5)),
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

class _CellHeader extends ConsumerWidget {
  String value;
  UniqueId id;
  _CellHeader(
    this.value,
    this.id, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () {
          ref.invalidate(cycleProvider(id));
          ref.read(idCycleCourant.notifier).state = id;
          context.router.navigate(CyclesRoute());
        },
        child: Container(
            constraints: BoxConstraints(minWidth: 60, minHeight: 50),
            child: Center(child: Text(value, style: Theme.of(context).textTheme.headline6))));
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
