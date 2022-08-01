/* 닉네임 수정 페이지 프리젠터 */

import 'package:get/get.dart';

/// class
class EditNicknamePresenter extends GetxController {
  /// static methods
  // 닉네임 수정 페이지로 이동
  static void toEditNickname() => Get.toNamed('/editNickname');
}