import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:flutter/material.dart';
import 'package:fitweenV1/view/main/widget.dart';
import 'package:get/get.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: GetBuilder<CrewPresenter>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: controller.crews.map((crew) {
                  return CrewCard(crew: crew);
                }).toList(),
              ),
            ),
          );
        }
      ),
      //body: Center(child: Text('아직 크루가 없어요!')),
      floatingActionButton: const AddCrewButton(),
    );
  }
}
