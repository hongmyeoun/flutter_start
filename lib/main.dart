import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/card.dart';
import 'package:toonflix/widgets/card2.dart';

void main() {
  runApp(const App());
}

// widget은 레고같은것(class)
// MaterialApp = 구글
// CupertinoApp = 애플

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            // 패딩을 추가하려면 위젯을 추가해야 한다.
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ), // 수평 수직 패딩을 정할 수 있는 symmetric
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상단바와의 간격을 위한 박스
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Row 정렬(가로)
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.end, // Column 정렬(세로)
                      children: [
                        const Text(
                          'Hey, Selena',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Welcom back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8), // 불투명도 0.8
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 70),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '\$5 194 482', // escape로 변수 막기
                  style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(height: 30),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      text: 'Transfer',
                      bgColor: Color(0xFFF1B33B),
                      textColor: Colors.black,
                    ),
                    MyButton(
                      text: 'Request',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                // const MyCard(
                //   name: 'Eruo',
                //   amount: '6 428',
                //   code: 'EUR',
                //   icons: Icons.euro_rounded,
                //   isInverted: false,
                // ),
                // Transform.translate(
                //   offset: const Offset(0, -20),
                //   child: const MyCard(
                //     name: 'Bitcoin',
                //     amount: '9 785',
                //     code: 'BTC',
                //     icons: Icons.currency_bitcoin_rounded,
                //     isInverted: true,
                //   ),
                // ),
                // Transform.translate(
                //   offset: const Offset(0, -40),
                //   child: const MyCard(
                //     name: 'Dollar',
                //     amount: '428',
                //     code: 'USD',
                //     icons: Icons.attach_money_rounded,
                //     isInverted: false,
                //   ),
                // ),

                // Code Challenge!!
                const MyCard2(
                  name: 'Eruo',
                  amount: '6 428',
                  code: 'EUR',
                  icons: Icons.euro_rounded,
                  order: 0,
                ),
                const MyCard2(
                  name: 'Bitcoin',
                  amount: '9 785',
                  code: 'BTC',
                  icons: Icons.currency_bitcoin_rounded,
                  order: 1,
                ),
                const MyCard2(
                  name: 'Dollar',
                  amount: '428',
                  code: 'USD',
                  icons: Icons.attach_money_rounded,
                  order: 2,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
