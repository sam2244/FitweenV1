/* 메인 페이지 위젯 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/page/add_crew.dart';
import 'package:fitweenV1/presenter/page/main.dart';
import 'package:fitweenV1/presenter/page/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../search/widget.dart';

/// classes
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('Fitween'),
      ),
      leadingWidth: 600.0,
      actions: const [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: SearchPresenter.toSearch,
        ),
      ],
    );
  }
}

class CrewCard extends StatelessWidget {
  const CrewCard({Key? key, required this.crew}) : super(key: key);

  final Crew crew;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPresenter>(
      builder: (controller) {
        return InkWell(
          onTap: () => controller.crewCardPressed(crew),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 250.0,
                  color: FWTheme.grey.withOpacity(.3),
                  child: crew.imageUrl == null ? const Center(
                    child: Icon(Icons.photo, color: FWTheme.grey, size: 40.0),
                  ) : Image.network(crew.imageUrl!, fit: BoxFit.cover),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            crew.title!,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: crew.tags.isNotEmpty
                                ? Text(
                                    '#${crew.tags.join(" #")}',
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : const Text(''),
                          ),
                          Text(
                            '${DateFormat('yyyy.MM.dd').format(crew.startDate!)}~'
                            '${DateFormat('yyyy.MM.dd').format(crew.endDate!)}',
                            style: const TextStyle(fontSize: 12.0),
                          ),
                          Row(
                            children: crew.categories.map((category) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Container(
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: FWTheme.dark),
                                  ),
                                  child:
                                      Text(category, textAlign: TextAlign.center),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 3.0,
                      ),
                      decoration: BoxDecoration(
                        color: FWTheme.grey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.person),
                          Text('${crew.memberLimit}명'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AddCrewButton extends StatelessWidget {
  const AddCrewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: AddCrewPresenter.toAddCrew,
      backgroundColor: colorScheme.primary,
      child: const Icon(Icons.add, size: 38, color: Colors.white),
    );
  }
}
