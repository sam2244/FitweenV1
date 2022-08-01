/* 마이 페이지 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/view/page/my/widget.dart';
import 'package:fitweenV1/view/widget/button/profile_image.dart';
import 'package:fitweenV1/view/widget/widget/bottom_bar.dart';
import 'package:fitweenV1/view/widget/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userPresenter = Get.find<UserPresenter>();
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        children: const [
          /*
          ProfileImageButton(user: userPresenter.loggedUser),
          const SizedBox(height: 10.0),
          Column(
            children: [
              FWText(userPresenter.loggedUser.nickname!,
                style: textTheme.titleLarge,
              ),
              FWText(userPresenter.loggedUser.statusMessage ?? '',
                style: textTheme.bodyMedium,
              ),
            ],
          ),*/
          MyProfileImage(),
          MyCrew(),
        ],
      ),
      bottomNavigationBar: const FWBottomBar(),
    );
  }
}
