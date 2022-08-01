/* 마이 페이지 위젯 */

import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leadingWidth: 600.0,
      actions: const [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.black
          ),
          onPressed: SettingPresenter.toSetting,
        ),
      ],
    );
  }
}

class MyProfileImage extends StatelessWidget {
  const MyProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserPresenter>(
      builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 11.0),
                  child: Container(
                    width: 64.0,
                    height: 64.0,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Material(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50.0),
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: FWTheme.black.withOpacity(.1),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(controller.loggedUser.imageUrl!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.loggedUser.nickname!,
                      style: textTheme.headlineMedium,
                    ),
                    Text(controller.loggedUser.statusMessage ?? '',
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 39.0, top: 16.0, bottom: 40.0),
                  child: Column(
                    children: const [
                      Text("진행중"),
                      Text("10"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 40.0),
                  child: Column(
                    children: const [
                      Text("팔로워"),
                      Text("10"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:39.0, top: 16.0, bottom: 40.0),
                  child: Column(
                    children: const [
                      Text("팔로잉"),
                      Text("10"),
                    ],
                  ),
                ),
              ],
            )
          ]
        );
      },
    );
  }
}

class MyCrew extends StatefulWidget {
  const MyCrew({Key? key}) : super(key: key);

  @override
  State<MyCrew> createState() => _MyCrewState();
}

class _MyCrewState extends State<MyCrew> {
  bool continueChecked = false;
  bool doneChecked = false;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<UserPresenter>(
        builder: (controller) {
          return Column(
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      trailing: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: const Icon(Icons.manage_search,
                              color: Colors.black
                          )
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("나의 크루",
                              style: textTheme.headlineMedium,
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: continueChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    continueChecked = value!;
                                  });
                                },
                              ),
                              Text("진행중",
                                style: textTheme.labelSmall,
                              ),
                              Checkbox(
                                value: doneChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    doneChecked = value!;
                                  });
                                },
                              ),
                              Text("완료됨",
                                style: textTheme.labelSmall,
                              )
                            ],
                          ),
                        ],
                      ),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            title: Text('기간',
                              style: textTheme.labelSmall,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            title: Text('기간',
                              style: textTheme.labelSmall,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                            primary: Colors.black,
                            ),
                            child: const Text('검색하기'),
                            onPressed: () {},
                          )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        }
    );
  }
}