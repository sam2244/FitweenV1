/* 채팅 모델 구조 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitweenV1/global/date.dart';

/// class
class Chat {
  /// attributes
  // 채팅을 보낸 사용자의 uid
  String? uid;

  // 채팅 시각
  Timestamp? _time;

  // 채팅 내용 (텍스트)
  String? text;

  // 채팅 내용 (이미지 주소)
  String? imageUrl;

  /// accessors & mutators
  // 채팅 시각 getter
  DateTime? get time => _time?.toDate();

  // 채팅 시각 setter
  set time(DateTime? date) => _time = toTimestamp(date);

  /// constructors
  // 기본 생성자
  Chat();

  // json 데이터를 통해 객체를 생성하는 생성자
  Chat.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  /// methods
  // json 데이터를 통해 속성 최신화
  void fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    _time = json['time'];
    text = json['text'];
    imageUrl = json['imageUrl'];
  }

  // 객체의 json 데이터 추출
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['uid'] = uid;
    json['time'] = _time;
    json['text'] = text;
    json['imageUrl'] = imageUrl;
    return json;
  }

  // 채팅 시각을 문자열 형태로 반환
  String? get timeString => dateToString('hh:mm a', time);
}