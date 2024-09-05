import 'package:flutter/material.dart';
import 'package:toonflix/pomodoro/screens/code_challenge_screen.dart';
import 'package:toonflix/pomodoro/screens/home_screen.dart';

void main() {
  runApp(const Pomodoro());
}

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE7626C),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const CodeChallengeScreen(),
    );
  }
}
