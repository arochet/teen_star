import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';

class LittleBox extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  const LittleBox({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Container(
            child: child,
            color: color ?? colorpanel(700),
          )),
    );
  }
}
