/* 라우트 관련 */

import 'package:fitweenV1/view/page/add_crew/add_crew.dart';
import 'package:fitweenV1/view/page/chat/chat.dart';
import 'package:fitweenV1/view/page/detail/detail.dart';
import 'package:fitweenV1/view/page/developer.dart';
import 'package:fitweenV1/view/page/login/login.dart';
import 'package:fitweenV1/view/page/main/main.dart';
import 'package:fitweenV1/view/page/my/my.dart';
import 'package:fitweenV1/view/page/my_crew/my_crew.dart';
import 'package:fitweenV1/view/page/register/register.dart';
import 'package:fitweenV1/view/page/search/search.dart';
import 'package:fitweenV1/view/page/setting/edit_nickname/edit_nickname.dart';
import 'package:fitweenV1/view/page/setting/edit_status/edit_status.dart';
import 'package:fitweenV1/view/page/setting/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// class
class FWRoute {
  /// static variables
  // 화면 전환 트랜지션
  static const Transition transition = Transition.fadeIn;

  // 화면 전환 지속시간
  static const Duration duration = Duration(milliseconds: 100);

  /// static methods
  // 라우트 문자열, 페이지 매핑
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
    '/setting': const SettingPage(),
    '/editNickname': const EditNicknamePage(),
    '/editStatus': const EditStatusPage(),
    '/search': const SearchPage(),
  };

  // 겟페이지 리스트
  static List<GetPage> get getPages => pages.entries.map((page) => GetPage(
    name: page.key,
    page: () => page.value,
    transition: transition,
    transitionDuration: duration,
  )).toList();
}
