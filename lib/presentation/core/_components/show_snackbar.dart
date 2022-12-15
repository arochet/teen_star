import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';

showSnackbar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showSnackbarCycleFailure(BuildContext context, CycleFailure failure) {
  printDev('Erreur FATALE : $failure');
  final snackBar = SnackBar(
    content: Text(failure.map(
        unexpected: (e) => 'Erreur Inattendue $e',
        idCycleUnfound: (_) => 'Id du cycle introuvable',
        cycleUnfound: (_) => 'Cycle non trouvé',
        insufficientPermission: (_) => 'Permission Insuffisante',
        unableToUpdate: (_) => 'Pas possible de mettre à jour')),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
