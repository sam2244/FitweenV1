/* 커스텀 하단 바 위젯 */

import 'package:fitweenV1/presenter/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// class
class FWBottomBar extends StatelessWidget {
  const FWBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalPresenter>(
      builder: (controller) {
        return NavigationBar(
          selectedIndex: controller.navIndex,
          onDestinationSelected: controller.navigate,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.rectangle_outlined),
              selectedIcon: Icon(Icons.rectangle),
              label: 'MyCrew',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              selectedIcon: Icon(Icons.account_circle),
              label: 'MyPage',
            ),
          ],
        );
      },
    );
  }
}
