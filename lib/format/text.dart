import 'package:flutter/material.dart';

Widget text(String text, {String font = 'A'}) {
  if (font == 'A') {
    font = 'Alexana';
  }
  return Text(
    text,
    style: TextStyle(
      fontFamily: font,
    ),
  );
}

Widget icon(IconData icondata) {
  return Icon(icondata);
}
