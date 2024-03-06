import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class Info_applicationPage extends StatelessWidget {
  const Info_applicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: AppLocalizations.of(context)!.app_info,
      child: ShowComponentFile(
        title: './lib/PRESENTATION/reglages/info_application/info_application_page.dart',
        child: Padding(
            padding: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: HtmlWidget(
                AppLocalizations.of(context)!.textinformation,
                onTapUrl: (url) async {
                  final _url = Uri.parse('https://www.teenstar.fr');
                  if (!await launchUrl(_url)) {
                    throw 'Could not launch $url';
                  }
                  return Future.value(true);
                },
              ),
            )),
      ),
    );
  }
}
