import 'package:fitweenV1/view/page/add_crew/widget.dart';
import 'package:flutter/material.dart';

class AddCrewPage extends StatelessWidget {
  const AddCrewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('크루 추가')),
      body: const AddCrew(),
    );
  }
}
