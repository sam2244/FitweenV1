import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitweenV1/model/chat.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatPresenter extends GetxController {
  static const imageUrl = 'https://www.iconsdb.com/icons/preview/black/guest-xxl.png';
  static final messageCont = TextEditingController();

  List<Chat> chats = [
    Chat.fromJson({
      'date': Timestamp.fromDate(DateTime(2022, 7, 26, 15, 0, 0)),
      'text': '안녕하세요',
      'uid': 'a',
      'userImageUrl': imageUrl,
      'userNickname': '현승준',
    }),
    Chat.fromJson({
      'date': Timestamp.fromDate(DateTime(2022, 7, 26, 15, 0, 0)),
      'text': '상윤햄 바보',
      'uid': 'a',
      'userImageUrl': imageUrl,
      'userNickname': '현승준',
    }),
    Chat.fromJson({
      'date': Timestamp.fromDate(DateTime(2022, 7, 26, 15, 4, 32)),
      'text': '그롬그롬',
      'uid': 'b',
      'userImageUrl': imageUrl,
      'userNickname': '한상윤',
    }),
    Chat.fromJson({
      'date': Timestamp.fromDate(DateTime(2022, 7, 26, 15, 6, 34)),
      'text': '크롱크롱',
      'uid': 'c',
      'userImageUrl': imageUrl,
      'userNickname': '정윤석',
    }),
    Chat.fromJson({
      'date': Timestamp.fromDate(DateTime(2022, 7, 26, 15, 11, 5)),
      'text': '크롱크롱크롱',
      'uid': 'd',
      'userImageUrl': imageUrl,
      'userNickname': '이하준',
    }),
    Chat.fromJson({
      'date': Timestamp.fromDate(DateTime(2022, 7, 26, 15, 6, 34)),
      'text': '크롱크롱',
      'uid': 'd',
      'userImageUrl': imageUrl,
      'userNickname': '이하준',
    }),
    Chat.fromJson({
      'date': Timestamp.fromDate(DateTime(2022, 7, 26, 15, 11, 2)),
      'text': '크롱크롱',
      'uid': 'a',
      'userImageUrl': imageUrl,
      'userNickname': '현승준',
    }),
    Chat.fromJson({
      'date': Timestamp.fromDate(DateTime(2022, 7, 26, 15, 11, 5)),
      'text': '크롱크롱크롱',
      'uid': 'b',
      'userImageUrl': imageUrl,
      'userNickname': '한상윤',
    }),
    Chat.fromJson({
      'date': Timestamp.fromDate(DateTime(2022, 7, 26, 15, 6, 34)),
      'text': '크롱크롱',
      'uid': 'e',
      'userImageUrl': imageUrl,
      'userNickname': '최복원',
    }),
  ];

  bool isFirstChat(int index) {
    if (index < 1) return true;
    if (index > chats.length - 1) return false;
    return chats[index - 1].uid != chats[index].uid;
  }

  bool isMyChat(int index) {
    return UserPresenter.user.uid == chats[index].uid;
  }

  void addChat() {
    if (messageCont.text == '') return;
    chats.add(Chat.fromJson({
      'date': Timestamp.now(),
      'text': messageCont.text,
      'uid': UserPresenter.user.uid,
      'userNickname': UserPresenter.user.nickname,
      'userImageUrl': UserPresenter.user.imageUrl,
    }));
    messageCont.clear();
    update();
  }

}