import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/add_crew.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:fitweenV1/presenter/page/detail.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:fitweenV1/presenter/page/my.dart';
import 'package:fitweenV1/presenter/page/search.dart';
import 'package:fitweenV1/presenter/page/setting/edit_nickname.dart';
import 'package:fitweenV1/presenter/page/setting/edit_status.dart';
import 'package:fitweenV1/presenter/page/setting/setting.dart';
import 'package:fitweenV1/presenter/page/my_crew.dart';
import 'package:fitweenV1/presenter/page/register.dart';
import 'package:get/get.dart';

class GlobalPresenter extends GetxController {
  int navIndex = 0;

  void navigate(int index) {
    navIndex = index;

    switch (navIndex) {
      case 0: MainPresenter.toMain(); break;
      case 1: MyCrewPresenter.toMyCrew(); break;
      case 2: MyPresenter.toMy(); break;
    }
    update();
  }

  static void profileImagePressed() {}

  static void initControllers() {
    Get.put(GlobalPresenter());
    Get.put(UserPresenter());
    Get.put(CrewPresenter());
    Get.put(RegisterPresenter());
    Get.put(MainPresenter());
    Get.put(DetailPresenter());
    Get.put(ChatPresenter());
    Get.put(AddCrewPresenter());
    Get.put(MyPresenter());
    Get.put(MyCrewPresenter());
    Get.put(SearchPresenter());
    Get.put(SettingPresenter());
    Get.put(EditNicknamePresenter());
    Get.put(EditStatusPresenter());
  }
}
