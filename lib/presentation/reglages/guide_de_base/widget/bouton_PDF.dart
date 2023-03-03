import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';

class BoutonPDF extends StatelessWidget {
  const BoutonPDF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () async {
          final String assetPDFPath = 'assets/guide.pdf';
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
        label: Text("Version PDF"),
        icon: Icon(Icons.picture_as_pdf),
        style: buttonLittleSecondary,
      ),
    );
  }
}
