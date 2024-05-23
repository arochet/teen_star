import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/cycle/shared/icon_observation.dart';
import 'package:teenstar/PRESENTATION/reglages/account/widget/diplay_title.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/reglages/guide_de_base/widget/bouton_PDF.dart';

import '../guide_de_base/guide_de_base_page.dart';

@RoutePage()
class Guide_avancePage extends StatelessWidget {
  const Guide_avancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleBold = Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);
    final styleBoldItalic = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
    final styleUnderline =
        Theme.of(context).textTheme.bodyMedium!.copyWith(decoration: TextDecoration.underline);
    final styleBlue = Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.blue);

    print('==> ${AppLocalizations.of(context)!.path_advanded_guide}');

    return MainScaffold(
      buttonAppBar: InkWell(
        onTap: () => openPDF(AppLocalizations.of(context)!.path_advanded_guide),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(
            'assets/icon_app/icon_guide_avance.png',
            width: 35,
          ),
        ),
      ),
      title: AppLocalizations.of(context)!.advanced_guide,
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/guide_avance/guide_avance_page.dart',
        child: Padding(
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
              future: rootBundle.loadString(AppLocalizations.of(context)!.path_advanded_guide),
              builder: (context, async) {
                return SafeArea(
                    child: Column(
                  children: [
                    Expanded(child: PDFView(async, false)),
                    ElevatedButton(
                      onPressed: () => openPDF(AppLocalizations.of(context)!.path_guide_pdf),
                      child: Text(AppLocalizations.of(context)!.export_as_pdf),
                    ),
                  ],
                ));
              },
            )),
      ),
    );
  }
}
