import 'package:fitweenV1/view/page/add_crew/add_crew.dart';
import 'package:fitweenV1/view/page/chat/chat.dart';
import 'package:fitweenV1/view/page/detail/detail.dart';
import 'package:fitweenV1/view/page/developer.dart';
import 'package:fitweenV1/view/page/login/login.dart';
import 'package:fitweenV1/view/page/main/main.dart';
import 'package:fitweenV1/view/page/my/my.dart';
import 'package:fitweenV1/view/page/my_crew/my_crew.dart';
import 'package:fitweenV1/view/page/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FWRoute {
  static Map<String, Widget> get pages => {
    '/developer': const DeveloperPage(),
    '/login': const LoginPage(),
    '/register': const RegisterPage(),
    '/main': const MainPage(),
    '/detail': const DetailPage(),
    '/chat': const ChatPage(),
    '/addCrew': const AddCrewPage(),
    '/myCrew': const MyCrewPage(),
    '/my': const MyPage(),
  };

  static const Transition transition = Transition.fadeIn;
  static const Duration duration = Duration(milliseconds: 100);

  static List<GetPage> get getPages => pages.entries.map((page) => GetPage(
    name: page.key,
    page: () => page.value,
    transition: transition,
    transitionDuration: duration,
  )).toList();
}
