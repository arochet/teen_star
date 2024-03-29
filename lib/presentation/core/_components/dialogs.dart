import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'show_component_file.dart';

//DIALOG
Future<dynamic> showDialogApp<T>(
    {required BuildContext context, required Widget child, String? titre, List<Widget>? actions}) async {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
        title: titre != null
            ? Text(
                titre,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              )
            : null,
        content: child,
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
    ],
  );
  return choix;
}

//PASSWORD
Future<Object> showDialogPassword<bool>({
  required BuildContext context,
  required WidgetRef ref,
  required bool dissmissable,
}) async {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? controller = TextEditingController();
  String? textError;

  final passwordOK = await ref.read(authRepositoryProvider).checkPasswordAppli('');
  if (passwordOK) {
    return true;
  }

  final res = await showDialog<bool>(
    context: context,
    barrierDismissible: dissmissable == true,
    barrierColor: dissmissable == false ? colorpanel(700) : null,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
          title: Text(AppLocalizations.of(context)!.enter_the_password,
              style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.motdepasse,
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: colorpanel(200)),
                    errorText: textError,
                  ),
                  keyboardType: TextInputType.text,
                  controller: controller,
                  obscureText: true,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      textError = null;
                    });
                  },
                  onFieldSubmitted: (value) async {
                    final passwordOK =
                        await ref.read(authRepositoryProvider).checkPasswordAppli(controller.text);
                    if (passwordOK)
                      Navigator.of(context).pop(true);
                    else {
                      setState(() {
                        textError = AppLocalizations.of(context)!.motdepasseinvalid;
                      });
                      controller.clear();
                    }
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
                  child: Text(AppLocalizations.of(context)!.cancel),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  }),
              SizedBox(width: 10),
            ],
            ElevatedButton(
                style: buttonLittlePrimary,
                child: Text(AppLocalizations.of(context)!.go_to),
                onPressed: () async {
                  final passwordOK =
                      await ref.read(authRepositoryProvider).checkPasswordAppli(controller.text);
                  if (passwordOK)
                    Navigator.of(context).pop(true);
                  else {
                    setState(() {
                      textError = AppLocalizations.of(context)!.motdepasseinvalid;
                    });
                    controller.clear();
                  }
                }),
          ],
        );
      });
    },
  );

  return res ?? false;
}
