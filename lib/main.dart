import 'package:flutter/material.dart';
import 'package:schule/theme.dart';

import 'components/drawer.dart';
import 'module/modulehandler.dart';

void main() {
  runApp(const School());
}

class School extends StatefulWidget {
  const School({Key? key}) : super(key: key);

  @override
  State<School> createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'School', theme: darkMode, home: const View());
  }
}

class View extends StatelessWidget {
  const View({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: ModuleHandler.appBar,
      body: ModuleHandler.body,
      // bottomNavigationBar: null,
      bottomNavigationBar: ModuleHandler.bottomAppBar,
    );
  }
}
