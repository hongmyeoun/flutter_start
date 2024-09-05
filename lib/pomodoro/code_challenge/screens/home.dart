import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 주석은 초단위를 사용할때
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int settedSecond = 900;
  int totalSecond = 900;

  // int settedSecond = 1;
  // int totalSecond = 1;

  bool isRunning = false;
  int round = 0;
  int goal = 0;
  bool isCoolingTime = false;

  int coolingTime = 300;

  // int coolingTime = 5;

  int firstBox = 15;
  int secondBox = 20;
  int thirdBox = 25;
  int fourthBox = 30;
  int fifthBox = 35;

  // int firstBox = 1;
  // int secondBox = 2;
  // int thirdBox = 3;
  // int fourthBox = 4;
  // int fifthBox = 5;

  late Timer timer;

  void onTick(Timer timer) {
    if (totalSecond == 0) {
      setState(() {
        round += 1;
        if (round > 4) {
          round = 0;
          goal += 1;
        }
        isRunning = false;
        totalSecond = settedSecond;
      });
      timer.cancel();
      cooling();
    } else {
      setState(() {
        totalSecond -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
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
      isRunning = false;
      totalSecond = settedSecond;
    });
    timer.cancel();
  }

  void onCooling(Timer timer) {
    if (totalSecond == 0) {
      setState(() {
        isCoolingTime = false;
        isRunning = false;
        totalSecond = settedSecond;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSecond -= 1;
      });
    }
  }

  void cooling() {
    timer = Timer.periodic(const Duration(seconds: 1), onCooling);
    setState(() {
      isRunning = true;
      totalSecond = coolingTime;
      isCoolingTime = true;
    });
  }

  void onTimerBoxPressed(int newSecond) {
    setState(() {
      settedSecond = newSecond;
      totalSecond = settedSecond;
    });
  }

  String formatedMin(int mins) {
    var duration = Duration(seconds: mins);
    return duration.toString().split('.').first.substring(2, 4);
  }

  String formatedSec(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(5, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'POMOTIMER',
                    style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClockBox(
                  time: formatedMin(totalSecond),
                  isCoolingTime: isCoolingTime,
                ),
                const SizedBox(width: 30),
                const Text(
                  ':',
                  style: TextStyle(
                    fontSize: 90,
                    color: Color(0xFFFA8F84),
                  ),
                ),
                const SizedBox(width: 30),
                ClockBox(
                  time: formatedSec(totalSecond),
                  isCoolingTime: isCoolingTime,
                ),
              ],
            ),
            const SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TimerBox(
                    time: firstBox,
                    onTimerBoxPressed: () => onTimerBoxPressed(firstBox*60),
                    isFocus: settedSecond == firstBox*60,
                  ),
                  const SizedBox(width: 20),
                  TimerBox(
                    time: secondBox,
                    onTimerBoxPressed: () => onTimerBoxPressed(secondBox*60),
                    isFocus: settedSecond == secondBox*60,
                  ),
                  const SizedBox(width: 20),
                  TimerBox(
                    time: thirdBox,
                    onTimerBoxPressed: () => onTimerBoxPressed(thirdBox*60),
                    isFocus: settedSecond == thirdBox*60,
                  ),
                  const SizedBox(width: 20),
                  TimerBox(
                    time: fourthBox,
                    onTimerBoxPressed: () => onTimerBoxPressed(fourthBox*60),
                    isFocus: settedSecond == fourthBox*60,
                  ),
                  const SizedBox(width: 20),
                  TimerBox(
                    time: fifthBox,
                    onTimerBoxPressed: () => onTimerBoxPressed(fifthBox*60),
                    isFocus: settedSecond == fifthBox*60,
                  ),
                ],

                // children: [
                //   TimerBox(
                //     time: firstBox,
                //     onTimerBoxPressed: () => onTimerBoxPressed(firstBox),
                //     isFocus: settedSecond == firstBox,
                //   ),
                //   const SizedBox(width: 20),
                //   TimerBox(
                //     time: secondBox,
                //     onTimerBoxPressed: () => onTimerBoxPressed(secondBox),
                //     isFocus: settedSecond == secondBox,
                //   ),
                //   const SizedBox(width: 20),
                //   TimerBox(
                //     time: thirdBox,
                //     onTimerBoxPressed: () => onTimerBoxPressed(thirdBox),
                //     isFocus: settedSecond == thirdBox,
                //   ),
                //   const SizedBox(width: 20),
                //   TimerBox(
                //     time: fourthBox,
                //     onTimerBoxPressed: () => onTimerBoxPressed(fourthBox),
                //     isFocus: settedSecond == fourthBox,
                //   ),
                //   const SizedBox(width: 20),
                //   TimerBox(
                //     time: fifthBox,
                //     onTimerBoxPressed: () => onTimerBoxPressed(fifthBox),
                //     isFocus: settedSecond == fifthBox,
                //   ),
                // ],
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: IconButton(
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(
                        isRunning ? Icons.pause : Icons.play_arrow,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  if (isRunning || totalSecond != settedSecond)
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: IconButton(
                        onPressed: onResetPressed,
                        icon: const Icon(
                          Icons.stop,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '$round/4',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF4A29B),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'ROUND',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Text(
                        '$goal/12',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF4A29B),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'GOAL',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ClockBox extends StatelessWidget {
  final String time;
  final bool isCoolingTime;

  const ClockBox({super.key, required this.time, required this.isCoolingTime});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -12,
          child: Container(
            width: 180,
            height: 280,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.33),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Positioned(
          top: -6,
          child: Container(
            width: 190,
            height: 290,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.66),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                fontSize: 120,
                color: !isCoolingTime
                    ? Theme.of(context).textTheme.headlineLarge!.color
                    : const Color(0xFF6799FF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TimerBox extends StatelessWidget {
  final int time;
  final VoidCallback onTimerBoxPressed;
  final bool isFocus;

  const TimerBox(
      {super.key,
      required this.time,
      required this.onTimerBoxPressed,
      required this.isFocus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTimerBoxPressed,
      child: Container(
        width: 140,
        height: 90,
        decoration: BoxDecoration(
          color: isFocus
              ? Theme.of(context).cardColor
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: !isFocus
              ? const Border(
                  top: BorderSide(color: Color(0xFFEE7E71), width: 3.5),
                  bottom: BorderSide(color: Color(0xFFEE7E71), width: 3.5),
                  left: BorderSide(color: Color(0xFFEE7E71), width: 3.5),
                  right: BorderSide(color: Color(0xFFEE7E71), width: 3.5),
                )
              : null,
        ),
        child: Center(
          child: Text(
            '$time',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isFocus
                  ? Theme.of(context).textTheme.headlineLarge!.color
                  : Theme.of(context).cardColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
