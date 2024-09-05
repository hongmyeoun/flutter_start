import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onPausePressed() {}

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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClockBox(),
                SizedBox(width: 30),
                Text(
                  ':',
                  style: TextStyle(
                    fontSize: 90,
                    color: Color(0xFFFA8F84),
                  ),
                ),
                SizedBox(width: 30),
                ClockBox(),
              ],
            ),
            const SizedBox(height: 40),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TimerBox(),
                  SizedBox(width: 20),
                  TimerBox(),
                  SizedBox(width: 20),
                  TimerBox(),
                  SizedBox(width: 20),
                  TimerBox(),
                  SizedBox(width: 20),
                  TimerBox(),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(80),
              ),
              child: IconButton(
                onPressed: onPausePressed,
                icon: const Icon(
                  Icons.pause,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '0/4',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF4A29B),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
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
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Text(
                        '0/12',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF4A29B),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
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
  const ClockBox({super.key});

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
              '12',
              style: TextStyle(
                fontSize: 120,
                color: Theme.of(context).textTheme.headlineLarge!.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TimerBox extends StatefulWidget {
  const TimerBox({super.key});

  @override
  State<TimerBox> createState() => _TimerBoxState();
}

class _TimerBoxState extends State<TimerBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 90,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          '15',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.headlineLarge!.color,
          ),
        ),
      ),
    );
  }
}
