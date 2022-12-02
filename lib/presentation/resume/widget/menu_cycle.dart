import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';

import '../../core/_core/theme_button.dart';

class MenuCycle extends StatelessWidget {
  const MenuCycle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: 'MenuCycle',
      child: Column(
        children: [
          //APPBAR
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
                label: Text("Cycle 1"),
                style: buttonNormalPrimary,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.file_copy),
                label: Text("PDF"),
                style: buttonNormalPrimary,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward),
                label: Text("Cycle 3"),
                style: buttonNormalPrimary,
              ),
            ],
          ),
          //TABLEAU
          Expanded(
            child: ListView(),
          ),
        ],
      ),
    );
  }
}
