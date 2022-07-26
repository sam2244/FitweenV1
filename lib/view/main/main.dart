import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitweenV1/view/main/widget.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
      body: Center(child: Text('아직 크루가 없어요!')),
      floatingActionButton: MainFloatingButton(),
    );
  }
}
