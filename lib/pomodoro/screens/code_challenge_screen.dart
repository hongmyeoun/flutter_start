import 'dart:async';

import 'package:flutter/material.dart';

class CodeChallengeScreen extends StatefulWidget {
  const CodeChallengeScreen({super.key});

  @override
  State<CodeChallengeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CodeChallengeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalScecond = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer; // late로 선언하는 이유 : 초기화

  // type error 해결 parameter
  void onTick(Timer timer) {
    if (totalScecond == 0) {
      setState(() {
        totalPomodoros += 1;
        isRunning = false;
        totalScecond = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalScecond -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick, // type error
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    setState(() {
      isRunning = false; // 멈추니깐 false
      totalScecond = twentyFiveMinutes; // 값 초기화
    });
    timer.cancel(); // 멈춰야함
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          // Flexible(가변성 UI)
          Flexible(
            flex: 1, //default
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalScecond),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3, // default * 2 size
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 150,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline_rounded
                        : Icons.play_circle_outline_rounded),
                  ),
                  // 실행중일때 또는 1초라도 지난 시점에서 멈췄을 때
                  if (isRunning || totalScecond != twentyFiveMinutes)
                    IconButton(
                      iconSize: 150,
                      color: Theme.of(context).cardColor,
                      onPressed: onResetPressed,
                      icon: const Icon(Icons.stop_circle_outlined),
                    ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  // 화면 전부를 확장(row에서 row)
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
