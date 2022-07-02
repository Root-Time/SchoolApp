import 'package:flutter/material.dart';

import '../module/modulehandler.dart';
import '../widget/display.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar(
      {Key? key, required this.icon, required this.title})
      : super(key: key);

  final List<IconData> icon;
  final List<String> title;

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        // TODO Page changer
        // print(value);
        // Navigator.pop(context);
        setState(() {
          _index = value;
          currentModule.changePage(value);
        });
      },
      currentIndex: _index,
      elevation: 10,
      unselectedIconTheme: const IconThemeData(color: Colors.white24),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        for (int i = 0; i < widget.icon.length; i++)
          BottomNavigationBarItem(
            activeIcon: Column(
              children: [
                MyGradient(
                  child: Icon(widget.icon[i]),
                ),
                MyText(widget.title[i]),
              ],
            ),
            icon: Icon(widget.icon[i]),
            label: widget.title[i],
          ),
      ],
    );
  }
}
