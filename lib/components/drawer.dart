import 'package:flutter/material.dart';
import 'package:schule/widget/container.dart';
import 'package:schule/widget/display.dart';

import '../module/modulehandler.dart';

Widget drawer = const MyDrawer();

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            for (int i = 0; i < modules.length; i++)
              Center(
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Container(
                    decoration: debugBorder,
                    child: IconButton(
                      icon: MyIcon(
                        modules[i].icondata,
                        size: 50,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        ModuleHandler.setModule(modules[i]);
                      },
                    ),
                    // child: ListTile(
                    //   title: modules[i].icon,
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //     ModuleHandler.setModule(modules[i]);
                    //   },
                    // ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
