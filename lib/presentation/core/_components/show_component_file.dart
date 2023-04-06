import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Ce component sert a afficher en mode développeur le chemin de la page en cour ou le nom du widget
//Cela permet de s'y retrouver plus rapidement dans le projet

class ShowComponentFile extends ConsumerWidget {
  final Widget child;
  final String? title;
  const ShowComponentFile({required this.child, this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool displayPath = ref.watch(showFilePath);

    if (title != null) {
      if (!displayPath) {
        return child;
      }
      return Stack(
        children: [
          Container(
            child: child,
            decoration: BoxDecoration(border: Border.all()),
          ),
          Center(
              heightFactor: 1,
              child: Text(
                title!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white, backgroundColor: Colors.black45, fontSize: 12),
                selectionColor: Colors.red,
              )),
        ],
      );
    }

    return child;
  }
}
