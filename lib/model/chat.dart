import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Chat {
  String? uid;
  Timestamp? _date;
  String? text;
  String? imageUrl;

  DateTime? get date => _date?.toDate();
  set date(DateTime? date) => _date = Timestamp.fromDate(date!);
  String? get timeString => DateFormat('hh:mm a').format(date!);

  Chat();

  Chat.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    _date = json['date'];
    text = json['text'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['uid'] = uid;
    json['date'] = _date;
    json['text'] = text;
    json['imageUrl'] = imageUrl;
    return json;
  }
}