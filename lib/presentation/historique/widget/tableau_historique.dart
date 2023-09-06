import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';

import '../../../providers.dart';

class TableauHistorique extends ConsumerWidget {
  final List<Cycle> listHistorique;
  TableauHistorique(this.listHistorique, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Titre des colonnes. Exemple : Cycle 1, Cycle 2, Cycle 3
    List<String> title = [];
    List<Cycle> tmpListCycle = [];
    List<int> tmpListCycleLength = []; //Longeur de chaque cycle
    for (var cycle in listHistorique) {
      title.add(' ${cycle.id.getOrCrash()} ');
      List<Observation> listObs = cycle.getObservationsWithEmptyDays(allowDoubleDays: false);
      tmpListCycle.add(Cycle(id: cycle.id, observations: listObs, idJourneeSoleil: cycle.idJourneeSoleil));
      tmpListCycleLength.add(listObs.length);
    }

    return ShowComponentFile(
      title: 'TableauHistorique',
      child: StickyHeadersTable(
        legendCell: Text('Cycle n°', style: Theme.of(context).textTheme.titleSmall),
        columnsLength: title.length,
        columnsTitleBuilder: (int colulmnIndex) =>
            _CellHeader(title[colulmnIndex], listHistorique[colulmnIndex].id), //Titre des colonnes
        contentCellBuilder: (int columnIndex, int rowIndex) {
          // Cellule observation
          if (columnIndex < listHistorique.length) {
            if (rowIndex < tmpListCycleLength[columnIndex]) {
              final Observation observation = tmpListCycle[columnIndex].observations[rowIndex];
              if (observation.isNone)
                return _CellEmpty();
              else
                return _Cell(
                  observation: observation,
                  isJourSommet:
                      tmpListCycle[columnIndex].idJourneeSoleil.getOrCrash() == observation.id.getOrCrash(),
                  isInfertile: observation.jourFertile == false,
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
          contentCellWidth: 50,
          contentCellHeight: 35,
        ),
      ),
    );
  }

  int _getCyclePlusLong(List<Cycle> listHistorique) {
    int lenght = 0;

    for (var cycle in listHistorique) {
      int nbDays = cycle.getNumberOfDays();
      if (nbDays > lenght) {
        lenght = nbDays;
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

    return Center(
      child: Container(
        //Ajout d'une bordure pour les case incolores
        decoration: (observation.couleurGeneree.toColor() == null &&
                observation.analyse?.getOrCrash().toColor() == null)
            ? BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              )
            : null,
        child: LittleBox(
          width: 35,
          height: 30,
          color: couleur ?? observation.couleurGeneree.toColor(),
          child: Stack(
            children: [
              if (isJourSommet)
                Center(
                    child: Image.asset(AssetsPath.icon_fleur_sommet,
                        color: Colors.black, width: 30, height: 30)),
              if (isInfertile)
                Image.asset(AssetsPath.icon_hachurage, color: Colors.black, fit: BoxFit.fill, width: 40),
              if (observation.isPointInterrogation(true))
                Center(child: Text("?", style: Theme.of(context).textTheme.titleSmall)),
              if (observation.marque != null && observation.marque! > 0)
                Center(
                    child: Text('${observation.marque}',
                        style:
                            Theme.of(context).textTheme.titleSmall?.copyWith(color: actioncolor['primary']))),
            ],
          ),
        ),
      ),
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
            child: Text('', style: Theme.of(context).textTheme.titleSmall),
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
            child: Center(
                child: Text(value,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold, color: actioncolor['primary'])))));
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
    return Center(child: AutoSizeText('J$value', style: Theme.of(context).textTheme.titleSmall));
  }
}
