import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const UIClone());
}

class UIClone extends StatelessWidget {
  const UIClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      color: Colors.white,
                      size: 80,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'MONDAY 16',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        const Text(
                          'TODAY',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          '·',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFB22581),
                          ),
                        ),
                        for (int i = 17; i <= 31; i++) ...[
                          Text(
                            '$i',
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ],
                    ),
                  ),
                ),
                const CustomBox(
                  schedule: 'DESING MEETING',
                  bgColor: Color(0xFFFEF754),
                  start: '11.30',
                  end: '12.20',
                  member: ['ALEX', 'HELENA', 'NANA'],
                ),
                const SizedBox(height: 20),
                const CustomBox(
                  schedule: 'DAILY PROJECT',
                  bgColor: Color(0xFF9C6BCE),
                  start: '12.35',
                  end: '14.10',
                  member: ['ME', 'RECHARD', 'CIRY', '+4'],
                ),
                const SizedBox(height: 20),
                const CustomBox(
                  schedule: 'WEEKLY PLANNING',
                  bgColor: Color(0xFFBCEE4B),
                  start: '15.00',
                  end: '16.30',
                  member: ['DEN', 'NANA', 'MARK'],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final Color bgColor;
  final String start, end, schedule;
  final List<String> member;

  const CustomBox(
      {super.key,
      required this.schedule,
      required this.bgColor,
      required this.start,
      required this.end,
      required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      start.split('.')[0],
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      start.split('.')[1],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        height: 0.1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '│',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      end.split('.')[0],
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      end.split('.')[1],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        height: 0.1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schedule.split(' ')[0],
                      style: const TextStyle(
                          fontSize: 80, fontWeight: FontWeight.w500, height: 1),
                    ),
                    Text(
                      schedule.split(' ')[1],
                      style: const TextStyle(
                          fontSize: 80, fontWeight: FontWeight.w500, height: 1),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var name in member) ...[
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: name != 'ME'
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                              color: name != 'ME'
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(width: 50),
                        ],
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
