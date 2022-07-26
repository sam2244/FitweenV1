import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/view/chat.dart';
import 'package:get/get.dart';

class GlobalPresenter extends GetxController {
  static void initControllers() {
    Get.put(GlobalPresenter());
    Get.put(UserPresenter());
    Get.put(ChatPresenter());
  }
}