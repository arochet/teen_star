import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';

import 'show_component_file.dart';

Future<bool?> showDialogChoix(BuildContext context, String titre,
    {String? positiveText, String? negativeText, bool isDanger = false}) async {
  final bool? choix = await showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return _DialogChoix(
        titre: titre,
        positiveText: positiveText,
        negativeText: negativeText,
        isDanger: isDanger,
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
  final bool isDanger;
  _DialogChoix({
    Key? key,
    required this.titre,
    required this.isDanger,
    this.positiveText,
    this.negativeText,
    this.container,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Text(
        titre,
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
      ),
      content: ShowComponentFile(
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
  }
}
