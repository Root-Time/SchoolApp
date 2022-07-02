import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: MyTheme.dark,
  scaffoldBackgroundColor: MyTheme.dark,
  cardColor: MyTheme.dark,
  canvasColor: MyTheme.dark,
  dialogBackgroundColor: MyTheme.dark,
  hintColor: MyTheme.dark,
  errorColor: MyTheme.dark,
  toggleableActiveColor: MyTheme.dark,
);

class MyTheme {
  static const RadialGradient gradient = RadialGradient(
    center: Alignment.topLeft,
    radius: 1.0,
    colors: <Color>[
      Colors.greenAccent,
      Colors.blueAccent,
    ],
    tileMode: TileMode.mirror,
  );

  static const Color dark = Color.fromARGB(255, 11, 14, 20);
}
