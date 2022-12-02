import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';

import '../../core/_core/theme_button.dart';
import '../resume_page.dart';

class AppBarAnalyse extends ConsumerWidget {
  const AppBarAnalyse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayAnalyse = ref.watch(showAnalyse);
    return ShowComponentFile(
      title: 'appbar_analyse.dart',
      child: Container(
        height: displayAnalyse ? 100 : 50,
        child: Column(
          children: [
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ref.watch(showAnalyse.notifier).state = !displayAnalyse;
                },
                icon: Icon(Icons.analytics, size: 18),
                label: Text("${displayAnalyse ? 'Masquer' : 'Afficher'} les analyses"),
                style: buttonLittlePrimary,
              ),
            ),
            if (displayAnalyse)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.analytics, size: 18),
                      label: Text("Marquer les jours infertiles"),
                      style: buttonPrimaryHideLittle,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.analytics, size: 18),
                      label: Text("Enlever les ?"),
                      style: buttonPrimaryHideLittle,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
