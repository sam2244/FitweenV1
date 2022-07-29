import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:get/get.dart';

class SearchPresenter extends GetxController {
  List<Crew> searchedCrews = [];

  void searchButtonPressed(String keyword) {
    final crewPresenter = Get.find<CrewPresenter>();
    searchedCrews = [...crewPresenter.getSearchedCrews(keyword)];
    update();
  }
}
