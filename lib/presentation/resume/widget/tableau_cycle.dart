import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_components/table_sticky_headers.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_utils/num_utils.dart';
import 'package:teenstar/PRESENTATION/resume/resume_page.dart';
import 'package:teenstar/PRESENTATION/resume/shared/icon_observation.dart';
import 'package:teenstar/providers.dart';

import '../../core/_utils/app_date_utils.dart';
import 'show_observation_notes.dart';

class TableauCycle extends ConsumerWidget {
  List<Observation> observations;
  TableauCycle(
    this.observations, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        contentCellBuilder: (int columnIndex, int rowIndex) => rowIndex == observations.length
            ? Container(height: 50, width: 50)
            : _Cell(observations[rowIndex], title[columnIndex]),
        rowsLength: observations.length + 1,
        rowsTitleBuilder: (int rowIndex) =>
            rowIndex == observations.length ? Container() : _CellDay('${rowIndex + 1}'),
        widthCell: (int rowIndex) => NumUtils.parseDouble(cellsWidth[title[rowIndex]] ?? 60.0),
        cellDimensions: CellDimensions(
          stickyLegendWidth: 40,
          stickyLegendHeight: 50,
          contentCellWidth: 60, //Sert à rien car il y'a widthCell
          contentCellHeight: 50,
        ),
        rowSelect: (rowIndex) {
          if (rowIndex == observations.length) return;
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return ShowObservationNotes(observation: observations[rowIndex]);
            },
          );
        },
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
            color: colorpanel(800),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                color: observation.couleur?.getOrCrash().toColor(),
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
              child: Container(
                color: observation.analyse?.getOrCrash().toColor(),
              ),
            ));
        //info = IconObservation(iconPath: observation.analyse?.getOrCrash().toShortString(), state: state, iconText: iconText, iconSize: iconSize)
        break;
      case 'Sensation':
        info = IconObservation(
            iconPath: observation.sensation?.getOrCrash().toIconPath() ?? '',
            iconText: observation.sensation?.getOrCrash().toDisplayShort() ?? '',
            iconSize: 30);
        break;
      case 'Observation':
        info = Row(
          children: [
            IconObservation(
                iconPath: observation.sang?.getOrCrash().toIconPath() ?? AssetsPath.icon_vide, iconSize: 30),
            IconObservation(
                iconPath: observation.mucus?.getOrCrash().toIconPath() ?? AssetsPath.icon_vide, iconSize: 30),
          ],
        );
        break;
      case 'Douleur':
        info = Row(
          children: observation.douleurs
                  ?.map((Douleur douleur) => IconObservation(
                      iconPath: douleur.getOrCrash().toIconPath(),
                      iconText: douleur.getOrCrash().toDisplayShort(),
                      iconSize: 30))
                  .toList() ??
              [],
        );
        break;
      case 'Humeur':
        info = IconObservation(
            iconPath: observation.humeur?.getOrCrash().toIconPath() ?? AssetsPath.icon_vide, iconSize: 30);
        break;
      case 'Evenements':
        info = Row(
          children: observation.evenements
                  ?.map((Evenement evt) =>
                      IconObservation(iconPath: evt.getOrCrash().toIconPath(), iconSize: 30))
                  .toList() ??
              [],
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
