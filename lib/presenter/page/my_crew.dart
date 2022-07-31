/* 내 크루 페이지 프리젠터 */

import 'package:fitweenV1/model/chat.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:get/get.dart';


/// class
class MyCrewPresenter extends GetxController {
  /// static methods
  // 내 크루 페이지로 이동
  static void toMyCrew() async {
    final myCrewPresenter = Get.find<MyCrewPresenter>();
    Get.offAllNamed('/myCrew');
    await myCrewPresenter.loadLatestChats();
  }

  /// attributes
  // 채팅 로딩 여부
  bool chatLoading = false;

  // 각 크루의 최근 채팅 리스트
  List<Chat> latestChats = [];

  /// methods
  // 크루 타일 클릭 시
  void crewTilePressed(Crew crew) async {
    chatLoading = true; update();
    await ChatPresenter.toChat(crew);
    chatLoading = false; update();
  }

  // 각 크루의 최근 채팅을 파이어베이스에서 로드
  Future loadLatestChats() async {
    final crewPresenter = Get.find<CrewPresenter>();

    if (latestChats.isNotEmpty) return;
    for (Crew crew in crewPresenter.myCrews) {
      final jsonList = (await f.collection('rooms').doc(crew.code)
          .collection('chats').orderBy('date', descending: true).get()).docs;
      Chat latestChat = Chat();
      if (jsonList.isNotEmpty) latestChat = Chat.fromJson(jsonList.first.data());
      latestChats.add(latestChat);
    }
    update();
  }
}
