import 'package:flutter/cupertino.dart';
import 'home/home.dart';
import 'home/stundenplan.dart';

class MainPageHandler extends StatefulWidget {
  const MainPageHandler({Key? key}) : super(key: key);

  @override
  State<MainPageHandler> createState() => _MainPageHandlerState();
}

class _MainPageHandlerState extends State<MainPageHandler> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const <Widget>[
        HomePage(),
        TimeTable(),
      ],
    );
  }
}
