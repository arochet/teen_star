import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../pdf/generate_cycle_pdf.dart';

class DialogPDF extends ConsumerStatefulWidget {
  final List<CycleDTO> listCycle;
  const DialogPDF(this.listCycle, {Key? key}) : super(key: key);

  @override
  _DialogPDFState createState() => _DialogPDFState();
}

class _DialogPDFState extends ConsumerState<DialogPDF> {
  late TextEditingController controllerPremierCycle;
  late TextEditingController controllerDernierCycle;

  bool isLoading = false;

  @override
  void initState() {
    controllerPremierCycle = TextEditingController(text: '${widget.listCycle.first.id}');
    controllerDernierCycle = TextEditingController(text: '${widget.listCycle.last.id}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return Container(height: 100, child: Center(child: CircularProgressIndicator()));

    return ShowComponentFile(
      title: 'DialogPDF',
      child: Container(
        height: 210,
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.maximum_cycles_at_a_time,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: colorpanel(100))),
            const SpaceH10(),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.from_cycle, style: Theme.of(context).textTheme.titleSmall),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  child: TextFormField(
                    autocorrect: false,
                    controller: controllerPremierCycle,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => null,
                  ),
                ),
              ],
            ),
            SpaceH10(),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.to_cycle, style: Theme.of(context).textTheme.titleSmall),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  child: TextFormField(
                    autocorrect: false,
                    controller: controllerDernierCycle,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => null,
                  ),
                ),
              ],
            ),
            SpaceH30(),
            ElevatedButton(
              onPressed: () async {
                final userData = await ref.read(currentUserData.future);
                final passwordPdf = await ref.read(authRepositoryProvider).getPasswordPDF();

                final listCycleAsync = await ref.read(cycleRepositoryProvider).readListCycles(
                    /* widget.listCycle.first.id! */ int.parse(controllerPremierCycle.text),
                    int.parse(controllerDernierCycle.text) /* widget.listCycle.last.id! */);

                listCycleAsync.fold((l) => showSnackbarCycleFailure(context, l), (list) async {
                  if (list.length > 0) {
                    setState(() => isLoading = true);
                    await generatePDF(userData, list, passwordPdf, context);
                    Navigator.of(context).pop();
                  } else
                    showSnackbar(
                        context, //azer
                        "Aucun cycle à exporter dans ces bornes [${controllerPremierCycle.text} - ${controllerDernierCycle.text}]");
                });
              },
              child: Text(AppLocalizations.of(context)!.export_as_pdf),
              style: buttonNormalPrimaryFull,
            ),
          ],
        ),
      ),
    );
  }
}
