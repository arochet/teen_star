import 'dart:io';

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
    return MainScaffold(
      buttonAppBar: InkWell(
        onTap: () async {
          final String assetPDFPath = AppLocalizations.of(context)!.path_guide_pdf;
          final ByteData bytes = await rootBundle.load(assetPDFPath);

          String nomFichier = 'guide.pdf';
          Directory appDocDirectory = await getApplicationDocumentsDirectory();
          String path = '';
          if (Platform.isAndroid) {
            path = '/storage/emulated/0/Download/$nomFichier.pdf';
          } else {
            path = appDocDirectory.path + '/$nomFichier.pdf';
          }

          final File file = File(path);

          await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);

          await OpenFilex.open(path);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(
            'assets/icon_app/icon_principe_de_base.png',
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
                if (async.hasData) {
                  return ListView(children: [
                    HtmlWidget(async.data.toString()),
                    BoutonPDF(),
                  ]);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )),
      ),
    );
  }
}

class Line extends StatelessWidget {
  final int num;
  final String? iconPath;
  final String titre1;
  final String titre2;
  const Line(this.num, this.iconPath, this.titre1, this.titre2, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(" $num ", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(width: 5),
            if (iconPath != null)
              IconObservation(
                iconPath: iconPath!,
                iconSize: 30,
              ),
            if (iconPath == null) SizedBox(width: 30),
            SizedBox(width: 5),
            Expanded(
              child: Text(titre1, style: Theme.of(context).textTheme.bodyMedium),
            ),
            Expanded(
              flex: 2,
              child: Text(titre2, style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}
