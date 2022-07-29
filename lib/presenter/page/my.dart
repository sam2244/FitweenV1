import 'package:fitweenV1/presenter/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// 마이 페이지 프리젠터
class MyPresenter extends GetxController {

  static ThemeData themeData = Theme.of(Get.context!);

  static void profileImageChange() {
    BuildContext context = Get.context!;
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

  static void settingPressed() {
    Get.toNamed('/setting');
  }
}

