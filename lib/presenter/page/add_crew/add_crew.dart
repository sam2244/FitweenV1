import 'package:fitweenV1/global/date.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 참여방법 (대면, 비대면) ; categories[0]
enum ParticipationMethod {
  online, offline;
  String get kr => ['대면', '비대면'][index];
}

// 빈도 (매일, 매주, 매월) ; categories[1]
enum Frequency {
  daily, weekly, monthly;
  String get kr => ['매일', '매주', '매월'][index];
}

class AddCrewPresenter extends GetxController {
  static final crewCont = TextEditingController();
  static final timesCont = TextEditingController();
  static final descCont = TextEditingController();

  ParticipationMethod method = ParticipationMethod.offline;
  /* 시작일 ~ 종료일 을 나타내는 워딩과 혼동을 방지하기 위해 period -> frequency 로 바꿨습니다 */
  Frequency frequency = Frequency.daily;

  // 새로운 크루
  Crew newCrew = Crew();

  void clearConts() {
    crewCont.clear();
    timesCont.clear();
    descCont.clear();
  }

  // 참여방식을 설정
  void setMethod(ParticipationMethod? value) {
    method = value!;
    timesCont.clear();
    update();
  }

  // 빈도를 설정
  void setFrequency(Frequency? value) {
    frequency = value!;
    update();
  }

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
  }

  void submitted() {
    final userPresenter = Get.find<UserPresenter>();
    final crewPresenter = Get.find<CrewPresenter>();

    newCrew.title = crewCont.text;
    newCrew.desc = descCont.text;
    newCrew.categories = [method.kr,
      frequency == Frequency.daily
          ? frequency.kr
          : '${frequency.kr.substring(1)}${timesCont.text}회',
    ];
    newCrew.leaderUid = userPresenter.loggedUser.uid!;
    newCrew.memberUids.add(userPresenter.loggedUser.uid!);

    crewPresenter.addCrew(newCrew);
    crewPresenter.saveOne(newCrew);

    MainPresenter.toMain();
    clearConts();
  }
}
