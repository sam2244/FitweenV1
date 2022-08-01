/* 검색 페이지 */

import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/page/my_crew.dart';
import 'package:fitweenV1/view/page/search/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCrewPresenter>(
      builder: (myCrewCont) {
        final crewCont = Get.find<CrewPresenter>();
        return Stack(
          children: const [
            Scaffold(
              appBar: SearchAppBar(),
              //body: RecentSearchPageView(),
            ),
          ],
        );
      },
    );
  }
}
