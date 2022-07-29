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

  int count = 0;
  Crew? currentCrew;

  static Future toChat(Crew crew) async {
    final chatPresenter = Get.find<ChatPresenter>();
    chatPresenter.count = 0;
    await chatPresenter.load(crew.code!);
    chatPresenter.currentCrew = crew;
    Get.toNamed('/chat');
  }

  List<Chat> chats = [];

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
    if (count++ < 5) {
      saveOne(chat);
      count = 0; return;
    }
    messageCont.clear();
  }

  Future load(String code) async {
    final jsonList = (await f
        .collection('rooms')
        .doc(currentCrew!.code)
        .collection('chats')
        .orderBy('date')
        .get()
    ).docs;

    chats = [];
    for (var data in jsonList) {
      Map<String, dynamic> json = data.data();
      addChat(Chat.fromJson(json));
    }
    update();
  }

  void saveOne(Chat chat) {
    f.collection('rooms')
        .doc(currentCrew!.code)
        .collection('chats').add(chat.toJson());
  }

}