import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
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
  bool? isRed;
  ChoixFormField(
      {Key? key,
      required this.choix,
      required this.onSelect,
      required this.currentStates,
      required this.titre,
      required this.iconPath,
      this.height,
      this.isRed,
      this.iconTxt})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'ChoixFormField',
      child: Container(
        //height: choix.length * 246,
        child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.spaceAround,
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
                        isRed: isRed ?? false,
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
  final bool isRed;
  _Field({
    Key? key,
    required this.titre,
    required this.state,
    required this.isSelected,
    required this.iconPath,
    required this.height,
    this.iconText,
    this.isRed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration decorationRounded = BoxDecoration(
      color: isSelected ? Color.fromARGB(255, 164, 187, 67) : Colors.transparent,
      borderRadius: BorderRadius.circular(40),
    );

    BoxDecoration decorationSquared = BoxDecoration(
      color: isSelected ? Color.fromARGB(255, 164, 187, 67) : Colors.transparent,
      borderRadius: BorderRadius.circular(3),
    );

    TextStyle? styleText = Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: isRed ? actioncolor['red'] : colorpanel(50), fontSize: 10, fontWeight: FontWeight.w500);

    double? widthCell = (MediaQuery.of(context).size.width / 4) - 9;

    return Container(
      child: Container(
        height: _textSize(titre(state), styleText!, widthCell).height + 81,
        width: widthCell,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: state is HumeurState ? decorationRounded : decorationSquared,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: IconObservation(
                  iconPath: iconPath(state),
                  iconText: iconText != null ? iconText!(state) : null,
                  textStyle:
                      Theme.of(context).textTheme.headlineMedium?.copyWith(color: actioncolor['primary']),
                  iconSize: 64,
                ),
              ),
            ),
            SizedBox(height: 3),
            Expanded(
              child: AutoSizeText(
                titre(state),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
            )
          ],
        ),
      ),
    );
  }

  Size _textSize(String text, TextStyle style, double maxWidth) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style.copyWith(letterSpacing: 1.1)),
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth - 4);
    return textPainter.size;
  }
}
