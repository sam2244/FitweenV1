/* 메인 페이지 프리젠터 */

import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/page/detail.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// class
class MainPresenter extends GetxController {
  /// static variables
  // 리프레시 컨트롤러
  static final refreshCont = RefreshController(initialRefresh: false);

  /// static methods
  // 메인 페이지로 이동
  static void toMain() async {
    final crewPresenter = Get.find<CrewPresenter>();
    if (crewPresenter.crews.isEmpty) await crewPresenter.load();
    Get.offAllNamed('/main');
  }

  // 리프레시 중 실행 함수
  static void onRefresh() async {
    final crewPresenter = Get.find<CrewPresenter>();
    await crewPresenter.load();
    refreshCont.refreshCompleted();
  }

  // 로딩 중 실행 함수
  static void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshCont.loadComplete();
  }

  /// attributes
  // 로딩 여부
  bool detailLoading = false;

  /// methods
  // 특정 크루 카드 클릭 시
  void crewCardPressed(Crew crew) async {
    detailLoading = true; update();
    await DetailPresenter.toDetail(crew);
    detailLoading = false; update();
  }
}
