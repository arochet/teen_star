import 'package:flutter/material.dart';

final palettecolor = [
  Color(0xffcb997e),
  Color(0xffddbea9),
  Color(0xffffe8d6),
  Color(0xffb7b7a4),
  Color(0xffa5a58d),
  Color(0xff6b705c),
];

Color? colorpanel(int tint) {
  switch (tint) {
    case 900:
      return Color(0xFFE6FCFF);
    case 800:
      return Color(0xFFC7DAE4);
    case 700:
      return Color(0xFFA7B9C9);
    case 600:
      return Color(0xFF8897AE);
    case 500:
      return Color(0xFF687593);
    case 200:
      return Color(0xFF495378);
    case 100:
      return Color(0xFF29325D);
    case 50:
      return Color(0xFF0A1042);
    default:
      return Colors.blueGrey[tint];
  }
}

final actioncolor = {
  "primary": Color(0xFF004FFF),
  "secondary": Color(0xFF846A6A),
  "tertiary": Color(0xffFBFBFB),
  "confirm": Color(0xff2AFC98),
  "warning": Colors.amber[700],
  "remove": Colors.red[800],
  "help": Colors.deepPurple[500],
};
