import 'package:flutter/material.dart';

class IconObservation extends StatelessWidget {
  final String iconPath;
  final String? iconText;
  final double iconSize;

  const IconObservation({
    Key? key,
    required this.iconPath,
    required this.iconSize,
    this.iconText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(child: Image.asset(iconPath, width: iconSize, height: iconSize)),
          if (iconText != null) Center(child: Text(iconText!, style: Theme.of(context).textTheme.bodyText2)),
        ],
      ),
      width: iconSize,
      height: iconSize,
    );
  }
}
