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
  double Function(Enum)? height;
  List<Enum> currentStates;
  ChoixFormField(
      {Key? key,
      required this.choix,
      required this.onSelect,
      required this.currentStates,
      required this.titre,
      required this.iconPath,
      this.height,
      this.iconTxt})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'ChoixFormField',
      child: Container(
        //height: choix.length * 246,
        child: Wrap(
            children: choix
                .map((state) => InkWell(
                      onTap: () => onSelect(state),
                      child: _Field(
                        titre: titre,
                        state: state,
                        isSelected: currentStates.contains(state),
                        iconPath: iconPath,
                        iconText: iconTxt,
                        height: height,
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
  final double? Function(Enum p1)? height;
  _Field({
    Key? key,
    required this.titre,
    required this.state,
    required this.isSelected,
    required this.iconPath,
    required this.height,
    this.iconText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: _getHeight(titre(state)),
            width: 75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Color.fromARGB(255, 164, 187, 67) : Colors.transparent,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: IconObservation(
                      iconPath: iconPath(state),
                      iconText: iconText != null ? iconText!(state) : null,
                      iconSize: 64,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                    child: Text(titre(state),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: actioncolor['primary'], fontSize: 12))),
                SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _getHeight(String? title) {
    if (title == null) {
      return 100;
    }
    final double heightLine = (((title.length ~/ 8) + 1) * 10).toDouble();
    return title != null ? (85 + heightLine).toDouble() : 100;
  }
}
