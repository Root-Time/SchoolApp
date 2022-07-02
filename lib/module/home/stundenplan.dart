import 'package:flutter/material.dart';
import 'package:schule/widget/container.dart';

import '../../widget/display.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          sideBar(),
          Expanded(child: stunden()),
          // MyText("Stunden", style: TextStyle(fontSize: 60)),
        ],
      ),
    );
  }
}

PageView stunden() => PageView(
      children: [
        week(),
        week(),
        week(),
        week(),
      ],
    );

Row week() {
  return Row(
    children: [
      day('Mon'),
      day('Tue'),
      day('Wed'),
      day('Thu'),
      day('Fri'),
    ],
  );
}

day(String weekday) {
  return Expanded(
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        stundenBox(weekday),
        stundenBox('M'),
        stundenBox('D'),
        stundenBox('E'),
        stundenBox('G'),
        stundenBox('G'),
        stundenBox('S'),
      ],
    ),
  );
}

stundenBox(number) {
  return SizedBox(
    height: 50,
    child: Container(
      decoration: debugBorder,
      child: Center(
          child:
              MyText(number.toString(), style: const TextStyle(fontSize: 20))),
    ),
  );
}

Container sideBar() {
  return Container(
      alignment: Alignment.centerLeft,
      decoration: debugBorder,
      width: 50,
      child: Column(
        // mainAxisAlignment: ,
        children: [
          stundenBoxSideBar('M'),
          stundenBoxSideBar(1),
          stundenBoxSideBar(2),
          stundenBoxSideBar(3),
          stundenBoxSideBar(4),
          stundenBoxSideBar(5),
          stundenBoxSideBar(6),
        ],
      ));
}

SizedBox stundenBoxSideBar(number) {
  return SizedBox(
    width: 50,
    height: 50,
    child: Container(
      decoration: debugBorder,
      child: Center(
          child:
              MyText(number.toString(), style: const TextStyle(fontSize: 20))),
    ),
  );
}
