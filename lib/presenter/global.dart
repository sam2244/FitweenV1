import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/add_crew/add_crew.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:fitweenV1/view/add_crew/widget.dart';
import 'package:get/get.dart';

class GlobalPresenter extends GetxController {
  static void initControllers() {
    Get.put(GlobalPresenter());
    Get.put(UserPresenter());
    Get.put(MainPresenter());
    Get.put(ChatPresenter());
    Get.put(AddCrewPresenter());
  }
}
