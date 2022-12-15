import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';

import 'show_component_file.dart';
import 'spacing.dart';

Future<bool?> showDialogChoix(BuildContext context, String titre,
    {String? positiveText, String? negativeText}) async {
  final bool? choix = await showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return _DialogChoix(
        titre: titre,
        positiveText: positiveText,
        negativeText: negativeText,
      );
    },
  );
  return choix;
}

class _DialogChoix extends StatelessWidget {
  final String titre;
  final String? positiveText;
  final String? negativeText;
  final Widget? container;
  _DialogChoix({
    Key? key,
    required this.titre,
    this.positiveText,
    this.negativeText,
    this.container,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titre, style: Theme.of(context).textTheme.headline4),
      content: ShowComponentFile(
        title: '_DialogChoix',
        child: container ?? Container(height: 5),
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
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(positiveText ?? 'Oui'),
          style: buttonNormalPrimary,
        ),
      ],
    );
  }
}
