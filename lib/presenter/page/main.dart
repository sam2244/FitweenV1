import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/page/add_crew/add_crew.dart';
import 'package:fitweenV1/presenter/page/detail.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainPresenter extends GetxController {
  static final refreshCont = RefreshController(initialRefresh: false);

  static void toMain() {
    final crewPresenter = Get.find<CrewPresenter>();
    Get.offAllNamed('/main');
  }

  // 크루 생성 버튼 클릭 시
  static void addCrewButtonPressed() {
    final addCrewPresenter = Get.find<AddCrewPresenter>();
    Get.toNamed('/addCrew');
    addCrewPresenter.newCrew = Crew();
  }
  static void searchButtonPressed() {}

  static void onRefresh() async {
    final crewPresenter = Get.find<CrewPresenter>();
    await crewPresenter.load();
    refreshCont.refreshCompleted();
  }

  static void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshCont.loadComplete();
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
