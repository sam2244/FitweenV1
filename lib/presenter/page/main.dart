import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/page/add_crew/add_crew.dart';
import 'package:fitweenV1/presenter/page/detail.dart';
import 'package:get/get.dart';

class MainPresenter extends GetxController {
  static void toMain() {
    final crewPresenter = Get.find<CrewPresenter>();
    Get.offAllNamed('/main');
    crewPresenter.load();
  }

  // 크루 생성 버튼 클릭 시
  static void addCrewButtonPressed() {
    final addCrewPresenter = Get.find<AddCrewPresenter>();
    Get.toNamed('/addCrew');
    addCrewPresenter.newCrew = Crew();
  }

  //검색 버튼 클릭 시
  static void searchIconPressed() {
    Get.toNamed('/search');
  }

  bool detailLoading = false;

  void cardPressed(Crew crew) async {
    detailLoading = true; update();
    await DetailPresenter.toDetail(crew);
    detailLoading = false; update();
  }

  // Crew crew = Crew.fromJson({
  //   'title': 'title',
  //   'tags': ['a', 'b', 'c'],
  //   'startDate': toTimestamp(today.subtract(const Duration(days: 10))),
  //   'endDate': toTimestamp(today.add(const Duration(days: 30))),
  //   'isLocked': false,
  //   'memberLimit': 30,
  // });
}
