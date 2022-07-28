import 'package:fitweenV1/view/page/my_crew/widget.dart';
import 'package:flutter/material.dart';
import '../../../model/crew.dart';
import '../../../presenter/page/my_crew.dart';
import '../../widget/image.dart';
import '../../widget/widget.dart';

class MyCrewPage extends StatelessWidget {
  const MyCrewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> map = {
      'imageUrl': MyCrewPresenter.defaultProfile,
      'statusMessage': '어제 식단 올리셨나요?...',
      'categories': <String>[],
      'memberUids': <String>[],
    };

    map['title'] = '잠수교 달리기';
    Map<String, dynamic> map1 = {...map};
    map['title'] = '동해 싸이클';
    Map<String, dynamic> map2 = {...map};
    map['title'] = '한동 밀어내기';
    Map<String, dynamic> map3 = {...map};
    map['title'] = '데일리 10 푸쉬업';
    Map<String, dynamic> map4 = {...map};
    map['title'] = 'Jogging, What else?';
    Map<String, dynamic> map5 = {...map};

    List<Crew> crews = [
      Crew.fromMap(map1),
      Crew.fromMap(map2),
      Crew.fromMap(map3),
      Crew.fromMap(map4),
      Crew.fromMap(map5),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyCrewPageAppBar(),
      body: ListView.builder(
        itemCount: crews.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 7.0,
                horizontal: 15.0,
              ),
              leading: MyCrewImage(title: crews[index],),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              crews[index].title!,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: Text(
                              '56',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Icon(Icons.lock, size: 14.0,),
                          const Icon(Icons.notifications_active_outlined, size: 14.0,),

                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('다들 오늘 식단하셨나요', style: TextStyle(color: Colors.grey, fontSize: 12.0),),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '오후 7:43',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 20,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
                        child: const Center(
                            child: Text(
                              '196',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                        ),

                      )
                    ],
                  ),

                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const FWBottomBar(),
    );
  }
}

