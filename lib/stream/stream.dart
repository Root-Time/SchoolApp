import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class StreamHandler {
  final Widget? seedValue;

  StreamHandler(this.seedValue);

  BehaviorSubject get _seed => BehaviorSubject.seeded(seedValue);

  Stream get stream$ => _seed.stream;
  get current => _seed.value;
  void setcurrent(value) {
    _seed.add(value);
  }
}

class MyStreamBuilder extends StatelessWidget with PreferredSizeWidget {
  MyStreamBuilder(this.data, {Key? key}) : super(key: key);
  final StreamHandler data;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: data.stream$,
      builder: (BuildContext acontext, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? snapshot.data as Widget
            : const SizedBox.shrink();
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
