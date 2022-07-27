import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitweenV1/view/main/widget.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Center(
          child: Column(
            children: [
              MainCard(
                imageUrl: "image null",
                category: "category",
                title: "title",
                hashtag: "hashtag",
                srtDate: "2022.12.27",
                endDate: "2022.07.27",
                //endDate: DateTime.utc(2022,12,31).toString(),
                memberNum: 13,
                key: const Key("1"),
              ),
            ],
          )
      ),
      //body: Center(child: Text('아직 크루가 없어요!')),
      floatingActionButton: const MainFloatingButton(),
    );
  }
}
