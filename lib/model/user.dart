import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

enum Sex {
  male, female;
String get kr => ['남성', '여성'][index];
}

class FWUser {
  String? uid;
  String? name;
  String? nickname;
  Sex? sex;
  Timestamp? regDate;
  String? imageUrl;
  List<String> ongoingIds = [];
  List<String> doneIds = [];
  List<String> friendUids = [];

  FWUser();

  void fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    nickname = json['nickname'];
    sex = toSex(json[json['sex']]);
    regDate = json['regDate'];
    imageUrl = json['imageUrl'];
    ongoingIds = json['ongoingIds'].cast<String>();
    doneIds = json['doneIds'].cast<String>();
    friendUids = json['friendUids'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['uid'] = uid;
    json['name'] = name;
    json['nickname'] = nickname;
    json['sex'] = sex?.name;
    json['regDate'] = regDate;
    json['imageUrl'] = imageUrl;
    json['ongoingIds'] = ongoingIds;
    json['doneIds'] = doneIds;
    json['friendUids'] = friendUids;
    return json;
  }

  static Sex? toSex(String? string) => Sex.values.firstWhereOrNull(
      (sex) => sex.name == string,
  );
}