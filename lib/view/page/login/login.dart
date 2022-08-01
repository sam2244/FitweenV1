/* 로그인 페이지 */

import 'package:fitweenV1/presenter/firebase/login/login.dart';
import 'package:fitweenV1/view/widget/button/button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FWButton(
          text: '구글계정으로 로그인',
          onPressed: () => LoginPresenter.fwLogin(LoginType.google),
        ),
      ),
    );
  }
}
