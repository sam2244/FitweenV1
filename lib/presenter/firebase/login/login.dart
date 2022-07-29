import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/firebase/login/google.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:get/get.dart';

enum LoginType { google }

class LoginPresenter {
  // 피트윈 로그인
  static Future fwLogin(LoginType type) async {
    final userPresenter = Get.find<UserPresenter>();
    UserCredential? userCredential;

    // 신규회원 여부
    bool isNewcomer = false;

    // 로그인 타입에 따른 로그인 방식
    switch (type) {
      case LoginType.google:
        userCredential = await GoogleLoginPresenter.signInWithGoogle();
    }

    if (userCredential == null) return;

    // 파이어베이스 데이터
    Map<String, dynamic>? json = (await f
        .collection('users')
        .doc(userCredential.user!.uid)
        .get()
    ).data();

    // 파이어베이스에 문서가 없거나 닉네임 필드가 null 일 경우 신규 회원
    isNewcomer = json == null || json['nickname'] == null;

    Map<String, dynamic> data = {};
    data['uid'] = userCredential.user!.uid;
    data['name'] = userCredential.user!.displayName;
    data['email'] = userCredential.user!.email;
    data['regDate'] = Timestamp.now();

    userPresenter.data = {...data};

    // 신규 회원일 경우
    if (isNewcomer) {
      // 회원가입 페이지로 이동
      Get.toNamed('/register');
    }

    // 기존 회원일 경우
    else {
      // 파이어베이스 데이터로 로그인
      FWUser stranger = FWUser.fromJson(json);
      userPresenter.login(stranger);
      MainPresenter.toMain();
    }
  }

  static void fwLogout() {
    final userPresenter = Get.find<UserPresenter>();
    Get.offAllNamed('/login');
    userPresenter.logout();
  }

  static void fwUserDelete(){
    final userPresenter = Get.find<UserPresenter>();
    UserPresenter.deleteDB(userPresenter.loggedUser);
    fwLogout();
  }
}