import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/little_box.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/table_sticky_headers.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_utils/num_utils.dart';
import 'package:teenstar/PRESENTATION/cycle/cycles_page.dart';
import 'package:teenstar/PRESENTATION/cycle/shared/icon_observation.dart';

import '../../core/_utils/app_date_utils.dart';
import 'button_ajout_observation_journee.dart';
import 'menu_observation_modification.dart';

class TableauCycle extends ConsumerStatefulWidget {
  Cycle cycle;
  TableauCycle(this.cycle, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TableauCycleState();
}

class _TableauCycleState extends ConsumerState<TableauCycle> {
  late List<bool> _selected;

  @override
  void initState() {
    super.initState();
    _selected = List.generate(widget.cycle.getObservationsWithEmptyDays().length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    List<Observation> observationsAndEmpty;

    //Affichage du tableau avec une plage de date quand il y'a trop d'observation
    final int? range = ref.watch(rangeDisplayObservation);
    if (range != null) {
      List<List<Observation>> observationsByRange = widget.cycle.getListObservationByRange().toList();
      observationsAndEmpty = observationsByRange[range - 1];
    } else {
      observationsAndEmpty = widget.cycle.getObservationsWithEmptyDays().toList();
    }

    //On inverse la liste
    //observationsAndEmpty = observationsAndEmpty.reversed.toList();

    final selection = ref.watch(isSelection);
    //Si le tableau a changé, on réinitialise la liste de sélection
    if (_selected.length != observationsAndEmpty.length || !selection) {
      _selected = List.generate(observationsAndEmpty.length, (index) => false);
    }

    //Titre du tableau
    final title = [
      'Date',
      if (!ref.watch(showAnalyse)) 'Couleur',
      if (ref.watch(showAnalyse)) 'Analyse',
      'Sensation',
      'Sang',
      'Mucus',
      //'Douleur',
      'Humeur',
      'Evenements'
    ];

    //Largeur des colonnes
    Map cellsWidth = {'Douleur': 120, 'Evenements': 300};

    //Date du premier jour du cycle
    DateTime? datePremierJourCycle = widget.cycle.getDateObservationFirstDay();

    return ShowComponentFile(
      title: 'tableau_cycle.dart',
      child: StickyHeadersTable(
        columnsLength: title.length,
        columnsTitleBuilder: (int colulmnIndex) => _CellHeader(
          title[colulmnIndex],
          underline: colulmnIndex == 1 && ref.watch(showAnalyse),
        ),
        contentCellBuilder: (int columnIndex, int rowIndex) => _Cell(
          observationsAndEmpty[rowIndex],
          title[columnIndex],
          observationsAndEmpty[rowIndex].id.getOrCrash() == widget.cycle.idJourneeSoleil.getOrCrash(),
        ),
        rowsLength: observationsAndEmpty.length,
        rowsTitleBuilder: (int rowIndex) => _CellDay(
            '${widget.cycle.getDayOfObservation(observationsAndEmpty[rowIndex], datePremierJourCycle)}',
            selection),
        widthCell: (int rowIndex) => NumUtils.parseDouble(cellsWidth[title[rowIndex]] ?? 60.0),
        cellDimensions: CellDimensions(
          stickyLegendWidth: 50,
          stickyLegendHeight: 50,
          contentCellWidth: 60, //Sert à rien car il y'a widthCell
          contentCellHeight: 35,
        ),
        rowSelect: (rowIndex) async {
          //Séléction de la ligne
          if (selection) {
            setState(() {
              _selected[rowIndex] = !_selected[rowIndex];
              alimenterListObservationSelectionne(observationsAndEmpty);
            });
          } else {
            if (!observationsAndEmpty[rowIndex].isNone) {
              //Modal de modification de l'observation
              final observation = observationsAndEmpty[rowIndex];
              afficherModalModificationObservation(context, ref, observation, widget.cycle);
            } else {
              DateTime dateObservation = observationsAndEmpty[rowIndex].date!;
              //Si l'observation est vide, on affiche un message
              if (await showDialogChoix(context,
                      'Voulez-vous ajouter une observation pour le ${AppDateUtils.formatDate(dateObservation)} ?',
                      positiveText: 'Ajouter', negativeText: 'Annuler') ==
                  true) openPageNouvelleObservation(context, widget.cycle, ref, true, dateObservation);
            }
          }
        },
        isRowSelected: (rowIndex) {
          if (rowIndex >= observationsAndEmpty.length) return false;
          return _selected[rowIndex];
        },
      ),
    );
  }

  alimenterListObservationSelectionne(List<Observation> observationsAndEmpty) {
    List<Observation> observations = [];
    for (int i = 0; i < _selected.length; i++) {
      if (_selected[i]) {
        observations.add(observationsAndEmpty[i]);
      }
    }
    ref.read(observationSectionne.notifier).state = observations;
  }
}

class _Cell extends StatelessWidget {
  Observation observation;
  final bool isJourSommet;
  String column;
  _Cell(
    this.observation,
    this.column,
    this.isJourSommet, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget info;

    //Cas ou c'est une observation vide
    if (observation.isNone) {
      if (column != 'Date') return Container(width: 10, height: 10);
    }

    final widgetShowTrucChelou = Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //JOUR SOMMET
            if (isJourSommet)
              Image.asset(AssetsPath.icon_fleur_sommet, color: Colors.black, width: 22, height: 22),
            //MARQUE 1 2 3
            if (observation.marque != null && observation.marque! > 0)
              Text("${observation.marque}", style: Theme.of(context).textTheme.headline5),
            //POINT D'INTERROGATION
            if (observation.sensation?.getOrCrash() == SensationState.autre ||
                observation.mucus?.getOrCrash() == MucusState.autre &&
                    observation.enleverPointInterrogation != true)
              Text("?", style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );

    switch (column) {
      case 'Date':
        info = Center(
          child: Column(
            children: [
              Text(AppDateUtils.formatDate(observation.date, 'dd'),
                  style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 14)),
              Text(AppDateUtils.formatDate(observation.date, 'MMM'),
                  style: Theme.of(context).textTheme.headline6),
            ],
          ),
        );
        break;
      case 'Couleur':
        if (observation.couleurGeneree == CouleurAnalyseState.none)
          info = Stack(
            children: [
              _CellNone(),
              widgetShowTrucChelou,
            ],
          );
        else
          info = LittleBox(
              width: 40,
              height: 30,
              child: Stack(
                children: [
                  LittleBox(width: 40, height: 30, color: observation.couleurGeneree.toColor()),
                  widgetShowTrucChelou,
                ],
              ));
        break;
      case 'Analyse':
        info = LittleBox(
            width: 40,
            height: 30,
            child: Stack(
              children: [
                LittleBox(
                    width: 40,
                    height: 30,
                    color:
                        observation.analyse?.getOrCrash().toColor() ?? observation.couleurGeneree.toColor()),
                if (observation.jourFertile == false)
                  Image.asset(AssetsPath.icon_hachurage,
                      color: colorpanel(50), width: 40, height: 35, fit: BoxFit.fill),
                widgetShowTrucChelou,
              ],
            ));
        break;
      case 'Sensation':
        /* if (observation.mucus?.getOrCrash() == MucusState.none)
          info = _CellNone();
        else */
        info = _LittleBoxChild(
          IconObservation(
              iconPath: observation.sensation?.getOrCrash().toIconPath() ?? AssetsPath.icon_vide,
              iconSize: 30),
        );
        break;
      case 'Observation':
        info = SingleChildScrollView(
          child: Row(
            children: [
              IconObservation(
                  iconPath: observation.sang?.getOrCrash().toIconPath() ?? AssetsPath.icon_vide,
                  iconSize: 30),
              IconObservation(
                  iconPath: observation.mucus?.getOrCrash().toIconPath() ?? AssetsPath.icon_vide,
                  iconSize: 30),
            ],
          ),
        );
        break;
      case 'Sang':
        if (observation.sang?.getOrCrash() == SangState.none)
          info = _CellNone();
        else
          info = _LittleBoxChild(
            IconObservation(
                iconPath: observation.sang?.getOrCrash().toIconPath() ?? AssetsPath.icon_vide, iconSize: 30),
          );
        break;
      case 'Mucus':
        if (observation.mucus?.getOrCrash() == MucusState.none)
          info = _CellNone();
        else
          info = _LittleBoxChild(
            IconObservation(
                iconPath: observation.mucus?.getOrCrash().toIconPath() ?? AssetsPath.icon_vide, iconSize: 30),
          );
        break;
      /* case 'Douleur':
        if (observation.douleurs?.length != null && observation.douleurs!.length > 0)
          info = SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: observation.douleurs
                      ?.map((Douleur douleur) => Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: _LittleBoxText(douleur.getOrCrash().toDisplayShort()),
                          ))
                      .toList() ??
                  [],
            ),
          );
        else
          info = Container(width: 1, height: 1);
        break; */
      case 'Humeur':
        if (observation.humeur?.getOrCrash() == HumeurState.none)
          info = _CellNone();
        else
          info = IconObservation(
              iconPath: observation.humeur?.getOrCrash().toIconPath() ?? AssetsPath.icon_vide, iconSize: 30);
        break;
      case 'Evenements':
        info = Container(
          width: 290,
          child: SingleChildScrollView(
            child: Wrap(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                //Température basale
                _LittleBoxText(
                  observation.temperatureBasale != null ? '${observation.temperatureBasale}' : '',
                  width: 50,
                  fontSize: 18,
                ),
                // Les douleurs
                ...(observation.douleurs
                        ?.map((Douleur douleur) => Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: _LittleBoxChild(
                                  IconObservation(iconPath: douleur.getOrCrash().toIconPath(), iconSize: 30)),
                            ))
                        .toList() ??
                    []),
                // Les evenements
                ...?observation.evenements
                    ?.map((Evenement evt) => _LittleBoxChild(
                        IconObservation(iconPath: evt.getOrCrash().toIconPath(), iconSize: 30)))
                    .toList(),
                // Les notes confidentielles
                if (observation.notesConfidentielles != null &&
                    observation.notesConfidentielles!.length > 1) ...[
                  SizedBox(width: 5),
                  _LittleBoxChild(
                      IconObservation(iconPath: AssetsPath.icon_evt_confidentielle, iconSize: 30)),
                ],
                const SizedBox(width: 1, height: 1),
              ],
            ),
          ),
        );

