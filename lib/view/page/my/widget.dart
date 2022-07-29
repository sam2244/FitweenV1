import 'package:fitweenV1/global/config/theme.dart';
import 'package:fitweenV1/presenter/model/user.dart';
import 'package:fitweenV1/presenter/page/my.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// 마이 페이지의 위젯 모음

// 마이 페이지 앱바
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /*leading: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text("Fitween"),
      ),*/
      leadingWidth: 600.0,
      actions: const [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.black
          ),
          onPressed: MyPresenter.settingPressed,
        ),
      ],
      elevation: 0.0,
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
                  padding: EdgeInsets.only(left:16.0.w, right: 11.0.w),
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                        BorderRadius.all(Radius.circular(100)) //모서리를 둥글게
                    ),
                    child: Material(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50.0),
                        onTap: MyPresenter.profileImageChange,
                        child: Container(
                          //padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: FWTheme.black.withOpacity(.1),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                            NetworkImage(controller.loggedUser.imageUrl!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      //padding: EdgeInsets.all(16.0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.loggedUser.nickname!,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text("#러너 #열심왕 \nig: sam_sy_han",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left:39.0.h, top: 16.0.h, bottom: 40.0.h),
                  child: Column(
                    children: const [
                      Text("진행중"),
                      Text("10")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0.h, bottom: 40.0.h),
                  child: Column(
                    children: const [
                      Text("팔로워"),
                      Text("10")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:39.0.h, top: 16.0.h, bottom: 40.0.h),
                  child: Column(
                    children: const [
                      Text("팔로잉"),
                      Text("10")
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
  @override
  Widget build(BuildContext context) {
    bool ContinueChecked = false;
    bool DoneChecked = false;

    return GetBuilder<UserPresenter>(
        builder: (controller) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24.0.h),
                    child: Text("나의 크루",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(11.0.h),
                    child: Row(
                      children: [
                        Checkbox(
                          value: ContinueChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              ContinueChecked = value!;
                            });
                          },
                        ),
                        const Text("진행중"),
                        Checkbox(
                          value: DoneChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              DoneChecked = value!;
                            });
                          },
                        ),
                        const Text("완료됨")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:24.0.h),
                    child: const Icon(Icons.manage_search)
                  ),
                ],
              )
            ],
          );
        }
    );
  }
}