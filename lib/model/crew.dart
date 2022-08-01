/* 크루 모델 구조 */

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitweenV1/global/date.dart';
import 'package:fitweenV1/model/user.dart';

/// enums
// 크루 상태 { 진행중, 완료 }
enum CrewState {
  ongoing, done;
  String get kr => ['진행중', '완료'][index];
}

/// class
class Crew {

  /// attributes
  // 아이디 (입장 코드)
  String? code;

  // 제목
  String? title;

  // 설명
  String? desc;

  // 배경 이미지 주소
  String? imageUrl;

  // 크루 상태
  CrewState state = CrewState.ongoing;

  // 카테고리 리스트 [ 참여방식,  ]
  List<String> categories = [];

  // 태그 리스트
  List<String> tags = [];

  // 시작일
  Timestamp? _startDate;

  // 종료일
  Timestamp? _endDate;

  // 잠금여부
  bool isLocked = false;

  // 리더의 uid
  String? leaderUid;

  // 구성원의 uid 리스트
  List<String> memberUids = [];

  // 구성원 인원 제한
  int memberLimit = 100;

  /// attributes (after loaded)
  // 구성원 리스트
  List<FWUser> members = [];

  /// accessors & mutators
  // 시작일 getter
  DateTime? get startDate => _startDate?.toDate();

  // 종료일 getter
  DateTime? get endDate => _endDate?.toDate();

  // 시작일 setter
  set startDate(DateTime? date) => _startDate = toTimestamp(date);

  // 종료일 setter
  set endDate(DateTime? date) => _endDate = toTimestamp(date);

  /// constructors
  // 기본 생성자
  Crew() {
    // 무작위 코드 자동 생성
    generateCode();

    // 시작일, 종료일 오늘 날짜로 지정
    startDate = today; endDate = today;
  }

  // json 데이터를 통해 객체를 생성하는 생성자
  Crew.fromJson(Map<String, dynamic> json) {
    fromJson(json);

    // json 데이터에 시작일 및 종료일 정보가 없을 경우 오늘 날짜 지정
    startDate ??= today; endDate ??= today;
  }

  /// methods
  // json 데이터를 통해 속성 최신화
  void fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    desc = json['desc'];
    imageUrl = json['imageUrl'];
    categories = (json['categories'] ?? []).cast<String>();
    tags = (json['tags'] ?? []).cast<String>();
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    isLocked = json['isLocked'];
    memberUids = (json['memberUids'] ?? []).cast<String>();
    leaderUid = json['leaderUid'];
    memberLimit = json['memberLimit'];
  }

  // 객체의 json 데이터 추출
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['code'] = code;
    json['title'] = title;
    json['desc'] = desc;
    json['imageUrl'] = imageUrl;
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

  // 코드를 무작위로 생성
  void generateCode() {
    int length = 7;
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    code = String.fromCharCodes(
      Iterable.generate(length, (_) => chars.codeUnitAt(
        Random().nextInt(chars.length),
      )),
    );
  }

  // 문자열을 크루 상태 enum 으로 전환 ('ongoing' => CrewState.ongoing)
  static CrewState toState(String string) {
    return CrewState.values.firstWhere((state) => state.name == string);
  }
}
