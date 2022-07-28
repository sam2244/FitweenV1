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
        child: Text("Fitween"),
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
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                    BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
                ),
                child: IconButton(
                  icon: const Icon(Icons.person),
                  color: Colors.white,
                  iconSize: 45.0,
                  onPressed: () => {},
                ),
              ),
              /*ProfileImageCircle(
                size: 100.0.h,
                user: MyPresenter.userPresenter.user,
                //onPressed: () => controller.profileImagePressed(Theme.of(context)),
              ),*/
            ),
            Text(MyPresenter.userPresenter.loggedUser.nickname!),
          ],
        );
      },
    );
  }
}