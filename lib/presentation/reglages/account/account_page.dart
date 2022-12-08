import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/PRESENTATION/reglages/account/widget/panel_developper.dart';
import 'package:teenstar/PRESENTATION/reglages/account/widget/panel_modify_mdp_delete_account.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

import 'widget/button_log_out.dart';
import 'widget/panel_personnel_data.dart';
import 'widget/panel_reglages_autre.dart';
import 'widget/version_number.dart';
import 'widget/diplay_title.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  @override
  void initState() {
    super.initState();
    //Rafraichit les données utilisateur lors de l'initialisation
    WidgetsBinding.instance!.addPostFrameCallback((_) => ref.refresh(currentUserData));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      AsyncValue<UserData?> user = ref.watch(currentUserData);
      //Récupère les données utilisateurs (Informations personnelles)
      String nameUser = "";
      String? email;
      TypeAccountState typeAccount = TypeAccountState.fail;
      user.when(
        data: (data) {
          if (data != null) {
            nameUser = 'data.userName.getOrCrash()';
            email = 'data.email?.getOrCrash()';
            typeAccount = data.typeAccount.getOrCrash();
          }
        },
        loading: () {
          nameUser = "...";
          email = "...";
        },
        error: (err, stack) {
          nameUser = "Error";
          email = "Error";
        },
      );

      //Environnement
      final env = ref.watch(environment.notifier).state.name;

      //Container Informations personnelles
      return ShowComponentFile(
        title: 'reglages/account/account_pages.dart',
        child: ListView(
          children: <Widget>[
            SpaceH20(),
            //TEXTE COMPTE
            DisplayTitle(title: AppLocalizations.of(context)!.compte),
            //PANEL DONNEES PERSONNELES
            PanelPersonnelData(nameUser: nameUser, email: email, typeAccount: typeAccount),
            //PANEL MODIFIER MOT DE PASSE / SUPPRIMER COMPTE
            PanelModifyMdpDeleteAccount(typeAccount: typeAccount),

            DisplayTitle(title: 'Autre'),
            PanelReglagesAutre(),
            //PANEL DEVELOPPEMENT
            if (env == Environment.dev) ...[DisplayTitle(title: 'Developpement'), PanelDevelopper()],
            VersionNumber(),
          ],
        ),
      );
    });
  }
}