import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/firebase/login/login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Material(
          color: FWTheme.black,
          child: InkWell(
            onTap: () => LoginPresenter.fwLogin(LoginType.google),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text('구글계정으로 로그인',
                style: TextStyle(color: FWTheme.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
