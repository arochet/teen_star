import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';

class DividerOR extends StatelessWidget {
  const DividerOR({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(children: <Widget>[
        Expanded(
            child: Divider(
          color: actioncolor['primary'],
        )),
        SizedBox(width: 10),
        Text("OR", style: Theme.of(context).textTheme.labelMedium),
        SizedBox(width: 10),
        Expanded(child: Divider(color: actioncolor['primary'])),
      ]),
    );
  }
}
