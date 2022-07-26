import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presenter/page/add_crew/add_crew.dart';

class AddCrew extends StatelessWidget {
  const AddCrew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crewCont = TextEditingController();

    return GetBuilder<AddCrewPresenter>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Title',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: 300.0,
                    height: 45.0,
                    child: TextFormField(
                      controller: crewCont,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the Crew Title',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 8.0),
                  ListTile(
                    title: const Text('offline'),
                    leading: Radio<ParticipationMethod>(
                      value: ParticipationMethod.offline,
                      groupValue: controller.method,
                      onChanged: (ParticipationMethod? value) {
                        controller.changeMethod(value!);
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('online'),
                    leading: Radio<ParticipationMethod>(
                      value: ParticipationMethod.online,
                      groupValue: controller.method,
                      onChanged: (ParticipationMethod? value) {
                        controller.changeMethod(value!);
                      },
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: 300.0,
                    height: 45.0,
                    child: TextFormField(
                      controller: crewCont,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the Crew Title',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Title',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: 300.0,
                    height: 45.0,
                    child: TextFormField(
                      controller: crewCont,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the Crew Title',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
