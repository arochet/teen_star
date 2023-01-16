import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/core/_utils/app_date_utils.dart';
import 'package:teenstar/providers.dart';

import '../../core/_components/dialogs.dart';

class ShowObservationNotes extends ConsumerWidget {
  final Observation observation;
  const ShowObservationNotes({
    Key? key,
    required this.observation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String txt = '';
    if (observation.sensationsAutre != null && observation.sensationsAutre!.length > 0)
      txt += 'Autre sensation : ${observation.sensationsAutre}\n';
    if (observation.mucusAutre != null && observation.mucusAutre!.length > 0)
      txt += 'Autre mucus : ${observation.mucusAutre}\n';
    if (observation.douleursAutre != null && observation.douleursAutre!.length > 0)
      txt += 'Autre douleur : ${observation.douleursAutre}\n';
    if (observation.humeurAutre != null && observation.humeurAutre!.length > 0)
      txt += 'Autre humeur : ${observation.humeurAutre}\n';
    if (txt == '') txt = 'Aucune observation';

    return ShowComponentFile(title: '_ShowObservationNotes', child: Text(txt));
  }
}

ouvrirNoteConfidentielles(BuildContext context, WidgetRef ref, Observation observation) async {
  //Vérifier le mot de passe de l'application
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? controller = TextEditingController();
  final pass = await showDialogApp<bool>(
    context: context,
    child: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Mot de passe Application',
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: colorpanel(200)),
            ),
            controller: controller,
            obscureText: true,
          ),
        ],
      ),
    ),
    actions: <Widget>[
      TextButton(
          style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
          child: const Text('Voir les notes'),
          onPressed: () async {
            final passwordOK = await ref.read(authRepositoryProvider).checkPasswordAppli(controller.text);
            Navigator.of(context).pop(passwordOK);
          }),
    ],
  );

  if (pass == true) {
    //Voir les notes confidentielles
    String txtObservation = '';
    if (observation.notesConfidentielles != null && observation.notesConfidentielles!.length > 0)
      txtObservation += '${observation.notesConfidentielles}\n';
    else
      txtObservation += 'Pas de notes confidentielles\n';
    showDialogApp<bool>(
      context: context,
      titre: 'Notes confidentielles',
      child: Container(
          height: 160,
          child: Center(
              child: SingleChildScrollView(
            child: Text(
              txtObservation,
              style: Theme.of(context).textTheme.headline6,
            ),
          ))),
      actions: <Widget>[
        TextButton(
            style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  } else if (pass == false) {
    showSnackbar(context, 'Erreur dans le mot de passe');
  }
}
