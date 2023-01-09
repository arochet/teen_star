import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'panel_list.dart';

class PanelModifyMdpDeleteAccount extends ConsumerStatefulWidget {
  const PanelModifyMdpDeleteAccount({Key? key}) : super(key: key);

  @override
  _PanelModifyMdpDeleteAccountState createState() => _PanelModifyMdpDeleteAccountState();
}

class _PanelModifyMdpDeleteAccountState extends ConsumerState<PanelModifyMdpDeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return PanelList(title: 'PanelModifyMdpDeleteAccount', list: [
      //Modifier le mot de passe Appli
      ItemPanelList(
        title: 'Modifier le mot de passe Appli',
        icon: Icons.lock,
        onTap: () {
          context.router.push(ReauthenticateRoute(route: NewPasswordRoute(isMotDePasseAppli: true)));
        },
      ),
      //Modifier le mot de passe PDF
      ItemPanelList(
        title: 'Modifier le mot de passe PDF',
        icon: Icons.lock,
        onTap: () {
          context.router.push(ReauthenticateRoute(route: NewPasswordRoute(isMotDePasseAppli: false)));
        },
      ),
      //Supprimer le compte
      ItemPanelList(
        title: 'Réinitialiser l\'application',
        icon: Icons.cancel,
        onTap: () => deleteAccount(),
      ),
      //
      ItemPanelList(
        title: 'Réinitialiser BDD',
        icon: Icons.cancel,
        onTap: () async {
          final result = await ref.read(cycleRepositoryProvider).resetAll();
          result.fold((l) => print('Erreur ! ${l.toString()}'), (r) => print('Reset OKAY'));
        },
      ),
    ]);
  }

  deleteAccount() {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(AppLocalizations.of(context)!.annuler, style: Theme.of(context).textTheme.button),
      onPressed: () => context.router.pop(),
    );

    Widget continueButton = ElevatedButton(
      onPressed: () async {
        await context.router.pop();
        final result = await ref.read(cycleRepositoryProvider).resetAll();
        result.fold((l) => print('Erreur ! ${l.toString()}'), (r) => print('Reset OKAY'));
        ref
            .read(authNotifierProvider.notifier)
            .deleteAccount()
            .then((value) => context.router.replaceAll([AuthInitRoute()]));
      },
      child: Text(AppLocalizations.of(context)!.supprimer),
      style: buttonNormalRemove,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(AppLocalizations.of(context)!.attention),
      content: Text(AppLocalizations.of(context)!.etesvoussurdevouloursupprimervotrecomte),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
