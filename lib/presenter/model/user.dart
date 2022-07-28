import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:get/get.dart';

class UserPresenter extends GetxController {

  /// login

  // 불러온 정보
  Map<String, dynamic> data = {};

  // 현재 로그인된 유저
  FWUser loggedUser = FWUser();

  // 로그인 여부
  bool isLogged() => loggedUser.uid != null;

  // 로그인 / 로그아웃
  void login(FWUser user) {
    Map<String, dynamic> json = user.toJson();
    data.forEach((key, value) => json[key] = value);
    loggedUser = FWUser.fromJson(json);
  }
  void logout() { loggedUser = FWUser(); }

  // 데이터베이스에 저장
  void save() => f.collection('users').doc(loggedUser.uid).set(loggedUser.toJson());
}
