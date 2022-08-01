/* 마이 페이지 프리젠터 */

import 'package:fitweenV1/global/date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// class
class MyPresenter extends GetxController {
  /// static variables
  // 검색 시작일 컨트롤러
  DateTime? startTimeController = DateTime.now();

  // 검색 종료일 컨트롤러
  DateTime? endTimeController = DateTime.now();

  /// static methods
  // 마이 페이지로 이동
  static void toMy() => Get.offAllNamed('/my');

  // 종료일이 시작일 이전으로 선택될 경우 시작일을 종료일로 재설정
  void syncStart() {
    if (startTimeController == null) return;
    if (endTimeController == null) return;
    if (endTimeController!.isBefore(startTimeController!)) {
      startTimeController = endTimeController;
    }
  }

  // 시작일이 종료일 이후로 선택될 경우 종료일을 시작일로 재설정
  void syncEnd() {
    if (startTimeController == null) return;
    if (endTimeController == null) return;
    if (startTimeController!.isAfter(endTimeController!)) {
      endTimeController = startTimeController;
    }
  }

  // 시작일 버튼 클릭 시
  void startDateButtonPressed() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: startTimeController ?? today,
      firstDate: today.subtract(const Duration(days: 30)),
      lastDate: today.add(const Duration(days: 999)),
    );
    startTimeController = selectedDate!;
    syncEnd();
    update();
  }

  // 종료일 버튼 클릭 시
  void endDateButtonPressed() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: endTimeController ?? today,
      firstDate: today.subtract(const Duration(days: 30)),
      lastDate: today.add(const Duration(days: 999)),
    );
    endTimeController = selectedDate!;
    syncStart();
    update();
  }
}

