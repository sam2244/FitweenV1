/* 사용자 모델 프리젠터 */

import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:get/get.dart';

/// class
class UserPresenter extends GetxController {
  /// attributes
  /* 로그인 관련 */
  // User Credential 정보
  Map<String, dynamic> data = {};

  // 현재 로그인된 사용
  FWUser loggedUser = FWUser();

  // 로그인 여부
  bool get isLogged => loggedUser.uid != null;

  final notifications = <Map<String, dynamic>>[].obs;

  /// methods
  /* 로그인 관련 */
  // 로그인
  // 매개변수로 받은 사용자 정보와 User Credential 정보를 병합하여 현재 로그인된 사용자자 최신화
  void login(FWUser user) {
    Map<String, dynamic> json = user.toJson();
    data.forEach((key, value) => json[key] = value);
    loggedUser = FWUser.fromJson(json);
  }

  // 로그아웃
  // 현재 로그인된 사용자 정보 초기화
  void logout() { loggedUser = FWUser(); }

  /* 파이어베이스 관련 */
  // 파이어베이스에 최신화
  void save() => f.collection('users').doc(loggedUser.uid).set(loggedUser.toJson());

  // 파이어베이스에서 삭제
  void delete() => f.collection('users').doc(loggedUser.uid).delete();

  /* 파이어베이스 변경 사항 실시간 반영 GetX 사용 */
//   @override
//   void onInit() async {
//     notifications.bindStream(streamNotification());
//     super.onInit();
//   }
//
//   Stream<List<Map<String, dynamic>>> streamNotification() {
//     Stream<DocumentSnapshot> stream = f.collection('users').doc(loggedUser.uid).snapshots();
//     return stream.map((dShot) => dShot.data() as Map<String, dynamic>).toList();
//   }
//
//    // 파이어베이스에서 채팅 데이터를 실시간 로드
//   void load() async {
//     await for (List<Chat> chatList in streamChat()) { chats(chatList); scrollDown(); }
//   }
//
//   // 추가된 채팅 데이터를 파이어베이스에 저장
//   void saveOne(Chat chat) {
//     f.collection('rooms')
//         .doc(currentCrew!.code)
//         .collection('chats').add(chat.toJson());
//   }
}
