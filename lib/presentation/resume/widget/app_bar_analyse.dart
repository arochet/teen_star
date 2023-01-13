import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';

import '../../core/_core/theme_button.dart';
import '../pdf/generate_cycle_pdf.dart';
import '../resume_page.dart';
import 'dialog_pdf.dart';

class AppBarAnalyse extends ConsumerWidget {
  const AppBarAnalyse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayAnalyse = ref.watch(showAnalyse);
    final selection = ref.watch(isSelection);

    return ShowComponentFile(
      title: 'appbar_analyse.dart',
      child: selection
          ? _BarModification(selection: selection)
          : _BarMain(displayAnalyse: displayAnalyse, selection: selection),
    );
  }
}

class _BarMain extends ConsumerWidget {
  const _BarMain({
    Key? key,
    required this.displayAnalyse,
    required this.selection,
  }) : super(key: key);

  final bool displayAnalyse;
  final bool selection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 100,
      child: Column(
        children: [
          Container(height: 40, child: TabBarAnalyse()),
          SizedBox(height: 10),
          if (!displayAnalyse)
            ElevatedButton.icon(
              onPressed: () async {
                final listeCycleEither = await ref.read(allCycleProvider.future);

                listeCycleEither.fold(
                  (l) => showSnackbarCycleFailure(context, l),
                  (List<CycleDTO> listeCycle) async {
                    final listCycleAsync = await ref
                        .read(cycleRepositoryProvider)
                        .readListCycles(listeCycle.first.id!, listeCycle.last.id!);

                    final userData = await ref.read(currentUserData.future);
                    listCycleAsync.fold(
                        (l) => showSnackbarCycleFailure(context, l), (list) => generatePDF(userData, list));
                    /* showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogPDF(listeCycle);
                    },
                  ); */
                  },
                );
              },
              icon: Icon(Icons.file_copy, size: 18),
              label: Text("PDF"),
              style: buttonLittleSecondary,
            ),
          if (displayAnalyse)
            ElevatedButton.icon(
              onPressed: () {
                ref.watch(isSelection.notifier).state = !selection;
              },
              icon: Icon(Icons.mode_edit, size: 18),
              label: Text("Modifier"),
              style: buttonLittleSecondary,
            ),
        ],
      ),
    );
  }
}

class _BarModification extends ConsumerWidget {
  const _BarModification({
    Key? key,
    required this.selection,
  }) : super(key: key);

  final bool selection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.watch(isSelection.notifier).state = !selection;
      },
      child: Text("Annuler"),
      style: buttonLittleSecondary,
    );
  }
}

class TabBarAnalyse extends ConsumerStatefulWidget {
  TabBarAnalyse({Key? key}) : super(key: key);

  @override
  _TabBarAnalyseState createState() => _TabBarAnalyseState();
}

class _TabBarAnalyseState extends ConsumerState<TabBarAnalyse> with SingleTickerProviderStateMixin {
  List<Tab> myTabs = <Tab>[
    Tab(text: 'Résumé'),
    Tab(text: 'Analyse'),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.index = ref.watch(showAnalyse) ? 1 : 0;
    return TabBar(
        onTap: (value) {
          if (value == 0) {
            ref.read(showAnalyse.notifier).state = false;
          } else {
            ref.read(showAnalyse.notifier).state = true;
          }
        },
        controller: _tabController,
        labelColor: colorpanel(50),
        indicatorColor: actioncolor['primary'],
        tabs: myTabs);
  }
}
