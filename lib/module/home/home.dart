import 'package:flutter/material.dart';

import '../../components/app_bar.dart';
import '../../components/bottom_app_bar.dart';
import '../../widget/display.dart';
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
  pages: [
    const MyText(
      "Hellos",
      style: TextStyle(fontSize: 100),
    ),
    ModuleHandler.page
  ],
);
