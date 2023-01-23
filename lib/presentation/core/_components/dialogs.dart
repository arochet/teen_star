import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';

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
        actionsAlignment: MainAxisAlignment.center,
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

//PASSWORD
Future<bool?> showDialogPassword<bool>(
    {required BuildContext context, required WidgetRef ref, required bool dissmissable}) async {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? controller = TextEditingController();
  String? textError;
  return showDialog<bool>(
    context: context,
    barrierDismissible: dissmissable == false,
    barrierColor: dissmissable == false ? colorpanel(700) : null,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text('Entrez le mot de passe',
              style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Mot de passe Application',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: colorpanel(200)),
                    errorText: textError,
                  ),
                  controller: controller,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      textError = null;
                    });
                  },
                ),
              ],
            ),
          ),
          backgroundColor: colorpanel(800),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            if (dissmissable == true) ...[
              ElevatedButton(
                  style: buttonPrimaryHideLittle,
                  child: const Text('Annuler'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  }),
              SizedBox(width: 10),
            ],
            ElevatedButton(
                style: buttonLittlePrimary,
                child: const Text('Accéder'),
                onPressed: () async {
                  final passwordOK =
                      await ref.read(authRepositoryProvider).checkPasswordAppli(controller.text);
                  if (passwordOK)
                    Navigator.of(context).pop(true);
                  else {
                    setState(() {
                      textError = "Mot de passe incorrect";
                    });
                    controller.clear();
                  }
                }),
          ],
        );
      });
    },
  );
}
