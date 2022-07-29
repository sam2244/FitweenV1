import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:get/get.dart';

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

  void submitted() async {
    final userPresenter = Get.find<UserPresenter>();
    final crewPresenter = Get.find<CrewPresenter>();

    if (!selectedCrew.memberUids.contains(userPresenter.loggedUser.uid!)) {
      selectedCrew.memberUids.add(userPresenter.loggedUser.uid!);
    }
    crewPresenter.saveOne(selectedCrew);
    await loadMembers();
    update();
  }
}
