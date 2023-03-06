import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/cycle/shared/icon_observation.dart';

import '../../../core/_core/theme_colors.dart';

class ChoixFormField extends ConsumerWidget {
  List<Enum> choix;
  Function(Enum) onSelect;
  String Function(Enum) titre;
  String Function(Enum) iconPath;
  String Function(Enum)? iconTxt;
  List<Enum> currentStates;
  ChoixFormField(
      {Key? key,
      required this.choix,
      required this.onSelect,
      required this.currentStates,
      required this.titre,
      required this.iconPath,
      this.iconTxt})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'ChoixFormField',
      child: Container(
        height: choix.length * 46,
        child: Column(
            children: choix
                .map((state) => InkWell(
                      onTap: () => onSelect(state),
                      child: _Field(
                        titre: titre,
                        state: state,
                        isSelected: currentStates.contains(state),
                        iconPath: iconPath,
                        iconText: iconTxt,
                      ),
                    ))
                .toList()),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final Enum state;
  final bool isSelected;
  final String Function(Enum p1) titre;
  final String Function(Enum p1) iconPath;
  final String Function(Enum p1)? iconText;
  _Field({
    Key? key,
    required this.titre,
    required this.state,
    required this.isSelected,
    required this.iconPath,
    this.iconText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? actioncolor['primary'] : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(children: [
            SizedBox(width: 2),
            IconObservation(
                iconPath: iconPath(state),
                iconText: iconText != null ? iconText!(state) : null,
                iconSize: 28),
            SizedBox(width: 10),
            Expanded(
                child: Text(titre(state),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: isSelected ? Colors.white : Colors.black))),
            if (isSelected) Icon(Icons.check, size: 20),
            SizedBox(width: 5),
          ]),
        ),
      ),
    );
  }
}
