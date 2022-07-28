import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPresenter extends GetxController {
  static final nicknameCont = TextEditingController();

  FWUser newcomer = FWUser();

  // 생년월일 설정
  void setDateOfBirth(DateTime? date) {
    if (date == null) return;
    newcomer.dateOfBirth = date; update();
  }

  // 성별 설정
  void setSex(Sex? sex) {
    if (sex == null) return;
    newcomer.sex = sex; update();
  }

  // 가입완료 버튼 클릭 시
  void submitted() {
    final userPresenter = Get.find<UserPresenter>();

    // 닉네임, 생년월일 설정
    newcomer.nickname = nicknameCont.text;

    // 로그인
    userPresenter.login(newcomer);

    // 파이어베이스에 저장
    userPresenter.save();
    MainPresenter.toMain();
  }
}