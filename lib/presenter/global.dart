import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:fitweenV1/presenter/page/register.dart';
import 'package:get/get.dart';

class GlobalPresenter extends GetxController {
  static void initControllers() {
    Get.put(GlobalPresenter());
    Get.put(UserPresenter());
    Get.put(RegisterPresenter());
    Get.put(MainPresenter());
    Get.put(ChatPresenter());
  }
}