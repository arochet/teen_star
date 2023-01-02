import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/providers.dart';

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

  @override
  void initState() {
    controllerPremierCycle = TextEditingController(text: '${widget.listCycle.first.id}');
    controllerDernierCycle = TextEditingController(text: '${widget.listCycle.last.id}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text("Exporter PDF", style: Theme.of(context).textTheme.headline4)),
      content: ShowComponentFile(
        title: '_DialogModificationCycle',
        child: Container(
          height: 200,
          child: Column(
            children: [
              Row(
                children: [
                  Text("Du cycle ", style: Theme.of(context).textTheme.headline5),
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
                  Text("Au cycle ", style: Theme.of(context).textTheme.headline5),
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
                  print('Premier Cycle ${controllerPremierCycle.text}');
                  print('Dernier Cycle ${controllerDernierCycle.text}');
                  final userData = await ref.read(currentUserData.future);
                  generatePDF(userData, []);
                  Navigator.of(context).pop();
                },
                child: Text("Exportation PDF"),
                style: buttonNormalPrimaryFull,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