        break;
      default:
        info = Text(' ?? ', style: Theme.of(context).textTheme.headline5);
        break;
    }

    return info;
  }
}

class _LittleBoxText extends StatelessWidget {
  final double? width;
  final double? fontSize;
  const _LittleBoxText(
    this.titre, {
    this.width,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  final String titre;

  @override
  Widget build(BuildContext context) {
    return LittleBox(
      width: width ?? 35,
      height: 35,
      child: Center(
        child: Text(titre,
            overflow: TextOverflow.fade,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: colorpanel(100), fontSize: fontSize ?? 11)),
      ),
    );
  }
}

class _LittleBoxChild extends StatelessWidget {
  const _LittleBoxChild(
    this.child, {
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LittleBox(width: 35, height: 35, child: Center(child: child));
  }
}

class _CellHeader extends StatelessWidget {
  String value;
  bool? underline;
  _CellHeader(
    this.value, {
    this.underline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(value,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(decoration: underline == true ? TextDecoration.underline : null)));
  }
}

class _CellDay extends StatelessWidget {
  String value;
  bool selection;
  _CellDay(
    this.value,
    this.selection, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return Row(children: [

      Text('J$value', style: Theme.of(context).textTheme.headline5),
    ]); */
    return Center(
        child: Text('${selection ? " - " : ""}J$value', style: Theme.of(context).textTheme.headline5));
  }
}

class _CellNone extends StatelessWidget {
  _CellNone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 1,
    );
  }
}
