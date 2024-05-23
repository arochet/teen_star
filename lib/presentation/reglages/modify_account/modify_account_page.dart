import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_form.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ModifyAccountPage extends StatefulWidget {
  const ModifyAccountPage({Key? key}) : super(key: key);

  @override
  _ModifyAccountPageState createState() => _ModifyAccountPageState();
}

class _ModifyAccountPageState extends State<ModifyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: AppLocalizations.of(context)!.modifierprofil,
      child: ShowComponentFile(
          title: 'reglages/modify_account/modify_account_page.dart', child: ModifyAccountForm()),
    );
  }
}
