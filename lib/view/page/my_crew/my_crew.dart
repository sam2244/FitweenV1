import 'package:fitweenV1/view/page/my_crew/widget.dart';
import 'package:fitweenV1/view/widget/widget.dart';
import 'package:flutter/material.dart';

class MyCrewPage extends StatelessWidget {
  const MyCrewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MyCrewCard(),
      bottomNavigationBar: const FWBottomBar(),
    );
  }
}
