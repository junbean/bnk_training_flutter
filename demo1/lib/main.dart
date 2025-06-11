import 'package:flutter/material.dart';

void main() {
  // 앱을 시작하는 함수 - 가장 먼저 실행됨
  runApp(const MyApp());
}

// MyApp 클래스 - 앱의 최상위 위젯
class MyApp extends StatelessWidget {
  // StatelessWidget: 상태가 변하지 않는 위젯
  // (예: 텍스트, 아이콘 등 고정된 내용)

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // build 메소드: 위젯의 UI를 그리는 함수
    // context: 위젯의 위치 정보를 담고 있음

    // MaterialApp: 구글의 Material Design을 따르는 앱의 기본 틀
    return MaterialApp(
      // 앱의 제목
      title: 'Flutter Demo',
      // 앱의 전체적인 테마 설정
      theme: ThemeData(
        // 메인 색상
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: 앱이 시작될 때 보여줄 첫 화면
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MyHomePage 클래스 - 실제 화면을 담당하는 위젯
class MyHomePage extends StatefulWidget {
  // StatefulWidget: 상태가 변할 수 있는 위젯
  // (예: 버튼을 누르면 숫자가 증가하는 등)

  // 생성자: title을 받아서 초기화
  const MyHomePage({super.key, required this.title});

  // 제목을 저장하는 변수
  final String title;

  // StatefulWidget은 별도의 State 클래스를 만들어야 함
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State 클래스: 실제 상태와 UI 로직을 담당
class _MyHomePageState extends State<MyHomePage> {
  // 카운터 변수 (상태)
  int _counter = 0;

  // 카운터를 증가시키는 함수
  void _incrementCounter() {
    // setState(): 상태가 변경되었음을 Flutter에게 알리는 함수
    // 이 함수가 호출되면 build() 메소드가 다시 실행되어 화면이 업데이트됨
    setState(() {
      _counter++;
    });
  }

  // 화면을 그리는 함수
  @override
  Widget build(BuildContext context) {
    // Scaffold: 기본적인 화면 구조를 제공하는 위젯
    // (앱바, 본문, 플로팅 버튼 등을 배치할 수 있음)
    return Scaffold(
      // AppBar: 화면 상단의 앱바
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // widget.title: MyHomePage에서 받은 title에 접근
        title: Text(widget.title),
      ),
      // Center: 자식 위젯을 화면 중앙에 배치
      body: Center(
        // Column: 자식 위젯들을 세로로 배치
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
