import 'package:flutter/material.dart';

void main() {
  runApp(const UIClone());
}

class UIClone extends StatelessWidget {
  const UIClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(Icons.account_circle_rounded),
                  Icon(Icons.add),
                ],
              ),
              const Text('MONDAY 16'),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text('TODAY'),
                    Text('·'),
                    Text('17'),
                    Text('18'),
                    Text('19'),
                    Text('20'),
                  ],
                ),
              ),
              CustomBox(
                schedule: 'DESING MEETING',
                bgColor: Colors.yellow,
                start: '11.30',
                end: '12.20',
                member: const ['ALEX', 'HELENA', 'NANA'],
              ),
              const SizedBox(height: 20),
              CustomBox(
                schedule: 'DAILY PROJECT',
                bgColor: Colors.purple,
                start: '12.35',
                end: '14.10',
                member: const ['ME', 'RECHARD', 'CIRY', '+4'],
              ),
              const SizedBox(height: 20),
              CustomBox(
                schedule: 'WEEKLY PLANNING',
                bgColor: Colors.green,
                start: '15.00',
                end: '16.30',
                member: const ['DEN', 'NANA', 'MARK'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  Color bgColor;
  String start, end, schedule;
  List<String> member;

  CustomBox(
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
