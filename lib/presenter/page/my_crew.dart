import 'package:get/get.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:flutter/material.dart';


class MyCrewPresenter extends GetxController {
  static ThemeData themeData = Theme.of(Get.context!);
  static final userPresenter = Get.find<UserPresenter>();

  //사용자 모델
  static const String defaultProfile = 'https://www.lottehotelmagazine.com/resources/a695633d-c984-4b00-bb2b-54a065abb9bc_img_travel_running_detail05.jpg';

  static void periodSearchButtonPressed() {
  }
}
