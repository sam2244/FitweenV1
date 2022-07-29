import 'package:fitweenV1/view/page/my/widget.dart';
import 'package:fitweenV1/view/widget/widget.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        children: const [
          MyProfileImage(),
        ],
      ),
      bottomNavigationBar: const FWBottomBar(),
    );
  }
}
