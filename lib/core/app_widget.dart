import 'package:flutter/material.dart';
import 'package:quiz/challenge/challenge_page.dart';
import 'package:quiz/home/home_page.dart';
import 'package:quiz/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: SplashPage(),
    );
  }
}