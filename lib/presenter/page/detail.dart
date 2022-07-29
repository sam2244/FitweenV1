import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:get/get.dart';

import '../model/crew.dart';
import '../model/user.dart';

class DetailPresenter extends GetxController {
  Crew selectedCrew = Crew();

  FWUser get leader => selectedCrew.members
      .firstWhere((member) => member.uid == selectedCrew.leaderUid);

  static Future toDetail(Crew crew) async {
    final detailPresenter = Get.find<DetailPresenter>();
    detailPresenter.selectedCrew = crew;
    await detailPresenter.loadMembers();
    Get.toNamed('/detail');
  }

  Future loadMembers() async {
    selectedCrew.members = [];
    for (String uid in selectedCrew.memberUids) {
      var json = (await f.collection('users').doc(uid).get()).data();
      if (json == null) return;
      selectedCrew.members.add(FWUser.fromJson(json));
    }
  }

  // void modifyCrewMembers(Crew crew) {
  //   Crew target = crews.firstWhere((item) => item.code == crew.code);
  //   target.memberUids = [...crew.memberUids];
  //   update();
  // }

  void submitted() {
    final userPresenter = Get.find<UserPresenter>();
    final crewPresenter = Get.find<CrewPresenter>();

    if (!selectedCrew.memberUids.contains(userPresenter.loggedUser.uid!)) {
      selectedCrew.memberUids.add(userPresenter.loggedUser.uid!);
      update();
    }
    crewPresenter.saveOne(selectedCrew);
  }
}
