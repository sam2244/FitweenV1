import 'package:fitweenV1/presenter/page/setting.dart';
import 'package:fitweenV1/view/page/setting/widget.dart';
import 'package:fitweenV1/view/widget/widget.dart';
import 'package:flutter/material.dart';

// 세팅 페이지
class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const SettingAppBar(),
      body: Center(
        child: Column(
          children: const [
            MyProfileImageButton(),
            NameTextField(),
            Expanded(child: SizedBox()),
            LogOutButton(),
            DeleteUserButton(),
          ],
        ),
      ),
      bottomNavigationBar: const FWBottomBar(),
    );
  }
}
