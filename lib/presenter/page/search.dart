/* 검색 페이지 프리젠터 */

import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// class
class SearchPresenter extends GetxController {
  /// static variables
  static final queryCont = TextEditingController();

  /// static methods
  static void toSearch() => Get.toNamed('/search');

  static void clearButtonPressed() {
    if (queryCont.text.isEmpty) { Get.back(); }
    else {
      queryCont.text = '';
      // showSuggestions(Get.context!);
    }
  }

  /// attributes
  // 검색된 크루 리스트
  List<Crew> searchedCrews = [];

  /// methods
  // 쿼리 검색
  void search(String query) {
    final crewPresenter = Get.find<CrewPresenter>();
    searchedCrews = [...crewPresenter.getSearchedCrews(query)];
    update();
  }
}
