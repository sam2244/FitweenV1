import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// 메인 페이지의 위젯 모음

// 메인 페이지 AppBar
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  //Size get preferredSize => const Size.fromHeight(appbarHeight);
  Size get preferredSize {
    return const Size.fromHeight(60.0);
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(60.0.h),
        child: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(15.0.h),
            child: const Text("Fitween"),
          ),
          leadingWidth: 600.0.w,
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 24.0.h,
                color: Theme.of(context).colorScheme.primary,
              ),
              //onPressed: MainPresenter.searchPressed,
              onPressed: () {}
            ),
          ],
          elevation: 0.0,
        )
    );
  }
}
class MainFloatingButton extends StatelessWidget {
  const MainFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0, right: 5),
      child: SizedBox(
        height: 52,
        width: 52,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.add, size: 38, color: Colors.white,),
        ),
      ),
    );
  }
}