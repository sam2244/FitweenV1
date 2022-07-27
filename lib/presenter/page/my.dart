import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitweenV1/presenter/model/user.dart';


// 마이 페이지 프리젠터
class MyPresenter extends GetxController {

  static ThemeData themeData = Theme.of(Get.context!);
  static final userPresenter = Get.find<UserPresenter>();

  static void settingPressed() {
    Get.toNamed('/setting');
  }
}