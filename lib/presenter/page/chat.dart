/* 채팅 페이지 프리젠터 */

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitweenV1/model/chat.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// class
class ChatPresenter extends GetxController {
  /// static variables
  // 채팅 메시지 텍스트 수정 컨트롤러
  static final textCont = TextEditingController();

  // 스크롤 컨트롤러
  static final scrollCont = ScrollController();

  /// static methods
  // 채팅 페이지로 이동
  static Future toChat(Crew crew) async {
    final chatPresenter = Get.find<ChatPresenter>();
    chatPresenter.currentCrew = crew;
    await chatPresenter.loadMembers();
    chatPresenter.load();
    Get.toNamed('/chat');
    scrollDown();
  }

  // 화면 최하단으로 스크롤 내림
  static void scrollDown() {
    if (scrollCont.hasClients) {
      double scrollOffset = scrollCont.position.maxScrollExtent;
      if (scrollOffset > 0) scrollOffset += 40.0;
      scrollCont.animateTo(
        scrollOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
      return;
    }
    Timer(const Duration(milliseconds: 200), scrollDown);
  }

  /// attributes
  // 현재 크루
  Crew? currentCrew;

  // 채팅 데이터
  final chats = <Chat>[].obs;

  /// methods
  // 파이어베이스에서 구성원 정보 로드
  Future loadMembers() async {
    if (currentCrew == null) return;

    Map<String, dynamic>? json;
    currentCrew!.members = [];

    for (String uid in currentCrew!.memberUids) {
      json = (await f.collection('users').doc(uid).get()).data();
      if (json == null) return;
      currentCrew!.members.add(FWUser.fromJson(json));
    }
    update();
  }

  // 현재 크루의 구성원 리스트 반환
  List<FWUser> get members => currentCrew?.members ?? [];

  // 현재 크루의 구성원 중 해당 uid 를 갖는 사용자 반환
  FWUser? getMember(String uid) => members.firstWhereOrNull((member) => member.uid == uid);

  // 현재 크루의 구성원 중 해당 uid 를 갖는 사용자의 프로필 이미지 주소 반환
  String getImageUrl(String uid) => getMember(uid)!.imageUrl!;

  // 현재 크루의 구성원 중 해당 uid 를 갖는 사용자의 닉네임 반환
  String getNickname(String uid) => getMember(uid)!.nickname!;

  // 해당 채팅을 보낸 사용자가 바로 직전 채팅을 보낸 사용자와 일치하지 않는지 여부
  bool isFirstChat(int index) {
    if (index < 1) return true;
    if (index > chats.length - 1) return false;
    return chats[index - 1].uid != chats[index].uid;
  }

  // 해당 채팅이 현재 로그인 되어있는 사용자와 일치 하는지 여부
  bool isMyChat(int index) {
    final userPresenter = Get.find<UserPresenter>();
    return userPresenter.loggedUser.uid == chats[index].uid;
  }

  // 채팅 추가
  void addChat(Chat chat) {
    chats.add(chat); update();
  }

  // 채팅 제출 시
  void chatSubmitted([String? value]) {
    final userPresenter = Get.find<UserPresenter>();
    if (textCont.text == '') return;
    Chat chat = Chat.fromJson({
      'time': Timestamp.now(),
      'text': value ?? textCont.text,
      'uid': userPresenter.loggedUser.uid,
    });

    addChat(chat);
    saveOne(chat);
    textCont.clear();
    scrollDown();
  }

  /* 파이어베이스 변경 사항 실시간 반영 GetX 사용 */
  @override
  void onInit() async {
    if (currentCrew == null) return;
    chats.bindStream(streamChat());
    super.onInit();
  }

  Stream<List<Chat>> streamChat() {
    Stream<QuerySnapshot> stream = f.collection('rooms')
        .doc(currentCrew!.code).collection('chats').orderBy('time').snapshots();
    return stream.map((qShot) => qShot.docs.map<Chat>((doc) {
      var json = doc.data() as Map<String, dynamic>;
      return Chat.fromJson(json);
    }).toList());
  }

  //  파이어베이스에서 채팅 데이터를 실시간 로드
  void load() async {
    await for (List<Chat> chatList in streamChat()) { chats(chatList); scrollDown(); }
  }

  // 추가된 채팅 데이터를 파이어베이스에 저장
  void saveOne(Chat chat) {
    f.collection('rooms')
        .doc(currentCrew!.code)
        .collection('chats').add(chat.toJson());
  }

}