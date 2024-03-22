import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_form.dart';
import 'package:teenstar/providers.dart';
import 'widget/bouton_PDF.dart';

class Guide_de_basePage extends StatelessWidget {
  const Guide_de_basePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleBold = Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);
    final styleUnderline =
        Theme.of(context).textTheme.bodyMedium!.copyWith(decoration: TextDecoration.underline);
    final styleBlue =
        Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color.fromARGB(255, 33, 150, 243));
    return MainScaffold(
      buttonAppBar: InkWell(
        onTap: () async {
          final String assetPDFPath = AppLocalizations.of(context)!.path_basic_guide;
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
      title: AppLocalizations.of(context)!.basic_guide,
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/guide_de_base/guide_de_base_page.dart',
        child: FutureBuilder(
          future: rootBundle.loadString(AppLocalizations.of(context)!.path_basic_guide),
          builder: (context, async) {
            return PDFView(async, true);
          },
        ),
      ),
    );
  }
}

class PDFView extends ConsumerWidget {
  AsyncSnapshot<Object?> async;
  bool isBasicGuide; //Sinon guide avancée
  PDFView(this.async, this.isBasicGuide, {key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PDF().fromAsset(
      isBasicGuide
          ? AppLocalizations.of(context)!.path_basic_guide
          : AppLocalizations.of(context)!.path_advanded_guide,
      loadingWidget: () => Center(child: Text('Progress')),
      errorWidget: (error) => Center(child: Text(error.toString())),
    );
  }
}
