import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/value_objects.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/providers.dart';

class ChoixFormField extends ConsumerWidget {
  List<Enum> choix;
  Function(Enum) onSelect;
  Function(Enum) titre;
  Enum currentState;
  ChoixFormField(
      {Key? key,
      required this.choix,
      required this.onSelect,
      required this.currentState,
      required this.titre})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'ChoixFormField',
      child: Container(
        height: choix.length * 34,
        child: Column(
            children: choix
                .map((state) => InkWell(
                      onTap: () => onSelect(state),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(children: [
                          Placeholder(fallbackHeight: 20, fallbackWidth: 20),
                          SizedBox(width: 10),
                          Expanded(child: Text(titre(state), style: Theme.of(context).textTheme.bodyText1)),
                          if (currentState == state) Icon(Icons.check, size: 20)
                        ]),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}

class ChoixMultipleFormField extends ConsumerWidget {
  List<Enum> choix;
  Function(Enum) onSelect;
  Function(Enum) titre;
  List<Enum> currentStates;
  ChoixMultipleFormField(
      {Key? key,
      required this.choix,
      required this.onSelect,
      required this.currentStates,
      required this.titre})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'ChoixMultipleFormField',
      child: Container(
        height: choix.length * 34,
        child: Column(
            children: choix
                .map((state) => InkWell(
                      onTap: () => onSelect(state),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(children: [
                          Placeholder(fallbackHeight: 20, fallbackWidth: 20),
                          SizedBox(width: 10),
                          Expanded(child: Text(titre(state), style: Theme.of(context).textTheme.bodyText1)),
                          if (currentStates.contains(state)) Icon(Icons.check, size: 20)
                        ]),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
