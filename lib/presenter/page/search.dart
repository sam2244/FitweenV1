/* 검색 페이지 프리젠터 */

import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:get/get.dart';

/// class
class SearchPresenter extends GetxController {
  /// static methods
  // 검색 페이지로 이동
  static void toSearch() => Get.toNamed('/search');

  /// attributes
  // 검색된 크루 리스트
  List<Crew> searchedCrews = [];

  /// methods
  // 검색 버튼 클릭 시
  void searchButtonPressed(String keyword) {
    final crewPresenter = Get.find<CrewPresenter>();
    searchedCrews = [...crewPresenter.getSearchedCrews(keyword)];
    update();
  }
}
