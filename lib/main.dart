import 'package:firebase_core/firebase_core.dart';
import 'package:fitweenV1/firebase_options.dart';
import 'package:fitweenV1/global/theme.dart';
import 'package:fitweenV1/presenter/global.dart';
import 'package:fitweenV1/route.dart';
import 'package:fitweenV1/view/page/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'fitween',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Fitween());
}

class Fitween extends StatelessWidget {
  const Fitween({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalPresenter.initControllers();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          enableLog: false,
          title: 'Fitween',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: FWTheme.lightScheme,
            textTheme: FWTheme.textTheme,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: FWTheme.lightScheme.primary,
              ),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: FWTheme.darkScheme,
            textTheme: FWTheme.textTheme,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: FWTheme.darkScheme.primary,
              ),
            ),
          ),
          home: const LoginPage(),
          getPages: FWRoute.getPages,
        );
      },
    );
  }
}
