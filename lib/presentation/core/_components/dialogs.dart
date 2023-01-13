import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';

import 'show_component_file.dart';

//DIALOG
Future<dynamic> showDialogApp<T>(
    {required BuildContext context, required Widget child, String? titre, List<Widget>? actions}) async {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: titre != null
            ? Text(
                titre,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              )
            : null,
        content: child,
        backgroundColor: colorpanel(800),
        actions: actions,
      );
    },
  );
}

//DIALOG CHOIX
Future<bool?> showDialogChoix(BuildContext context, String titre,
    {String? positiveText, String? negativeText, bool isDanger = false, final Widget? container}) async {
  final bool? choix = await showDialogApp<bool?>(
    context: context,
    titre: titre,
    child: ShowComponentFile(
      title: '_DialogChoix',
      child: container ?? Container(height: 0),
    ),
    actions: <Widget>[
      if (negativeText != null)
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(negativeText!),
          style: buttonPrimaryHide,
        ),
      SizedBox(width: 10),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(true);
        },
        child: Text(positiveText ?? 'Oui'),
        style: isDanger ? buttonNormalRemove : buttonNormalPrimary,
      ),
      SizedBox(width: 10),
    ],
  );
  return choix;
}
