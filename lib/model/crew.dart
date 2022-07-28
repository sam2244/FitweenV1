import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitweenV1/global/date.dart';

class Crew {
  String? code;
  String? title;
  String? desc;
  String? imageUrl;
  List<String> categories = [];
  List<String> tags = [];
  Timestamp? _startDate;
  Timestamp? _endDate;
  bool isLocked = false;
  List<String> memberUids = [];
  String? leaderUid;
  int memberLimit = 100;

  DateTime? get startDate => _startDate?.toDate();
  DateTime? get endDate => _endDate?.toDate();
  set startDate(DateTime? date) => _startDate = Timestamp.fromDate(date!);
  set endDate(DateTime? date) => _endDate = Timestamp.fromDate(date!);

  Crew() {
    generatePlanId();
    startDate = today;
    endDate = today;
  }

  Crew.fromJson(Map<String, dynamic> json) {
    fromJson(json);
    generatePlanId();
    startDate ??= today;
    endDate ??= today;
  }

  void fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    desc = json['desc'];
    categories = (json['categories'] ?? []).cast<String>();
    tags = (json['tags'] ?? []).cast<String>();
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    isLocked = json['isLocked'];
    memberUids = (json['memberUids'] ?? []).cast<String>();
    leaderUid = json['leaderUid'];
    memberLimit = json['memberLimit'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['code'] = code;
    json['title'] = title;
    json['desc'] = desc;
    json['categories'] = categories;
    json['tags'] = tags;
    json['startDate'] = _startDate;
    json['endDate'] = _endDate;
    json['isLocked'] = isLocked;
    json['memberUids'] = memberUids;
    json['leaderUid'] = leaderUid;
    json['memberLimit'] = memberLimit;
    return json;
  }

  void generatePlanId() {
    int length = 7;
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    code = String.fromCharCodes(
      Iterable.generate(length, (_) => chars.codeUnitAt(
        Random().nextInt(chars.length),
      )),
    );
  }
}