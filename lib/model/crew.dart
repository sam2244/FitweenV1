import 'package:cloud_firestore/cloud_firestore.dart';

class Crew {
  String? code;
  String? title;
  String? desc;
  List<String> categories = [];
  List<String> tags = [];
  Timestamp? startDate;
  Timestamp? endDate;
  bool isLocked = false;
  List<String> memberUids = [];
  String? pacemakerUid;

  Crew();

  void fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    desc = json['desc'];
    categories = json['categories'].cast<String>();
    tags = json['tags'].cast<String>();
    startDate = json['startDate'];
    endDate = json['endDate'];
    isLocked = json['isLocked'];
    memberUids = json['memberUids'].cast<String>();
    pacemakerUid = json['friendUids'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['code'] = code;
    json['title'] = title;
    json['desc'] = desc;
    json['categories'] = categories;
    json['tags'] = tags;
    json['startDate'] = startDate;
    json['endDate'] = endDate;
    json['isLocked'] = isLocked;
    json['memberUids'] = memberUids;
    json['pacemakerUid'] = pacemakerUid;
    return json;
  }
}