import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../widget/display.dart';
import 'bus/bus.dart';
import 'home/home.dart';

// loaded Modules
List<Module> modules = [
  home,
  bus,
];

Module currentModule = home;
Widget currentPage = home.pages?[1];

// Handels the module switching

class ModuleHandler {
  static final BehaviorSubject<Module> _module =
      BehaviorSubject<Module>.seeded(home);
  static final BehaviorSubject<int> _page = BehaviorSubject<int>.seeded(1);

  static Stream<Module> get module$ => _module.stream;
  static Stream<int> get page$ => _page.stream;

  static void setModule(Module module) {
    _module.sink.add(module);
    _page.sink.add(1);
  }

  static void setPage(int page) {
    _page.sink.add(page);
  }
}

class MyStreamBuilder extends StatelessWidget with PreferredSizeWidget {
  MyStreamBuilder(this.data, {Key? key}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ModuleHandler.module$,
      builder: (BuildContext acontext, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? snapshot.data[data] as Widget
            : const SizedBox.shrink();
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// to create a new Module
class Module extends StatelessWidget with Map {
  // final String name;
  final IconData icondata;
  // final Widget? body;
  final Widget? appBar;
  final Widget? bottomAppBar;
  final Widget? bottomNavigationBar;
  final List? pages;

  Module({
    // required this.name,
    required this.icondata,
    // required this.body,
    // this.body,
    this.pages,
    this.appBar,
    this.bottomAppBar,
    this.bottomNavigationBar,
  });
  void changePage(int index) {
    currentPage = pages?[index];
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 600), curve: Curves.ease);
  }

  PageController pageController = PageController();
  get icon => MyIcon(icondata);
  String get name => body.toString();
  // get body => pages;

  @override
  Widget build(BuildContext context) {
    return body;
  }

  get body => PageView(
        controller: pageController,
        // scrollDirection: Axis.vertical,
        children: [...?pages],
      );

  @override
  operator [](Object? key) {
    switch (key) {
      case 'body':
        return body;
      case 'appBar':
        return appBar;
      case 'bottomAppBar':
        return bottomAppBar;
      default:
        throw Exception('No such key');
    }
  }

  @override
  void operator []=(key, value) {
    // TODO: implement []=
  }

  @override
  void addAll(Map other) {
    // TODO: implement addAll
  }

  @override
  void addEntries(Iterable<MapEntry> newEntries) {
    // TODO: implement addEntries
  }

  @override
  Map<RK, RV> cast<RK, RV>() {
    // TODO: implement cast
    throw UnimplementedError();
  }

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  bool containsKey(Object? key) {
    // TODO: implement containsKey
    throw UnimplementedError();
  }

  @override
  bool containsValue(Object? value) {
    // TODO: implement containsValue
    throw UnimplementedError();
  }

  @override
  // TODO: implement entries
  Iterable<MapEntry> get entries => throw UnimplementedError();

  @override
  void forEach(void Function(dynamic key, dynamic value) action) {
    // TODO: implement forEach
  }

  @override
  // TODO: implement isEmpty
  bool get isEmpty => throw UnimplementedError();

  @override
  // TODO: implement isNotEmpty
  bool get isNotEmpty => throw UnimplementedError();

  @override
  // TODO: implement keys
  Iterable get keys => throw UnimplementedError();

  @override
  // TODO: implement length
  int get length => throw UnimplementedError();

  @override
  Map<K2, V2> map<K2, V2>(
      MapEntry<K2, V2> Function(dynamic key, dynamic value) convert) {
    // TODO: implement map
    throw UnimplementedError();
  }

  @override
  putIfAbsent(key, Function() ifAbsent) {
    // TODO: implement putIfAbsent
    throw UnimplementedError();
  }

  @override
  remove(Object? key) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  void removeWhere(bool Function(dynamic key, dynamic value) test) {
    // TODO: implement removeWhere
  }

  @override
  update(key, Function(dynamic value) update, {Function()? ifAbsent}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  void updateAll(Function(dynamic key, dynamic value) update) {
    // TODO: implement updateAll
  }

  @override
  // TODO: implement values
  Iterable get values => throw UnimplementedError();
}

// // add module to modules list
// addModule(String name, Widget page, IconData icon) {
//   Module module = Module(name: name, page: page, icon: icon);
//   modules.add(module);
// }

// ModuleBody body = ModuleBody();
// ModuleAppBar appBar = ModuleAppBar();
// ModuleBottomAppBar bottomAppBar = ModuleBottomAppBar();

// void setModule(Module page) {
//   body.setModule(page);
//   appBar.setModule(page);
//   bottomAppBar.setModule(page);
// }

// class ModuleBody {
//   final BehaviorSubject _module = BehaviorSubject.seeded(home.body);

//   Stream get stream$ => _module.stream;
//   Module get current => _module.value;

//   void setModule(Module module) {
//     currentModule = module;
//     _module.add(module.body);
//   }
// }

// class ModuleAppBar {
//   final BehaviorSubject _appBar = BehaviorSubject.seeded(home.appBar);

//   Stream get stream$ => _appBar.stream;
//   Scaffold get current => _appBar.value;

//   void setModule(module) {
//     _appBar.add(module.appBar);
//   }
// }

// class ModuleBottomAppBar {
//   final BehaviorSubject _bottomAppBar =
//       BehaviorSubject.seeded(home.bottomAppBar);

//   Stream get stream$ => _bottomAppBar.stream;
//   Scaffold get current => _bottomAppBar.value;

//   void setModule(Module module) {
//     _bottomAppBar.add(module.bottomAppBar);
//   }
// }