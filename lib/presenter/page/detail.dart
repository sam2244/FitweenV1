/* 상세 페이지 프리젠터 */

import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:get/get.dart';

/// class
class DetailPresenter extends GetxController {
  /// static methods
  // 상세 페이지로 이동
  static Future toDetail(Crew crew) async {
    final detailPresenter = Get.find<DetailPresenter>();
    detailPresenter.selectedCrew = crew;
    await detailPresenter.loadMembers();
    Get.toNamed('/detail');
  }

  /// attributes
  // 선택된 크루
  Crew selectedCrew = Crew();

  /// methods
  // 파이어베이스에서 구성원 정보 로드
  Future loadMembers() async {
    selectedCrew.members = [];
    for (String uid in selectedCrew.memberUids) {
      var json = (await f.collection('users').doc(uid).get()).data();
      if (json == null) return;
      selectedCrew.members.add(FWUser.fromJson(json));
    }
  }

  // 선택된 크루의 리더 객체 반환
  FWUser get leader => selectedCrew.members
      .firstWhere((member) => member.uid == selectedCrew.leaderUid);

  // 참여하기 버튼 클릭 시
  void joinButtonPressed() async {
    final userPresenter = Get.find<UserPresenter>();
    final crewPresenter = Get.find<CrewPresenter>();

    if (!selectedCrew.memberUids.contains(userPresenter.loggedUser.uid!)) {
      selectedCrew.memberUids.add(userPresenter.loggedUser.uid!);
    }
    crewPresenter.saveOne(selectedCrew);
    await loadMembers();

    ChatPresenter.toChat(selectedCrew);
    update();
  }
}
