/* 사용자 모델 구조 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitweenV1/global/date.dart';
import 'package:get/get.dart';

/// enums
// 성별 { 남성, 여성 }
enum Sex {
  male, female;
String get kr => ['남성', '여성'][index];
}

/// class
class FWUser {
  /// static variables
  // 사용자의 기본 프로필 사진
  static const String defaultImageUrl = 'https://firebasestorage.googleapis.com/v0/b/fitween-v1-1.appspot.com/o/users%2Fguest.png?alt=media&token=d0c5908c-57a0-4d1d-9277-57c0cd23acd5';

  /// attributes
  // uid
  String? uid;

  // 이름
  String? name;

  // 닉네임
  String? nickname;

  // 상태메시지
  String? statusMessage;

  // 성별
  Sex? sex;

  // 가입일
  Timestamp? _regDate;

  // 생년월일
  Timestamp? _dateOfBirth;

  // 프로필 이미지 주소
  String? imageUrl;

  // 진행 중인 크루의 코드 리스트
  List<String> ongoingCodes = [];

  // 완료한 크루의 코드 리스트
  List<String> doneCodes = [];

  // 친구의 uid 리스트
  List<String> friendUids = [];

  /// accessors & mutators
  // 가입일 getter
  DateTime? get regDate => _regDate?.toDate();

  // 생년월일 getter
  DateTime? get dateOfBirth => _dateOfBirth?.toDate();

  // 가입일 setter
  set regDate(DateTime? date) => _regDate = toTimestamp(date);

  // 생년월일 setter
  set dateOfBirth(DateTime? date) => _dateOfBirth = toTimestamp(date);

  // 생년월일을 문자열 형태로 반환
  String? get dateOfBirthString => dateToString('yyyy-MM-dd', dateOfBirth);

  /// constructors
  // 기본 생성자
  FWUser() {
    // 프로필 이미지 주소를 기본값으로 설정
    imageUrl = defaultImageUrl;
  }

  // json 데이터를 통해 객체를 생성하는 생성자
  FWUser.fromJson(Map<String, dynamic> json) {
    fromJson(json);

    // json 데이터에 프로필 이미지 주소가 없을 경우 기본값으로 설정
    imageUrl ??= defaultImageUrl;
  }

  /// methods
  // json 데이터에 시작일 및 종료일 정보가 없을 경우 오늘 날짜 지정
  void fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    nickname = json['nickname'];
    statusMessage = json['statusMessage'];
    sex = toSex(json['sex']);
    _regDate = json['regDate'];
    _dateOfBirth = json['dateOfBirth'];
    imageUrl = json['imageUrl'];
    ongoingCodes = (json['ongoingIds'] ?? []).cast<String>();
    doneCodes = (json['doneIds'] ?? []).cast<String>();
    friendUids = (json['friendUids'] ?? []).cast<String>();
  }

  // 객체의 json 데이터 추출
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['uid'] = uid;
    json['name'] = name;
    json['nickname'] = nickname;
    json['statusMessage'] = statusMessage;
    json['sex'] = sex?.name;
    json['regDate'] = _regDate;
    json['dateOfBirth'] = _dateOfBirth;
    json['imageUrl'] = imageUrl;
    json['ongoingIds'] = ongoingCodes;
    json['doneIds'] = doneCodes;
    json['friendUids'] = friendUids;
    return json;
  }

  // 문자열을 성별 enum 으로 전환 ('male' => Sex.male)
  static Sex? toSex(String? string) => Sex.values.firstWhereOrNull(
        (sex) => sex.name == string,
  );
}
