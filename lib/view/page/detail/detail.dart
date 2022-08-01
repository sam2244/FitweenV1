/* 디테일 페이지 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/page/detail.dart';
import 'package:fitweenV1/presenter/page/my_crew.dart';
import 'package:fitweenV1/view/page/detail/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Detail(),
      bottomNavigationBar: BottomAppBar(
        child: GetBuilder<DetailPresenter>(
          builder: (controller) {
            return Row(
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
                        '${controller.selectedCrew.members.length}',
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
                    onTap: () => controller.joinButtonPressed,
                    child: Container(
                      height: 48.0,
                      color: FWTheme.black,
                      alignment: Alignment.center,
                      child: const Text('크루 참여하기',
                        style: TextStyle(fontSize: 16.0, color: FWTheme.white),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
