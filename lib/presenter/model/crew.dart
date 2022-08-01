/* 크루 모델 프리젠터 */

import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:get/get.dart';

/// class
class CrewPresenter extends GetxController {
  /// attributes
  // 전체 크루 리스트
  List<Crew> crews = [];

  /// methods
  // 내가 속한 크루 리스트
  List<Crew> get myCrews => crews.where((crew) {
    return crew.memberUids
        .contains(Get.find<UserPresenter>().loggedUser.uid);
  }).toList();

  // 검색어에 따라 필터링된 크루 리스트 반환
  List<Crew> getSearchedCrews(String keyword) {
    List<Crew> filteredCrews = [];
    for (Crew crew in crews) {
      if (crew.title!.contains(keyword)) filteredCrews.add(crew);
    }
    return filteredCrews;
  }

  // 크루 추가
  void addCrew(Crew crew) {
    crews.add(crew); update();
  }

  /* 파이어베이스 관련 */
  // 파이어베이스에서 불러오기
  Future load() async {
    final jsonList = (await f.collection('crews').get()).docs;
    crews = [];
    for (var data in jsonList) {
      Map<String, dynamic> json = data.data();
      addCrew(Crew.fromJson(json));
    }
  }

  // 파이어베이스의 특정 크루 데이터 최신화
  void saveOne(Crew crew) {
    f.collection('crews').doc(crew.code).set(crew.toJson());
  }
}
