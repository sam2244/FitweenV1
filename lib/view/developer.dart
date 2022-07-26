import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Get.toNamed('/main'),
              child: Text('MainPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/detail'),
              child: Text('DetailPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/chat'),
              child: Text('ChatPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/addCrew'),
              child: Text('AddCrewPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/myCrew'),
              child: Text('MyCrewPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/my'),
              child: Text('MyPage'),
            ),
          ],
        ),
      ),
    );
  }
}
