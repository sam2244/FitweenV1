import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitweenV1/model/chat.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatPresenter extends GetxController {
  static const imageUrl = 'https://www.iconsdb.com/icons/preview/black/guest-xxl.png';
  static final messageCont = TextEditingController();
  static final scrollCont = ScrollController();

  static Future toChat(Crew crew) async {
    final chatPresenter = Get.find<ChatPresenter>();
    chatPresenter.currentCrew = crew;
    await chatPresenter.loadMembers();
    chatPresenter.load();
    Get.toNamed('/chat');
    chatPresenter.scrollDown();
  }

  Crew? currentCrew;

  final chats = <Chat>[].obs;
  List<FWUser> get members => currentCrew?.members ?? [];

  FWUser? getMember(String uid) => members.firstWhereOrNull((member) => member.uid == uid);
  String getImageUrl(String uid) => getMember(uid)!.imageUrl!;
  String getNickname(String uid) => getMember(uid)!.nickname!;

  bool isFirstChat(int index) {
    if (index < 1) return true;
    if (index > chats.length - 1) return false;
    return chats[index - 1].uid != chats[index].uid;
  }

  bool isMyChat(int index) {
    final userPresenter = Get.find<UserPresenter>();
    return userPresenter.loggedUser.uid == chats[index].uid;
  }

  void addChat(Chat chat) {
    chats.add(chat); update();
  }

  void scrollDown() {
    double scrollOffset = scrollCont.position.maxScrollExtent;
    if (scrollOffset > 0) scrollOffset += 40.0;
    scrollCont.animateTo(
      scrollOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void messageSubmitted() {
    final userPresenter = Get.find<UserPresenter>();
    if (messageCont.text == '') return;
    Chat chat = Chat.fromJson({
      'date': Timestamp.now(),
      'text': messageCont.text,
      'uid': userPresenter.loggedUser.uid,
    });

    addChat(chat);
    saveOne(chat);
    messageCont.clear();
    scrollDown();
  }

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

  @override
  void onInit() async {
    if (currentCrew == null) return;
    chats.bindStream(streamChat());
    super.onInit();
  }

  Stream<List<Chat>> streamChat() {
    Stream<QuerySnapshot> stream = f.collection('rooms')
        .doc(currentCrew!.code).collection('chats').orderBy('date').snapshots();

    return stream.map((qShot) => qShot.docs.map<Chat>((doc) {
      var json = doc.data() as Map<String, dynamic>;
      return Chat.fromJson(json);
    }).toList());
  }

  void load() async {
    await for (List<Chat> chatList in streamChat()) { chats(chatList); }
  }

  // Future load(String code) async {
  //   final jsonList = (await f
  //       .collection('rooms')
  //       .doc(currentCrew!.code)
  //       .collection('chats')
  //       .orderBy('date')
  //       .get()
  //   ).docs;
  //
  //   chats(<Chat>[].obs);
  //   for (var data in jsonList) {
  //     Map<String, dynamic> json = data.data();
  //     addChat(Chat.fromJson(json));
  //   }
  //   update();
  // }
  //
  void saveOne(Chat chat) {
    f.collection('rooms')
        .doc(currentCrew!.code)
        .collection('chats').add(chat.toJson());
  }

}