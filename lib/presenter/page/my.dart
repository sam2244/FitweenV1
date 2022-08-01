/* 마이 페이지 프리젠터 */

import 'package:fitweenV1/global/date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// class
class MyPresenter extends GetxController {
  /// static variables
  final format = DateFormat("HH:mm");
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  /*String today = formatter.format(now);
  String startDateTime = "${today} ${_startTimeController.text}";
  String endDateTime = "${today} ${_endTimeController.text}";
  // 검색 시작일 컨트롤러
  static final startdateCont = ;
  // 검색 종료일 컨트롤러
  static final enddateCont = ;*/

  /// static methods
  // 마이 페이지로 이동
  static void toMy() => Get.offAllNamed('/my');

  /*
  // 종료일이 시작일 이전으로 선택될 경우 시작일을 종료일로 재설정
  void syncStart() {
    if (newCrew.startDate == null) return;
    if (newCrew.endDate == null) return;
    if (newCrew.endDate!.isBefore(newCrew.startDate!)) {
      newCrew.startDate = newCrew.endDate;
    }
  }

  // 시작일이 종료일 이후로 선택될 경우 종료일을 시작일로 재설정
  void syncEnd() {
    if (newCrew.startDate == null) return;
    if (newCrew.endDate == null) return;
    if (newCrew.startDate!.isAfter(newCrew.endDate!)) {
      newCrew.endDate = newCrew.startDate;
    }
  }

  // 시작일 버튼 클릭 시
  void startDateButtonPressed() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: today,
      firstDate: today.subtract(const Duration(days: 30)),
      lastDate: today.add(const Duration(days: 999)),
    );
    newCrew.startDate = selectedDate;
    syncEnd();
    update();
  }

  // 종료일 버튼 클릭 시
  void endDateButtonPressed() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: newCrew.endDate ?? today,
      firstDate: today.subtract(const Duration(days: 30)),
      lastDate: today.add(const Duration(days: 999)),
    );
    newCrew.endDate = selectedDate;
    syncStart();
    update();
  }*/
}

