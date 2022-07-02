import 'package:flutter/material.dart';

import '../../components/app_bar.dart';
import '../../widget/display.dart';
import '../modulehandler.dart';

Module bus = Module(
  // name: 'Bus',
  icondata: Icons.directions_bus,
  pages: const [Bus()],
  appBar: const MyAppBar(title: "Page2"),
  bottomAppBar: const BottomAppBar(
    child: Text('Bus'),
  ),
);

class Bus extends StatelessWidget {
  const Bus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MyText('Page2', style: TextStyle(fontSize: 60)),
      ),
    );
  }
}
