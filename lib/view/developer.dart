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
              onPressed: () => Get.toNamed('/login'),
              child: const Text('LoginPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/register'),
              child: const Text('RegisterPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/main'),
              child: const Text('MainPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/detail'),
              child: const Text('DetailPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/chat'),
              child: const Text('ChatPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/addCrew'),
              child: const Text('AddCrewPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/myCrew'),
              child: const Text('MyCrewPage'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/my'),
              child: const Text('MyPage'),
            ),
          ],
        ),
      ),
    );
  }
}
