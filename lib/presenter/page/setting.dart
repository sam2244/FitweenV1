import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/firebase/login/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 설정 페이지 프리젠터
class SettingPresenter extends GetxController {
  static final userPresenter = Get.find<UserPresenter>();
  //static ThemeData themeData = Theme.of(Get.context!);
  static final nameCont = TextEditingController();

  void profileImageChange(context, ThemeData themeData) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (BuildContext context) {
        return Container(
          height: 175.h,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 7.5),
                  width: 311.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                        '갤러리',
                        style: TextStyle(
                            color: Colors.white
                        )
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 10.0),
                  width: 311.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                        '카메라',
                        style: TextStyle(
                            color: Colors.white
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 뒤로가기 버튼 클릭 트리거
  void backPressed() {
    Get.back();
  }

  // 뒤로가기 버튼 클릭 트리거
  void backPressedEditName() {
    Get.back();
    nameCont.clear();
  }

  Future editNameDone(String name) async {
    if(nameCont.text != '') {
      userPresenter.loggedUser.nickname = nameCont.text;
      nameCont.clear();
      Get.back();
      update();
    }
  }

  static void editNamePressed() {
    Get.toNamed('/editName');
  }

  static void logoutPressed() {
    LoginPresenter.fwLogout();
    Get.offAllNamed('/login');
  }

  static void deletePressed() {
    LoginPresenter.fwUserDelete();
    Get.offAllNamed('/login');
  }

  static void askDelete() {
    deletePressed();
  }
}