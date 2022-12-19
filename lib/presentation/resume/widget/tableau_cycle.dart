import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_components/table_sticky_headers.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_utils/num_utils.dart';
import 'package:teenstar/PRESENTATION/resume/resume_page.dart';
import 'package:teenstar/PRESENTATION/resume/shared/icon_observation.dart';
import 'package:teenstar/providers.dart';

import '../../core/_utils/app_date_utils.dart';
import 'menu_observation_modification.dart';
import 'show_observation_notes.dart';

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

    _selected = List.generate(widget.cycle.observations.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final title = [
      'Date',
      if (!ref.watch(showAnalyse)) 'Couleur',
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
        contentCellBuilder: (int columnIndex, int rowIndex) => rowIndex == widget.cycle.observations.length
            ? Container(height: 50, width: 50)
            : _Cell(
                widget.cycle.observations[rowIndex],
                title[columnIndex],
                widget.cycle.observations[rowIndex].id.getOrCrash() ==
                    widget.cycle.idJourneeSoleil.getOrCrash()),
        rowsLength: widget.cycle.observations.length + 1,
        rowsTitleBuilder: (int rowIndex) =>
            rowIndex == widget.cycle.observations.length ? Container() : _CellDay('${rowIndex + 1}'),
        widthCell: (int rowIndex) => NumUtils.parseDouble(cellsWidth[title[rowIndex]] ?? 60.0),
        cellDimensions: CellDimensions(
          stickyLegendWidth: 40,
          stickyLegendHeight: 50,
          contentCellWidth: 60, //Sert à rien car il y'a widthCell
          contentCellHeight: 50,
        ),
        rowSelect: (rowIndex) {
          if (rowIndex == widget.cycle.observations.length) return;
          showModalBottomSheet(
              context: context,
              builder: (context) =>
                  MenuObservationModification(widget.cycle, widget.cycle.observations[rowIndex]));
        },
      ),
    );
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
            color: colorpanel(800),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: [
                  if (isJourSommet)
                    Center(child: Image.asset(AssetsPath.icon_fleur_sommet, color: Colors.white)),
                  if (observation.marque != null && observation.marque! > 0)
                    Center(
                        child: Text("${observation.marque}", style: Theme.of(context).textTheme.headline4)),
                  Container(color: observation.couleur?.getOrCrash().toColor()),
                ],
              ),
            ));
        break;
      case 'Analyse':
        info = Container(
            width: 40,
            height: 35,
            color: colorpanel(800),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(color: observation.analyse?.getOrCrash().toColor()),
            ));
        break;
      case 'Sensation':
        info = IconObservation(
            iconPath: observation.sensation?.getOrCrash().toIconPath() ?? '',
            iconText: observation.sensation?.getOrCrash().toDisplayShort() ?? '',
            iconSize: 30);
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
      case 'Douleur':
        if (observation.douleurs?.length != null && observation.douleurs!.length > 0)
          info = SingleChildScrollView(
            child: Row(
              children: observation.douleurs
                      ?.map((Douleur douleur) => IconObservation(
                          iconPath: douleur.getOrCrash().toIconPath(),
                          iconText: douleur.getOrCrash().toDisplayShort(),
                          iconSize: 30))
                      .toList() ??
                  [],
            ),
          );
        else
          info = Container(width: 1, height: 1);
        break;
      case 'Humeur':
        info = IconObservation(
            iconPath: observation.humeur?.getOrCrash().toIconPath() ?? AssetsPath.icon_vide, iconSize: 30);
        break;
      case 'Evenements':
        if (observation.evenements?.length != null && observation.evenements!.length > 0)
          info = SingleChildScrollView(
            child: Row(
              children: observation.evenements
                      ?.map((Evenement evt) =>
                          IconObservation(iconPath: evt.getOrCrash().toIconPath(), iconSize: 30))
                      .toList() ??
                  [],
            ),
          );
        else
          info = Container(width: 1, height: 1);
        break;
      default:
        info = Text(' ?? ', style: Theme.of(context).textTheme.headline5);
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
