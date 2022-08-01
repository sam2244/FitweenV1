/* 상태메세지 수정 페이지 프리젠터 */

import 'package:get/get.dart';

/// class
class EditStatusPresenter extends GetxController {
  /// static methods
  // 닉네임 수정 페이지로 이동
  static void toEditStatus() => Get.toNamed('/editStatus');
}