import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';

class IconObservation extends StatelessWidget {
  final String iconPath;
  final String? iconText;
  final double iconSize;
  final TextStyle? textStyle;

  const IconObservation({
    Key? key,
    required this.iconPath,
    required this.iconSize,
    this.iconText,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(child: Image.asset(iconPath, width: iconSize, height: iconSize)),
          if (iconText != null)
            Center(
                child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: AutoSizeText(iconText!,
                  style: textStyle ??
                      Theme.of(context).textTheme.labelLarge?.copyWith(color: actioncolor['primary'])),
            )),
        ],
      ),
      width: iconSize,
      height: iconSize,
    );
  }
}
