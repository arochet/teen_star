import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoAccountLink extends StatelessWidget {
  const NoAccountLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: new RichText(
        text: new TextSpan(
          children: [
            new TextSpan(
              text: "${AppLocalizations.of(context)!.pasdecompte}  ",
              style: new TextStyle(color: colorpanel(50)),
            ),
            new TextSpan(
              text: AppLocalizations.of(context)!.sinscrire,
              style: new TextStyle(color: Colors.blue),
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  context.router.push(AuthRegisterRoute());
                },
            ),
          ],
        ),
      ),
    ));
  }
}
