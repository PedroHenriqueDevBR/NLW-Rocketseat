import 'package:DevQuiz/app_controller.dart';
import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:DevQuiz/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppController.instance.isDark,
      builder: (_, bool isDark, ___) {
        return MaterialApp(
          title: "DevQuiz",
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
          theme: ThemeData(
            brightness: isDark ? Brightness.dark : Brightness.light,
          ),
        );
      },
    );
  }
}
