/* 검색 페이지 */

import 'package:fitweenV1/view/page/search/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presenter/page/chat.dart';
import '../add_crew/widget.dart';

import '../add_crew/widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatPresenter>(
      builder: (controller) {
        return const Scaffold(
          appBar: SearchAppBar(),
          body: SearchedView(),
        );
      },
    );
  }
}
