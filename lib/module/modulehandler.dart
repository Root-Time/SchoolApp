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
  static final BehaviorSubject<int> _page = BehaviorSubject<int>.seeded(0);

  static Stream<Module> get module$ => _module.stream;
  static Stream<int> get page$ => _page.stream;
  static Module get module => _module.value;
  static int get pageIndex => _page.value;

  static void setModule(Module module) {
    _module.sink.add(module);
    _page.sink.add(0);
  }

  static void setPage(int page, {bool change = true}) {
    if ((page - _page.value).abs() > 1) {
      return module.changePage(page);
    }
    if (change) {
      module.changePage(page);
    }

    _page.sink.add(page);
  }

  static void pageChanger(int index, setState) {
    return pageStreamState(index, setState);
  }

  static Widget get page => const PageStream();
  static Widget get bottomAppBar => ModuleStream("bottomAppBar");
  static PreferredSizeWidget get appBar => ModuleStream("appBar");
  static Widget get body => ModuleStream("body");
}

class ModuleStream extends StatelessWidget with PreferredSizeWidget {
  ModuleStream(this.data, {Key? key}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ModuleHandler.module$,
      builder: (BuildContext _, AsyncSnapshot snapshot) {
        return snapshot.hasData ? snapshot.data[data] : const SizedBox.shrink();
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

void pageStreamState(int index, setState) {
  StreamBuilder(
      stream: ModuleHandler.page$,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? setState(() {
                index = snapshot.data as int;
              })
            : const SizedBox.shrink();
      });
}

class PageStream extends StatelessWidget {
  const PageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ModuleHandler.page$,
        builder: (_, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Text(snapshot.data.toString())
              : const SizedBox.shrink();
        });
  }
}

// to create a new Module
class Module extends StatelessWidget {
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

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
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
        onPageChanged: (value) {
          ModuleHandler.setPage(value, change: false);
        },
      );

  operator [](Object? key) {
    switch (key) {
      case 'body':
        return body;
      case 'appBar':
        return appBar;
      case 'bottomAppBar':
        return bottomAppBar;
      default:
        throw Exception('$key is not a valid key');
    }
  }
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