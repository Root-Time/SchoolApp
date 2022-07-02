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
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ModuleHandler.page$,
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          }
          return BottomNavigationBar(
            onTap: (value) {
              setState(() {
                ModuleHandler.setPage(value);
              });
            },
            currentIndex: snapshot.data as int,
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
        });
  }
}
