import 'package:flutter/material.dart';

Widget drawer = const MyDrawer();

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Drawer(
        child: ListView(
            // children: <Widget>[
            //   for (int i = 0; i < modules.length; i++)
            //     ListTile(
            //       title: modules[i].icon,
            //       onTap: () {
            //         Navigator.pop(context);
            //         setModule(modules[i]);
            //       },
            //     ),
            // ],
            ),
      ),
    );
  }
}
