import 'package:fitweenV1/presenter/page/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// 설정 페이지의 위젯 모음

// 설정 페이지 앱바
class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leading: GetBuilder<SettingPresenter>(
              builder: (controller) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: controller.backPressed,
                );
              }
          ),
          elevation: 0.0,
        )
    );
  }
}

class MyProfileImageButton extends StatelessWidget {
  const MyProfileImageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPresenter>(
        builder: (controller) {
          return Column(
            children: [
              Container(
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
                  onPressed: () => {}
                  //onPressed: () => controller.profileImageChange(context,Theme.of(context)),
                ),
              ),
              TextButton.icon(
                onPressed: () => {},
                //onPressed: () => controller.profileImageChange(context,Theme.of(context)),
                label: const Icon(Icons.add_photo_alternate_outlined, size: 24),
                icon: Text("사진 변경",
                    style: Theme.of(context).textTheme.labelLarge,
                ),
              )
            ],
          );
        }
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPresenter>(
        builder: (controller) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(0.0, 10.0.h, 0.0, 8.0.h),
                      child: Text(
                        "이름",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    OutlinedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                          primary: Colors.white,
                          side: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline)
                      ),
                      onPressed: SettingPresenter.editNamePressed,
                      child: Stack(
                        children: <Widget>[
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.keyboard_arrow_right_outlined)
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                SettingPresenter.userPresenter.loggedUser.nickname!,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPresenter>(
        builder: (controller) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 50.0.h, 0.0, 10.0.h),
                width: 343,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      primary: Colors.white,
                      side: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline)
                  ),
                  //onPressed: () => controller.AddWeight(Theme.of(context)),
                  onPressed: SettingPresenter.logoutPressed,
                  child: const Text(
                    '로그아웃',
                    style: TextStyle(
                      color: Colors.black,
                    )
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}

class DeleteUserButton extends StatelessWidget {
  const DeleteUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPresenter>(
        builder: (controller) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
                width: 343,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    primary: Theme.of(context).colorScheme.error,
                  ),
                  onPressed: () => SettingPresenter.askDelete(),
                  child: const Text(
                    '계정 삭제하기',
                    style: TextStyle(
                      color: Colors.white,
                    )
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}