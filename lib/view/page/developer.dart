import 'package:fitweenV1/global/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 임시 페이지기 때문에 stateful 사용
class DeveloperPage extends StatefulWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  State<DeveloperPage> createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {
  bool developerMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() => developerMode = !developerMode);
          },
          icon: Icon(
            developerMode ? Icons.toggle_on : Icons.toggle_off,
          ),
        ),
        title: Text(developerMode ? '개발자 모드' : '앱 플로우 모드'),
      ),
      body: Center(
        child: developerMode ? Column(
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
            // TextButton(
            //   onPressed: () => Get.toNamed('/my'),
            //   child: const Text('MyPage'),
            // ),
          ],
        ) : TextButton(
          onPressed: () => Get.toNamed('/login'),
          child: const Text('Start'),
        ),
      ),
    );
  }
}
