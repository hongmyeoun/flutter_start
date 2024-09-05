import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toonflix/pomodoro/code_challenge/screens/home.dart';

void main() {
  runApp(const Pomodoro());
}

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            // 크롬에서 터치 스크롤이 가능하게 변경하는 메소드
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE64D3D),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFFE64D3D),
          ),
        ),
        cardColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}