import 'package:flutter/material.dart';

// Code Challenge!!
class MyCard2 extends StatelessWidget {
  final String name, amount, code;
  final IconData icons;
  final int order;

  final blackColor = const Color(0xFF1F2123);

  const MyCard2(
      {super.key,
      required this.name,
      required this.amount,
      required this.code,
      required this.icons,
      required this.order});

  @override
  Widget build(BuildContext context) {
    bool odd = order % 2 != 0;
    double dy = order * (-20);

    return Transform.translate(
      offset: Offset(0, dy),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: odd ? Colors.white : blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: odd ? blackColor : Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: odd ? blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: odd
                              ? blackColor
                              : Colors.white.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    icons,
                    color: odd ? blackColor : Colors.white,
                    size: 88,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}