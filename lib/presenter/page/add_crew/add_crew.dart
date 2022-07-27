import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ParticipationMethod { online, offline }

class AddCrewPresenter extends GetxController {
  static final crewCont = TextEditingController();
  ParticipationMethod method = ParticipationMethod.offline;
  String period = '매일';
  // Crew plan = crewPresenter.crew;
  DateTime? startDate = DateTime.now();
  DateTime? endDate = DateTime.now();

  void changeMethod(ParticipationMethod value) {
    method = value;
    update();
  }

  void changePeriod(String value) {
    period = value;
    update();
  }

  void syncStart() {
    if (endDate!.isBefore(startDate!)) {
      startDate = endDate;
    }
  }

  void syncEnd() {
    if (startDate!.isAfter(endDate!)) {
      endDate = startDate!;
    }
  }

  void startDateSelected() async {
    Future<DateTime?> date = showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 999)),
    );
    startDate = (await date)!;
    if (startDate == null) return;

    syncEnd();
    update();
  }

  void endDateSelected() async {
    Future<DateTime?> date = showDatePicker(
      context: Get.context!,
      initialDate: endDate!,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 999)),
    );
    endDate = (await date)!;
    if (endDate == null) return;

    syncStart();
    update();
  }
}
