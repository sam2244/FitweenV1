/* 디테일 페이지 위젯 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/page/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPresenter>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                SizedBox(
                  height: 560.0,
                  child: controller.selectedCrew.imageUrl == null ? Container(
                    color: FWTheme.grey.withOpacity(.3),
                    child: const Center(
                      child: Icon(Icons.photo,
                        size: 60.0,
                        color: FWTheme.grey,
                      ),
                    ),
                  ) : Image.network(
                    controller.selectedCrew.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 560.0,
                  color: FWTheme.black.withOpacity(.3),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios,
                              color: FWTheme.white,
                            ),
                            onPressed: Get.back,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: controller.selectedCrew.categories.map((category) => Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FWTheme.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Text(
                                      category,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                ],
                              )).toList(),
                            ),
                            Text(controller.selectedCrew.title!,
                              style: const TextStyle(
                                fontSize: 30.0,
                                color: FWTheme.white,
                              ),
                            ),
                            Row(
                              children: controller.selectedCrew.tags.map((tag) => Text('#$tag ',
                                style: const TextStyle(color: FWTheme.white),
                              )).toList(),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              '${DateFormat('yyyy.MM.dd').format(controller.selectedCrew.startDate!)}~'
                              '${DateFormat('yyyy.MM.dd').format(controller.selectedCrew.endDate!)}',
                              style: const TextStyle(color: FWTheme.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GetBuilder<DetailPresenter>(
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.network(
                          controller.leader.imageUrl!,
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(controller.leader.nickname!,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                controller.selectedCrew.desc!,
                style: const TextStyle(fontSize: 16.0),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      }
    );
  }
}
