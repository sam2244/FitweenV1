import 'package:fitweenV1/model/chat.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:get/get.dart';

class MyCrewPresenter extends GetxController {
  static void toMyCrew() async {
    final myCrewPresenter = Get.find<MyCrewPresenter>();
    await myCrewPresenter.loadLatestChats();
    Get.offAllNamed('/myCrew');
  }

  static void periodSearchButtonPressed() {
  }

  bool chatLoading = false;

  void chatPressed(Crew crew) async {
    chatLoading = true; update();
    await ChatPresenter.toChat(crew);
    chatLoading = false; update();
  }

  List<Chat> latestChats = [];

  Future loadLatestChats() async {
    final crewPresenter = Get.find<CrewPresenter>();

    if (latestChats.isNotEmpty) return;
    for (Crew crew in crewPresenter.myCrews) {
      final jsonList = (await f.collection('rooms').doc(crew.code)
          .collection('chats').orderBy('date', descending: true).get()).docs;
      Chat latestChat = Chat();
      if (jsonList.isNotEmpty) latestChat = Chat.fromJson(jsonList.first.data());
      latestChats.add(latestChat);
    }
    update();
  }
}
