import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';

class AppBarCycle extends StatelessWidget {
  const AppBarCycle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: '_AppBarCycle',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Row(children: [Icon(Icons.arrow_back, size: 16), Text(" Cycle 1")]),
            style: buttonPrimaryHideLittle,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.file_copy, size: 18),
            label: Text("PDF"),
            style: buttonLittlePrimary,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(children: [Text("Cycle 3 "), Icon(Icons.arrow_forward, size: 16)]),
            style: buttonPrimaryHideLittle,
          ),
        ],
      ),
    );
  }
}
