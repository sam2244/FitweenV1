import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitweenV1/model/chat.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/model/user.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatPresenter extends GetxController {
  static const imageUrl = 'https://www.iconsdb.com/icons/preview/black/guest-xxl.png';
  static final messageCont = TextEditingController();

  int count = 0;
  Crew? currentCrew = Crew();

  static void toChat() {
    final chatPresenter = Get.find<ChatPresenter>();
    Get.toNamed('/chat');
    chatPresenter.load();
  }

  final chats = <Chat>[].obs;

  List<FWUser> get members => currentCrew?.members ?? [];

  String? getImageUrl(String uid) => members.firstWhereOrNull((member) => member.uid == uid)?.imageUrl;
  String? getNickname(String uid) => members.firstWhereOrNull((member) => member.uid == uid)?.nickname;

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

  void messageSubmitted() {
    final userPresenter = Get.find<UserPresenter>();
    if (messageCont.text == '') return;
    Chat chat = Chat.fromJson({
      'date': Timestamp.now(),
      'text': messageCont.text,
      'uid': userPresenter.loggedUser.uid,
    });

    addChat(chat);
    if (count++ < 2) saveOne(chat);
    messageCont.clear();
  }

  void load() async {
    final crewPresenter = Get.find<CrewPresenter>();

    // 'Y308YKQ'
    currentCrew = crewPresenter.crews.firstWhereOrNull((crew) => crew.code == 'Y308YKQ');

    if (currentCrew == null) return;

    for (String uid in currentCrew!.memberUids) {
      final json = (await f.collection('users').doc(uid).get()).data();
      if (json == null) return;
      currentCrew!.members = [];
      currentCrew!.members.add(FWUser.fromJson(json));
    }

    final jsonList = (await f
        .collection('rooms')
        .doc(currentCrew!.code)
        .collection('chats')
        .orderBy('date')
        .get()
    ).docs;

    chats.clear();
    for (var data in jsonList) {
      Map<String, dynamic> json = data.data();
      addChat(Chat.fromJson(json));
    }
  }

  void saveOne(Chat chat) {
    f.collection('rooms')
        .doc('Y308YKQ')
        .collection('chats').add(chat.toJson());
  }

}