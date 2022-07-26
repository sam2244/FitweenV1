import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum ParticipationMethod { online, offline }

class AddCrewPresenter extends GetxController {
  static final crewCont = TextEditingController();
  ParticipationMethod method = ParticipationMethod.offline;

  void changeMethod(ParticipationMethod value) {
    method = value;
    update();
  }
}
