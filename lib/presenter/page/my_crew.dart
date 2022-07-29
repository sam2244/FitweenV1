import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:get/get.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:flutter/material.dart';


class MyCrewPresenter extends GetxController {
  static ThemeData themeData = Theme.of(Get.context!);
  static final userPresenter = Get.find<UserPresenter>();

  static void periodSearchButtonPressed() {
  }

  bool chatLoading = false;

  void chatPressed(Crew crew) async {
    chatLoading = true; update();
    await ChatPresenter.toChat(crew);
    chatLoading = false; update();
  }
}
