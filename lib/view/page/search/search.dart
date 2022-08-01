/* 검색 페이지 */

import 'package:fitweenV1/presenter/page/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../add_crew/widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ChatPresenter>(
      builder: (controller) {
        return Stack(
          children: const [
            Scaffold(
              appBar: MainAppBar(),
              //body: RecentSearchPageView(),
            ),
          ],
        );
      },
    );
  }
}
