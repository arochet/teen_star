import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/observation_form.dart';

class ObservationAddPage extends StatelessWidget {
  const ObservationAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'ObservationAdd',
      child: ShowComponentFile(
        title: './lib/PRESENTATION/./observation/observation_add/observation_add_page.dart',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ObservationFormProvider(),
        ),
      ),
    );
  }
}
