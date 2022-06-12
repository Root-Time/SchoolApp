import 'package:flutter/material.dart';
import 'package:schule/format/container.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      child: Drawer(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
        ),
        child: ListView(
          children: <Widget>[
            iconButton(Icons.home),
            iconButton(Icons.settings)
          ],
        ),
      ),
    );
  }
}

IconButton iconButton(IconData icon, {Function? onPressed}) {
  return IconButton(
    icon: Icon(icon),
    onPressed: onPressed?.call(),
  );
}
