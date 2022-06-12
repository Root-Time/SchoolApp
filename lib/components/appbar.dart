import 'package:flutter/material.dart';

import '../format/text.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: text('Schule'),
      actions: [
        IconButton(
          icon: icon(Icons.settings),
          onPressed: () {},
        ),
      ],
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
