import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "테스트 위젯",
      home: Scaffold(
        appBar: AppBar(title: Text("test widget")),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.amberAccent,
                  width: 100,
                  height: 100,
                  child: Center(child: Text("하나")),
                ),
                Container(
                  color: Colors.blueAccent,
                  width: 100,
                  height: 100,
                  child: Center(child: Text("둘")),
                ),
                Container(
                  color: Colors.deepOrangeAccent,
                  width: 100,
                  height: 100,
                  child: Center(child: Text("셋")),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(child: Image.asset(width: 240, height: 240, "spring.png")),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("item title1"),
                    subtitle: Text("item sub1......"),
                    trailing: Icon(Icons.access_alarm_sharp),
                    onTap: () {
                      print("hello 1");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("item title2"),
                    subtitle: Text("item sub2......"),
                    trailing: Icon(Icons.access_alarm_sharp),
                    onTap: () {
                      print("hello 2");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("item title3"),
                    subtitle: Text("item sub3......"),
                    trailing: Icon(Icons.access_alarm_sharp),
                    onTap: () {
                      print("hello 3");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("item title4"),
                    subtitle: Text("item sub4......"),
                    trailing: Icon(Icons.access_alarm_sharp),
                    onTap: () {
                      print("hello 4");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text("item title5"),
                    subtitle: Text("item sub5......"),
                    trailing: Icon(Icons.access_alarm_sharp),
                    onTap: () {
                      print("hello 5");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/*
class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Test_Widget")),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.redAccent,
                  child: Text("test1"),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blueAccent,
                  child: Text("test2"),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.greenAccent,
                  child: Text("test3"),
                ),
              ],
            ),
            SizedBox(height: 50),
            Center(child: Image.asset("spring.png", width: 200, height: 200)),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text(
                      "item1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("sub title1............"),
                    trailing: Icon(Icons.forest),
                    onTap: () {
                      print("item1 Clicked()");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text(
                      "item2",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("sub title2............"),
                    trailing: Icon(Icons.forest),
                    onTap: () {
                      print("item2 Clicked()");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text(
                      "item3",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("sub title3............"),
                    trailing: Icon(Icons.forest),
                    onTap: () {
                      print("item3 Clicked()");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: Text(
                      "item4",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("sub title4............"),
                    trailing: Icon(Icons.forest),
                    onTap: () {
                      print("item4 Clicked()");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
*/


/*
class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("테스트 위젯")),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4), // 컨테이너 간 여백을 위해 좌우 마진 추가
                child: Container(
                  padding: const EdgeInsets.all(8), // 내부 여백
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200, // 배경색 (필요에 따라 변경)
                    borderRadius: BorderRadius.circular(8), // 모서리 둥글게 8
                  ),
                  child: const Center(child: Text("test")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4), // 컨테이너 간 여백을 위해 좌우 마진 추가
                child: Container(
                  padding: const EdgeInsets.all(8), // 내부 여백
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200, // 배경색 (필요에 따라 변경)
                    borderRadius: BorderRadius.circular(8), // 모서리 둥글게 8
                  ),
                  child: const Center(child: Text("test")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4), // 컨테이너 간 여백을 위해 좌우 마진 추가
                child: Container(
                  padding: const EdgeInsets.all(8), // 내부 여백
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200, // 배경색 (필요에 따라 변경)
                    borderRadius: BorderRadius.circular(8), // 모서리 둥글게 8
                  ),
                  child: const Center(child: Text("test")),
                ),
              ),
            ],
          ),
          SizedBox(height: 240.0, child: Image.asset("burger.jpeg")),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 16,
                  ),
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/
