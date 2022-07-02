import 'package:flutter/material.dart';

import '../modulehandler.dart';

//
Module home = Module(
  // name: 'Home',
  appBar: const MyAppBar(title: "Home"),
  icondata: Icons.home,
  bottomAppBar: const MyBottomNavigationBar(
    icon: [Icons.bus_alert, Icons.abc],
    title: ["Hello", "Hallo2"],
  ),
  pages: const [
    MyText(
      "Hello",
      style: TextStyle(fontSize: 100),
    ),
    MyText("Hello2")
  ],
);
