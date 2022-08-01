/* 크루 추가 페이지 프리젠터 */

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitweenV1/global/date.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

/// enums
// 활동방식 { 대면, 비대면 } ; categories[0]
enum ActivityType {
  online, offline;
  String get kr => ['대면', '비대면'][index];
}

// 빈도 { 매일, 매주, 매월 } ; categories[1]
enum Frequency {
  daily, weekly, monthly;
  String get kr => ['매일', '매주', '매월'][index];
}

/// class
class AddCrewPresenter extends GetxController {
  /// static variables
  // 크루 제목 텍스트 수정 컨트롤러
  static final titleCont = TextEditingController();

  // 크루 빈도 수 수정 컨트롤러
  static final countCont = TextEditingController();

  // 크루 설명 텍스트 수정 컨트롤러
  static final descCont = TextEditingController();

  // 크루 태그 텍스트 수정 컨트롤러
  static final tagCont = TextEditingController();

  /// static methods
  // 컨트롤러를 모두 초기화
  void clearConts() {
    titleCont.clear();
    countCont.clear();
    descCont.clear();
    tagCont.clear();
  }
  
  // 크루 추가 페이지로 이동
  static void toAddCrew() {
    final addCrewPresenter = Get.find<AddCrewPresenter>();
    Get.toNamed('/addCrew');
    addCrewPresenter.newCrew = Crew();
  }

  /// attributes
  // 추가될 새 크루
  Crew newCrew = Crew();

  // 활동방식
  ActivityType type = ActivityType.offline;

  // 빈도
  Frequency frequency = Frequency.daily;

  // 태그 리스트
  List<String> tags = [];

  // 이미지 관련
  XFile? image;
  UploadTask? uploadTask;
  String? urlDownload;

  /// methods
  /* 태그 관련 */
  // 태그 추가
  void addTag(String tag) {
    newCrew.tags.add(tag);
    update();
  }

  // 태그 삭제
  void deleteTag(int index) {
    newCrew.tags.removeAt(index);
    update();
  }

  // 활동방식을 설정
  void setType(ActivityType? value) {
    if (value == null) return;
    type = value;
    countCont.clear();
    update();
  }

  // 빈도를 설정
  void setFrequency(Frequency? value) {
    if (value == null) return;
    frequency = value;
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

  // 이미지 선택
  Future selectImage() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  // 이미지 저장
  Future saveImage() async {
    final path = 'crews/${newCrew.code}';
    final file = File(image!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask?.whenComplete(() {});

    urlDownload = await snapshot?.ref.getDownloadURL();
    print('Download Link: $urlDownload');

    submitted();
  }

  // 새 크루 정보 제출 시
  void submitted() {
    final userPresenter = Get.find<UserPresenter>();
    final crewPresenter = Get.find<CrewPresenter>();

    newCrew.title = titleCont.text;
    newCrew.desc = descCont.text;
    newCrew.categories = [
      type.kr,
      frequency == Frequency.daily
          ? frequency.kr
          : '${frequency.kr.substring(1)}${countCont.text}회',
    ];
    newCrew.leaderUid = userPresenter.loggedUser.uid!;
    newCrew.memberUids.add(userPresenter.loggedUser.uid!);
    newCrew.imageUrl = urlDownload;

    crewPresenter.addCrew(newCrew);
    crewPresenter.saveOne(newCrew);

    MainPresenter.toMain();
    clearConts();
  }
}
