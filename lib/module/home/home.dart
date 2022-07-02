import 'package:flutter/material.dart';
import 'package:schule/module/home/stundenplan.dart';

import '../../components/app_bar.dart';
import '../../components/bottom_app_bar.dart';
import '../../widget/display.dart';
import '../modulehandler.dart';

Module home = Module(
  icondata: Icons.home,
  appBar: appBar,
  bottomAppBar: myBottomNavigationBar,
  pages: pages,
);

MyAppBar appBar = const MyAppBar(
  title: "Home",
);

MyBottomNavigationBar myBottomNavigationBar = const MyBottomNavigationBar(
  icon: [Icons.home, Icons.calendar_month, Icons.message],
  title: ["Home", "Stundenplan", "Nachrichten"],
);

List pages = [
  const HomePage(),
  const TimeTable(),
  const Center(child: MyText("Nachrichten")),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const MyText("Home"),
        Center(
          child: Switch(
              activeColor: Colors.blue,
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              }),
        ),
      ],
    ));
  }
}
