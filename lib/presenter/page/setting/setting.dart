/* 설정 페이지 프리젠터 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/firebase/login/login.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/view/widget/function/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 설정 페이지 프리젠터
class SettingPresenter extends GetxController {
  /// static variables
  // 닉네임 텍스트 수정 컨트롤러
  static final nicknameCont = TextEditingController();

  // 상태메세지 텍스트 수정 컨트롤러
  static final statusCont = TextEditingController();

  /// static methods
  // 설정 페이지로 이동
  static void toSetting() => Get.toNamed('/setting');

  // 프로필 이미지 수정 버튼 클릭 시
  static void imageEditButtonPressed() => showAddPhotoSelectionModalSheet();

  // 로그아웃 버튼 클릭 시
  static void logoutButtonPressed() => LoginPresenter.fwLogout();

  // 계정 삭제 버튼 클릭 시
  static void accountDeleteButtonPressed() => showDeleteAccountConfirmDialog();

  // 사진 추가 방식 선택 모달 시트 표시
  static void showAddPhotoSelectionModalSheet() {
    Map<String, VoidCallback> buttonData = {
      '카메라': Get.back,
      '갤러리': Get.back,
    };
    showFWModalBottomSheet(buttonData);
  }

  // 계정삭제 확인 창 표시
  static void showDeleteAccountConfirmDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('계정 삭제 확인'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const [Text('계정을 정말 삭제하시겠습니까?')],
          ),
        ),
        actions: [
          TextButton(
            onPressed: LoginPresenter.fwDeleteAccount,
            child: Text('확인',
              style: TextStyle(color: colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }

  /// methods
  // 닉네임 제출 시
  void nicknameSubmitted() {
    final userPresenter = Get.find<UserPresenter>();

    if (nicknameCont.text == '') return;
    userPresenter.loggedUser.nickname = nicknameCont.text;
    nicknameCont.clear();
    Get.back();
    update();
  }

  // 상태메세지 제출 시
  void statusSubmitted() {
    final userPresenter = Get.find<UserPresenter>();

    if (statusCont.text == '') return;
    userPresenter.loggedUser.statusMessage = statusCont.text;
    statusCont.clear();
    Get.back();
    update();
  }
}