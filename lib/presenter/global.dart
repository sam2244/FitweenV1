import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/add_crew/add_crew.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:fitweenV1/presenter/page/my.dart';
import 'package:fitweenV1/presenter/page/register.dart';
import 'package:get/get.dart';

class GlobalPresenter extends GetxController {
  int navIndex = 0;

  void navigate(int index) {
    navIndex = index;
    Get.offAllNamed(['/main', '/myCrew', '/my'][navIndex]);
    update();
  }

  static void initControllers() {
    Get.put(GlobalPresenter());
    Get.put(UserPresenter());
    Get.put(CrewPresenter());
    Get.put(RegisterPresenter());
    Get.put(MainPresenter());
    Get.put(ChatPresenter());
    Get.put(AddCrewPresenter());
    Get.put(MyPresenter());
  }
}
