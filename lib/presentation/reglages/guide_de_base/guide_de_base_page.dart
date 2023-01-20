import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/reglages/account/widget/diplay_title.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Guide_de_basePage extends StatelessWidget {
  const Guide_de_basePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Guide de base',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/principes_de_base/guide_de_base_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            DisplayTitle(title: "Objectifs"),
            DefaultPanel(
                child: RichText(
              text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                TextSpan(
                    text: "Lorem Ipsum "
                        "Dolor Sit Amet [A complété]")
              ]),
            )),
            DisplayTitle(title: "Comment s'observer"),
            DefaultPanel(
                child: RichText(
              text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                TextSpan(
                    text: "Lorem Ipsum "
                        "Dolor Sit Amet [A complété]")
              ]),
            )),
            DisplayTitle(title: "Comment noter"),
            DefaultPanel(
                child: RichText(
              text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                TextSpan(
                    text: "Lorem Ipsum "
                        "Dolor Sit Amet [A complété]")
              ]),
            )),
            SpaceH20(),

            //BOUTON DE VALIDATION
            _BoutonDeValidation(),
            SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}

class _BoutonDeValidation extends StatelessWidget {
  const _BoutonDeValidation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Text("Version PDF"),
        icon: Icon(Icons.picture_as_pdf),
        style: buttonLittleSecondary,
      ),
    );
  }
}
