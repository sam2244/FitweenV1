import 'package:fitweenV1/view/page/detail/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/crew.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.toNamed('/detail', arguments: crew);
    Crew crew = Get.arguments;
    int memberNum = crew.memberUids.length;
    return Scaffold(
      body: Detail(crew: crew),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 48.0,
              color: Colors.grey.shade400,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 24,
                    color: Colors.grey.shade800,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '$memberNum',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  print('Pressed');
                },
                child: Container(
                  height: 48.0,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: const Text(
                    '크루 참여하기',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
