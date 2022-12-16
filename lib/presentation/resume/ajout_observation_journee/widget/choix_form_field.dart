import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';

class ChoixFormField extends ConsumerWidget {
  List<Enum> choix;
  Function(Enum) onSelect;
  String Function(Enum) titre;
  String Function(Enum) iconPath;
  String Function(Enum)? iconTxt;
  List<Enum> currentStates;
  ChoixFormField(
      {Key? key,
      required this.choix,
      required this.onSelect,
      required this.currentStates,
      required this.titre,
      required this.iconPath,
      this.iconTxt})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'ChoixMultipleFormField',
      child: Container(
        height: choix.length * 40,
        child: Column(
            children: choix
                .map((state) => InkWell(
                      onTap: () => onSelect(state),
                      child: _Field(
                        titre: titre,
                        state: state,
                        isSelected: currentStates.contains(state),
                        iconPath: iconPath,
                        iconText: iconTxt,
                      ),
                    ))
                .toList()),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final Enum state;
  final bool isSelected;
  final String Function(Enum p1) titre;
  final String Function(Enum p1) iconPath;
  final String Function(Enum p1)? iconText;
  _Field({
    Key? key,
    required this.titre,
    required this.state,
    required this.isSelected,
    required this.iconPath,
    this.iconText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(children: [
        Container(
          child: Stack(
            children: [
              Center(child: Image.asset(iconPath(state), width: 30, height: 30)),
              if (iconText != null)
                Center(child: Text(iconText!(state), style: Theme.of(context).textTheme.bodyText2)),
            ],
          ),
          width: 30,
          height: 30,
        ),
        SizedBox(width: 10),
        Expanded(child: Text(titre(state), style: Theme.of(context).textTheme.bodyText1)),
        if (isSelected) Icon(Icons.check, size: 20)
      ]),
    );
  }
}
