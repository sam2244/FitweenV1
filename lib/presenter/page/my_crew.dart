/* 내 크루 페이지 프리젠터 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitweenV1/model/chat.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyCrewPresenter extends GetxController {
  static final refreshCont = RefreshController();

  /// static methods
  // 내 크루 페이지로 이동
  static void toMyCrew() async {
    final myCrewPresenter = Get.find<MyCrewPresenter>();
    // myCrewPresenter.initLatestChats();
    await myCrewPresenter.loadLatestChats();
    Get.offAllNamed('/myCrew');
  }

  /// attributes
  // 채팅 로딩 여부
  bool chatLoading = false;

  // 각 크루의 최근 채팅 리스트(맵)
  List<Chat> latestChats = [];

  // 리프레시 중 실행 함수
  static void onRefresh() async {
    final myCrewPresenter = Get.find<MyCrewPresenter>();
    await myCrewPresenter.loadLatestChats();
    refreshCont.refreshCompleted();
  }

  // 로딩 중 실행 함수
  static void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshCont.loadComplete();
  }

  /* 파이어베이스 변경 사항 실시간 반영 GetX 사용 */
  // void initLatestChats() {
  //   latestChats = [];
  //   final crewPresenter = Get.find<CrewPresenter>();
  //   for (Crew crew in crewPresenter.myCrews) {
  //     latestChats.add(Chat().obs);
  //   }
  // }

  // @override
  // void onInit() async {
  //   final crewPresenter = Get.find<CrewPresenter>();
  //   for (int i = 0; i < crewPresenter.myCrews.length; i++) {
  //     latestChats[i].bindStream(streamLatestChat(crewPresenter.myCrews[i].code!));
  //   }
  //   super.onInit();
  // }
  //
  // Stream<Chat> streamLatestChat(String code) {
  //   Stream<QuerySnapshot> stream = f.collection('rooms').doc(code)
  //       .collection('chats').orderBy('time', descending: true).snapshots();
  //
  //   return stream.map((qShot) {
  //     if (qShot.docs.isEmpty) return Chat();
  //     return qShot.docs.map<Chat>((doc) {
  //       var json = doc.data() as Map<String, dynamic>;
  //       return Chat.fromJson(json);
  //     }).first;
  //   });
  // }
  //
  // //  파이어베이스에서 채팅 데이터를 실시간 로드
  // void load() async {
  //   final crewPresenter = Get.find<CrewPresenter>();
  //   for (int i = 0; i < crewPresenter.myCrews.length; i++) {
  //     await for (Chat chat in streamLatestChat(crewPresenter.myCrews[i].code!)) {
  //       latestChats[i](chat);
  //     }
  //   }
  //   update();
  // }

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
          .collection('chats').orderBy('time', descending: true).get()).docs;
      Chat latestChat = Chat();
      if (jsonList.isNotEmpty) latestChat = Chat.fromJson(jsonList.first.data());
      latestChats.add(latestChat);
    }
    update();
  }

}
