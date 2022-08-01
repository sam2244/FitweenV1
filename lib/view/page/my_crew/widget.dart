/* 내 크루 페이지 위젯 */

import 'package:fitweenV1/global/theme.dart';
import 'package:flutter/material.dart';


class MyCrewPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCrewPageAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(110.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorScheme.background,
      centerTitle: true,
      title: Text('마이크루', style: textTheme.headlineMedium),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          color: colorScheme.primary,
        ),
      ],
    );
  }
}

