import 'package:fitweenV1/global/config/theme.dart';
import 'package:fitweenV1/presenter/model/user.dart';
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
      actions: const [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.black
          ),
          onPressed: MyPresenter.settingPressed,
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
    return GetBuilder<UserPresenter>(
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
                child: Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50.0),
                    onTap: MyPresenter.profileImageChange,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: FWTheme.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Image.network(controller.loggedUser.imageUrl!,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(controller.loggedUser.nickname!),
          ],
        );
      },
    );
  }
}
