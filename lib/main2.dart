import 'package:flutter/material.dart';

void main() {
  runApp(const Counter());
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  bool showTitle = true; 
  // Title 위젯을 dispose하는 변수 dispose를 통해 위젯 트리에서 삭제하고
  // 라이프 사이클을 지킬 수 있다?.

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 앱 테마 설정
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          )
        )
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('Nothing!'),
              IconButton(onPressed: toggleTitle, icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });
  

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}


class _MyLargeTitleState extends State<MyLargeTitle> {

  // state를 초기화 할 때 사용, 단 한번만 실행됨(viewModel의 init과 동일한듯?)
  // build 전에 실행이 됨
  @override
  void initState() {
    super.initState();
    print('init!');
  }

  // 위젯이 위젯 트리에서 제거될 때
  @override
  void dispose() {
    super.dispose();
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'My Large Title',
      style: TextStyle(
        color: Theme.of(context).textTheme.titleLarge!.color,
        // color: Theme.of(context).textTheme.titleLarge?.color,
        fontSize: 30,
      ),
    );
  }
}
