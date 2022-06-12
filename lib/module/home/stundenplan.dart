import 'package:flutter/material.dart';

import '../../format/text.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.greenAccent,
            Colors.blueAccent,
          ],
        ),
      ),
      child: Center(
        child: text('Schule'),
      ),
    );
  }
}
