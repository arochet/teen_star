import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';

ButtonStyle buttonBig(Color color, bool isWhite) => ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    visualDensity: VisualDensity(
      horizontal: (VisualDensity.maximumDensity - 1.0),
      vertical: (VisualDensity.maximumDensity - 2.0),
    ),
    minimumSize: Size(double.infinity, 30),
    backgroundColor: color,
    foregroundColor: isWhite ? Colors.white : colorpanel(900),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))));

final buttonBigPrimary = buttonBig(actioncolor["primary"]!, false);
final buttonBigSecondary = buttonBig(actioncolor["secondary"]!, false);
final buttonBigConfirm = buttonBig(actioncolor["confirm"]!, false);
final buttonBigWarning = buttonBig(actioncolor["warning"]!, true);
final buttonBigRemove = buttonBig(actioncolor["remove"]!, true);
final buttonBigHelp = buttonBig(actioncolor["help"]!, true);

ButtonStyle buttonNormal(Color color, bool isWhite, bool fullWidth) => ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      backgroundColor: color,
      foregroundColor: isWhite ? Colors.white : Colors.black,
      elevation: 0,
      minimumSize: fullWidth ? Size(double.infinity, 30) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
    );

final buttonNormalPrimary = buttonNormal(actioncolor["primary"]!, false, false);
final buttonNormalPrimaryFull = buttonNormal(actioncolor["primary"]!, false, true);
final buttonNormalSecondary = buttonNormal(actioncolor["secondary"]!, false, false);
final buttonNormalConfirm = buttonNormal(actioncolor["confirm"]!, false, false);
final buttonNormalWarning = buttonNormal(actioncolor["warning"]!, true, false);
final buttonNormalRemove = buttonNormal(actioncolor["remove"]!, true, false);
final buttonNormalHelp = buttonNormal(actioncolor["help"]!, true, false);

ButtonStyle buttonLittle(Color color, bool isWhite) => ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      backgroundColor: color,
      foregroundColor: isWhite ? Colors.white : Colors.black,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
    );

final buttonLittlePrimary = buttonLittle(actioncolor["primary"]!, false);
final buttonLittleSecondary = buttonLittle(actioncolor["secondary"]!, false);
final buttonLittleConfirm = buttonLittle(actioncolor["confirm"]!, false);
final buttonLittleWarning = buttonLittle(actioncolor["warning"]!, true);
final buttonLittleRemove = buttonLittle(actioncolor["remove"]!, true);
final buttonLittleHelp = buttonLittle(actioncolor["help"]!, true);

final buttonPrimaryHide = ElevatedButton.styleFrom(
  textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  backgroundColor: Colors.transparent,
  foregroundColor: colorpanel(200),
  elevation: 0,
);

final buttonPrimaryHideLittle = ElevatedButton.styleFrom(
  textStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  backgroundColor: Colors.transparent,
  foregroundColor: colorpanel(200),
  elevation: 0,
);
