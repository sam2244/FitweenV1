/* 내 크루 페이지 */

import 'package:fitweenV1/global/date.dart';
import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/model/chat.dart';
import 'package:fitweenV1/model/crew.dart';
import 'package:fitweenV1/presenter/model/crew.dart';
import 'package:fitweenV1/presenter/page/my_crew.dart';
import 'package:fitweenV1/view/page/main/widget.dart';
import 'package:fitweenV1/view/page/my_crew/widget.dart';
import 'package:fitweenV1/view/widget/widget/bottom_bar.dart';
import 'package:fitweenV1/view/widget/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// class
class MyCrewPage extends StatelessWidget {
  const MyCrewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crewCont = Get.find<CrewPresenter>();
    final myCrewCont = Get.find<MyCrewPresenter>();
    return Stack(
      children: [
        Scaffold(
          backgroundColor: colorScheme.background,
          appBar: const MyCrewPageAppBar(),
          body: SmartRefresher(
            header: MaterialClassicHeader(
              color: Colors.white,
              backgroundColor: colorScheme.primary,
            ),
            controller: MyCrewPresenter.refreshCont,
            onRefresh: MyCrewPresenter.onRefresh,
            onLoading: MyCrewPresenter.onLoading,
            child: ListView.builder(
              itemCount: crewCont.myCrews.length,
              itemBuilder: (_, index) {
                Crew crew = crewCont.myCrews[index];
                return InkWell(
                  onTap: () => myCrewCont.crewTilePressed(crew),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 15.0,
                    ),
                    leading: AspectRatio(
                      aspectRatio: 1.0,
                      child: crew.imageUrl == null
                          ? Container(
                        color: FWTheme.grey.withOpacity(.3),
                        child: const Center(
                          child: Icon(Icons.photo,
                            size: 20.0,
                            color: FWTheme.grey,
                          ),
                        ),
                      ) : Image.network(crew.imageUrl!, fit: BoxFit.cover),
                    ),
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
                                    crew.title!,
                                    style: textTheme.titleSmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: FWText('${crew.memberUids.length}',
                                    color: FWTheme.grey,
                                  ),
                                ),
                                if (crew.isLocked)
                                const Icon(Icons.lock, size: 14.0),
                                const Icon(Icons.notifications_active_outlined, size: 14.0),
                              ],
                            ),
                            if (myCrewCont.latestChats.isNotEmpty)
                            Container(
                              width: 220.0.w,
                              padding: const EdgeInsets.only(top: 8.0),
                              child: FWText(
                                myCrewCont.latestChats[index].text ?? '',
                                style: textTheme.labelSmall,
                                color: FWTheme.grey,
                              ),
                            ),
                          ],
                        ),
                        if (myCrewCont.latestChats.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (myCrewCont.latestChats[index].time != null)
                            FWText(dateToString('a hh:mm', myCrewCont.latestChats[index].time!)!,
                              style: textTheme.labelSmall,
                              color: FWTheme.grey,
                            ),
                            Container(
                              constraints: const BoxConstraints(minWidth: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.red,
                              ),
                              child: Center(
                                child: FWText('1',
                                  style: textTheme.labelSmall,
                                  color: FWTheme.white,
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
}
