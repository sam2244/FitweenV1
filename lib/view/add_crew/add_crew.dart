import 'package:fitweenV1/view/add_crew/widget.dart';
import 'package:flutter/material.dart';

class AddCrewPage extends StatelessWidget {
  const AddCrewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const AddCrew(),
    );
  }
}
