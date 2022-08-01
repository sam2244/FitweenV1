/* 이름 수정 페이지 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/page/setting/setting.dart';
import 'package:fitweenV1/view/page/setting/edit_nickname/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNicknamePage extends StatelessWidget {
  const EditNicknamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPresenter>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: const EditNicknameAppBar(),
          body: Center(
            child: Column(
              children: const [
                NicknameTextField(),
              ],
            ),
          ),
        );
      }
    );
  }
}
