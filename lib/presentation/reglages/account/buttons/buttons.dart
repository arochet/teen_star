import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: 'account/account/buttons/buttons.dart',
      child: MainScaffold(
        title: AppLocalizations.of(context)!.nomprojet,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            Text("PRESENTATION/core/_core/theme_buttons", style: Theme.of(context).textTheme.headline5),
            SpaceH20(),
            ElevatedButton(onPressed: () {}, child: Text("buttonLittlePrimary"), style: buttonLittlePrimary),
            ElevatedButton(
                onPressed: () {}, child: Text("buttonLittleSecondary"), style: buttonLittleSecondary),
            ElevatedButton(onPressed: () {}, child: Text("buttonLittleWarning"), style: buttonLittleWarning),
            ElevatedButton(onPressed: () {}, child: Text("buttonLittleRemove"), style: buttonLittleRemove),
            ElevatedButton(onPressed: () {}, child: Text("buttonLittleHelp"), style: buttonLittleHelp),
            ElevatedButton(onPressed: () {}, child: Text("buttonNormalPrimary"), style: buttonNormalPrimary),
            ElevatedButton(
                onPressed: () {}, child: Text("buttonNormalSecondary"), style: buttonNormalSecondary),
            ElevatedButton(onPressed: () {}, child: Text("buttonNormalWarning"), style: buttonNormalWarning),
            ElevatedButton(onPressed: () {}, child: Text("buttonNormalRemove"), style: buttonNormalRemove),
            ElevatedButton(onPressed: () {}, child: Text("buttonNormalHelp"), style: buttonNormalHelp),
            ElevatedButton(onPressed: () {}, child: Text("buttonBigPrimary"), style: buttonBigPrimary),
            ElevatedButton(onPressed: () {}, child: Text("buttonBigSecondary"), style: buttonBigSecondary),
            ElevatedButton(onPressed: () {}, child: Text("buttonBigWarning"), style: buttonBigWarning),
            ElevatedButton(onPressed: () {}, child: Text("buttonBigRemove"), style: buttonBigRemove),
            ElevatedButton(onPressed: () {}, child: Text("buttonBigHelp"), style: buttonBigHelp),
            ElevatedButton(onPressed: () {}, child: Text("buttonPrimaryHide"), style: buttonPrimaryHide),
            ElevatedButton(
                onPressed: () {}, child: Text("buttonPrimaryHideLittle"), style: buttonPrimaryHideLittle),
          ]),
        ),
      ),
    );
  }
}
