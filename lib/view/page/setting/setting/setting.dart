/* 설정 페이지 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/view/page/setting/setting/widget.dart';
import 'package:fitweenV1/view/widget/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

// 세팅 페이지
class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: const SettingAppBar(),
      body: Center(
        child: Column(
          children: const [
            MyProfileImageButton(),
            NameTextField(),
            StatusMessageTextField(),
            Expanded(child: SizedBox()),
            LogoutButton(),
            DeleteUserButton(),
          ],
        ),
      ),
      bottomNavigationBar: const FWBottomBar(),
    );
  }
}
