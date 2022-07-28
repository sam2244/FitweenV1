import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:fitweenV1/view/page/my_crew/widget.dart';
import 'package:fitweenV1/view/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCrewPage extends StatelessWidget {
  const MyCrewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          IconButton(
            onPressed: ChatPresenter.toChat,
            icon: Icon(Icons.chat_bubble),
          ),
        ],
      ),
      body: MyCrewCard(),
      bottomNavigationBar: const FWBottomBar(),
    );
  }
}
