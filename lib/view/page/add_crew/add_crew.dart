/* 크루 추가 페이지 */

import 'package:fitweenV1/view/page/add_crew/widget.dart';
import 'package:flutter/material.dart';

/// class
class AddCrewPage extends StatelessWidget {
  const AddCrewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
      body: AddCrewView(),
    );
  }
}
