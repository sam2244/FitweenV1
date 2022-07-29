import 'package:fitweenV1/global/config/theme.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/page/my_crew.dart';
import 'package:fitweenV1/view/page/my_crew/widget.dart';
import 'package:fitweenV1/view/widget/image.dart';
import 'package:fitweenV1/view/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyCrewPage extends StatelessWidget {
  const MyCrewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCrewPresenter>(
      builder: (myCrewCont) {
        final crewCont = Get.find<CrewPresenter>();
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: const MyCrewPageAppBar(),
              body: ListView.builder(
                itemCount: crewCont.myCrews.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => myCrewCont.chatPressed(crewCont.myCrews[index]),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 7.0, horizontal: 15.0,
                      ),
                      leading: MyCrewImage(title: crewCont.myCrews[index]),
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
                                      crewCont.myCrews[index].title!,
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Text('${crewCont.myCrews[index].memberUids.length}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  if (crewCont.myCrews[index].isLocked)
                                  const Icon(Icons.lock, size: 14.0),
                                  const Icon(Icons.notifications_active_outlined, size: 14.0),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(myCrewCont.latestChats[index].text ?? '',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (myCrewCont.latestChats[index].date != null)
                              Text(DateFormat('a h:mm').format(myCrewCont.latestChats[index].date!),
                                style: const TextStyle(
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              bottomNavigationBar: const FWBottomBar(),
            ),
            if (myCrewCont.chatLoading)
            Positioned.fill(
              child: Container(
                color: FWTheme.black.withOpacity(.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}

