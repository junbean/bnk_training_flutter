import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: StorePage(), debugShowCheckedModeBanner: false);
  }
}

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Text("woman", style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("kids", style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("Shoes", style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("Bag", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/bag.jpeg",
                  fit: BoxFit.contain, // 전체 이미지 보이기
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/cloth.jpeg",
                  fit: BoxFit.contain, // 전체 이미지 보이기
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
