import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      txt += '${AppLocalizations.of(context)!.other_sensation} : ${observation.sensationsAutre}\n';
    if (observation.mucusAutre != null && observation.mucusAutre!.length > 0)
      txt += '${AppLocalizations.of(context)!.other_mucus} : ${observation.mucusAutre}\n';
    if (observation.douleursAutre != null && observation.douleursAutre!.length > 0)
      txt += 'Autre douleur : ${observation.douleursAutre}\n'; //azer
    if (observation.evenementsAutre != null && observation.evenementsAutre!.length > 0)
      txt += '${AppLocalizations.of(context)!.other_event} : ${observation.evenementsAutre}\n';
    if (observation.humeurAutre != null && observation.humeurAutre!.length > 0)
      txt += '${AppLocalizations.of(context)!.other_mood} : ${observation.humeurAutre}\n';
    if (txt == '') txt = 'Pas de note'; //azer

    return ShowComponentFile(title: '_ShowObservationNotes', child: Text(txt));
  }
}

ouvrirNoteConfidentielles(BuildContext context, WidgetRef ref, Observation observation) async {
  //Vérifier le mot de passe de l'application
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? controller = TextEditingController();
  final pass = await showDialogPassword<bool>(context: context, ref: ref, dissmissable: true);

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
              style: Theme.of(context).textTheme.labelMedium,
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
  }
}
