import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/crew.dart';

class Detail extends StatelessWidget {
  final Crew crew;
  const Detail({Key? key, required this.crew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              height: 560.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.travie.com/news/photo/first/201611/img_19431_1.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 560.0,
              color: const Color.fromRGBO(0, 0, 0, 0.4),
            ),
            // Image.network(
            //     'https://cdn.travie.com/news/photo/first/201611/img_19431_1.jpg'),
            Positioned(
              top: 60.0,
              left: 0.0,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_outlined),
                color: const Color.fromRGBO(255, 255, 255, 1.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: crew.categories
                        .map(
                          (category) => Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 12.0),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  category,
                                  style: const TextStyle(
                                    // color: Color.fromRGBO(255, 255, 255, 1.0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                  Text(
                    crew.title!,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(255, 255, 255, 1.0)),
                  ),
                  Row(
                    children: crew.tags
                        .map(
                          (tag) => Text(
                            '#$tag ',
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1.0)),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '${DateFormat('yyyy.MM.dd').format(crew.startDate!)}~'
                    '${DateFormat('yyyy.MM.dd').format(crew.endDate!)}',
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0)),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202207/18/7f8061ea-848f-421e-81c6-64ce10f19886.jpg',
                  width: 32.0,
                  height: 32.0,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '유희열',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            crew.desc!,
            style: const TextStyle(fontSize: 16.0),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
