import 'package:flutter/material.dart';
import 'package:schule/format/container.dart';
import 'package:schule/format/text.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: icon(Icons.school),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: icon(Icons.folder),
            label: '',
          ),
        ]);
  }
}
