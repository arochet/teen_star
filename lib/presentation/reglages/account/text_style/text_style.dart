import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';

class TextStylePage extends StatelessWidget {
  const TextStylePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Style de Texte',
      child: ShowComponentFile(
        title: 'account/account/text_style/text_style.dart',
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(children: [
            Text("headline1", style: Theme.of(context).textTheme.headline1),
            SpaceH10(),
            Text("headline2", style: Theme.of(context).textTheme.headline2),
            SpaceH10(),
            Text("headline3", style: Theme.of(context).textTheme.titleLarge),
            SpaceH10(),
            Text("headline4", style: Theme.of(context).textTheme.titleMedium),
            SpaceH10(),
            Text("headline5", style: Theme.of(context).textTheme.titleSmall),
            SpaceH10(),
            Text("headline6", style: Theme.of(context).textTheme.labelMedium),
            SpaceH10(),
            Text("bodytext1", style: Theme.of(context).textTheme.bodyMedium),
            SpaceH10(),
            Text("bodytext2", style: Theme.of(context).textTheme.bodyText2),
            SpaceH10(),
            Text("bodyLarge", style: Theme.of(context).textTheme.bodyLarge),
            SpaceH10(),
            Text("bodyMedium", style: Theme.of(context).textTheme.bodyMedium),
            SpaceH10(),
            Text("bodySmall", style: Theme.of(context).textTheme.bodySmall),
            SpaceH10(),
          ]),
        ),
      ),
    );
  }
}
