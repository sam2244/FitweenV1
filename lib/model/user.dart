import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitweenV1/presenter/page/my_crew.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum Sex {
  male, female;
  String get kr => ['남성', '여성'][index];
}

class FWUser {
  static String defaultImageUrl = 'https://www.iconsdb.com/icons/preview/black/guest-xxl.png';

  String? uid;
  String? name;
  String? nickname;
  Sex? sex;
  Timestamp? _regDate;
  Timestamp? _dateOfBirth;
  String? imageUrl =  MyCrewPresenter.defaultProfile;
  List<String> ongoingIds = [];
  List<String> doneIds = [];
  List<String> friendUids = [];

  DateTime? get regDate => _regDate?.toDate();
  DateTime? get dateOfBirth => _dateOfBirth?.toDate();
  set regDate(DateTime? date) => _regDate = Timestamp.fromDate(date!);
  set dateOfBirth(DateTime? date) => _dateOfBirth = Timestamp.fromDate(date!);

  String? get dateOfBirthString => dateOfBirth == null
      ? null : DateFormat('yyyy-MM-dd').format(dateOfBirth!);

  FWUser() {
    imageUrl ??= defaultImageUrl;
  }

  FWUser.fromJson(Map<String, dynamic> json) {
    fromJson(json);
    imageUrl ??= defaultImageUrl;
  }

  void fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    nickname = json['nickname'];
    sex = toSex(json['sex']);
    _regDate = json['regDate'];
    _dateOfBirth = json['dateOfBirth'];
    imageUrl = json['imageUrl'];
    ongoingIds = (json['ongoingIds'] ?? []).cast<String>();
    doneIds = (json['doneIds'] ?? []).cast<String>();
    friendUids = (json['friendUids'] ?? []).cast<String>();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['uid'] = uid;
    json['name'] = name;
    json['nickname'] = nickname;
    json['sex'] = sex?.name;
    json['regDate'] = _regDate;
    json['dateOfBirth'] = _dateOfBirth;
    json['imageUrl'] = imageUrl;
    json['ongoingIds'] = ongoingIds;
    json['doneIds'] = doneIds;
    json['friendUids'] = friendUids;
    return json;
  }

  FWUser.fromMap(Map<String, dynamic> map) {
    fromMap(map);
  }

  void fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    nickname = map['nickname'];
    imageUrl = map['imageUrl'];
    sex = map['sex'];
    friendUids = map['friendUids'];
  }

  Map<String, dynamic> toMap() => {
    'uid': uid,
    'nickname': nickname,
    'imageUrl': imageUrl,
    'sex': sex,
    'dateOfBirth': dateOfBirth,
    'friendUids': friendUids,
  };

  static Sex? toSex(String? string) => Sex.values.firstWhereOrNull(
      (sex) => sex.name == string,
  );
}
