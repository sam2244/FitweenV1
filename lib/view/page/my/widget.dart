import 'package:fitweenV1/presenter/page/my.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// 마이 페이지의 위젯 모음

// 마이 페이지 앱바
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text("마이페이지"),
      ),
      leadingWidth: 600.0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {},
          //onPressed: MyPresenter.settingPressed,
        ),
      ],
      elevation: 0.0,
    );
  }
}

class MyProfileImage extends StatelessWidget {
  const MyProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyPresenter>(
      builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0.h),
              child: const Text("profile image"),
              /*ProfileImageCircle(
                size: 100.0.h,
                user: MyPresenter.userPresenter.user,
                //onPressed: () => controller.profileImagePressed(Theme.of(context)),
              ),*/
            ),
            const Text("이름"),
          ],
        );
      },
    );
  }
}