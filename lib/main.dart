import 'package:flutter/material.dart';
import 'package:schule/components/appbar.dart';
import 'package:schule/components/bottomnavigationbar.dart';
import 'package:schule/components/drawer.dart';
import 'package:flutter/services.dart';
import 'package:schule/module/home/home.dart';
import 'package:schule/module/mainpage.dart';

import 'format/text.dart';

void main() {
  runApp(const Schule());
}

class Schule extends StatelessWidget {
  const Schule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode([SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schule',
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      appBar: MyAppBar(),
      body: MainPageHandler(),
      drawer: MyDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(),

      // create a floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: icon(Icons.add),
      ),
    );
  }
}
