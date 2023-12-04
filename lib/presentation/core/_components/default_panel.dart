import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_form.dart';
import 'package:teenstar/providers.dart';

class DefaultPanel extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ShowComponentFile(
        title: componentName,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: color ?? ref.watch(themeApp).value?.color,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: child,
        ),
      ),
    );
  }
}
