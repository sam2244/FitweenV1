import 'package:fitweenV1/presenter/firebase/login/login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () => LoginPresenter.fwLogin(LoginType.google),
          child: const Text('구글계정으로 로그인'),
        ),
      ),
    );
  }
}
