import 'package:base_de_projet/presentation/auth/auth_connexion/widget/auth_connexion_form.dart';
import 'package:base_de_projet/presentation/components/some_widgets.dart';
import 'package:base_de_projet/presentation/components/spacing.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class AuthConnexionPage extends StatelessWidget {
  const AuthConnexionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: defaultAppBar,
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(18),
          shrinkWrap: true,
          children: [
            FormConnexionProvider(),
            //BOUTON SE CONNECTER
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read(signInFormNotifierProvider.notifier)
                        .signInWithEmailAndPasswordPressed();
                  },
                  style: buttonPrimaryBig,
                  child: Text(AppLocalizations.of(context)!.seconnecter),
                ),
              ),
            ),
            const SpaceH10(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(children: <Widget>[
                Expanded(child: Divider()),
                SizedBox(width: 10),
                Text("OR"),
                SizedBox(width: 10),
                Expanded(child: Divider()),
              ]),
            ),
            const SpaceH10(),
            //BUTTON GOOGLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: SignInButton(Buttons.Google, text: "Sign up with Google",
                  onPressed: () {
                context
                    .read(signInFormNotifierProvider.notifier)
                    .signInWithGooglePressed();
              },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)))),
            )
          ],
        ),
      ),
    );
  }
}