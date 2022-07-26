import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String? uid;
  String? userImageUrl;
  String? userNickname;
  String? crewCode;
  Timestamp? _date;
  String? text;
  String? imageUrl;

  Chat();

  DateTime? get date => _date?.toDate();

  Chat.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userImageUrl = json['userImageUrl'];
    userNickname = json['userNickname'];
    crewCode = json['crewCode'];
    _date = json['date'];
    text = json['text'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['uid'] = uid;
    json['userImageUrl'] = userImageUrl;
    json['userNickname'] = userNickname;
    json['crewCode'] = crewCode;
    json['date'] = _date;
    json['text'] = text;
    json['imageUrl'] = imageUrl;
    return json;
  }
}