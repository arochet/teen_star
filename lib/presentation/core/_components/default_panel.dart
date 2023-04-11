import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';

class DefaultPanel extends StatelessWidget {
  final String? componentName;
  final Color? color;
  const DefaultPanel({
    Key? key,
    required this.child,
    this.color,
    this.componentName,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ShowComponentFile(
        title: componentName,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: color ?? colorpanel(900),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: child,
        ),
      ),
    );
  }
}
