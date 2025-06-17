import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: RockPaperScissorsGame(),
    );
  }
}

class RockPaperScissorsGame extends StatefulWidget {
  @override
  _RockPaperScissorsGameState createState() => _RockPaperScissorsGameState();
}

class _RockPaperScissorsGameState extends State<RockPaperScissorsGame> {
  String playerChoice = '';
  String computerChoice = '';
  String result = '';
  int playerScore = 0;
  int computerScore = 0;

  List<String> choices = ['가위', '바위', '보'];

  void playGame(String player) {
    setState(() {
      playerChoice = player;
      computerChoice = choices[Random().nextInt(3)];

      if (playerChoice == computerChoice) {
        result = '무승부!';
      } else if ((playerChoice == '가위' && computerChoice == '보') ||
          (playerChoice == '바위' && computerChoice == '가위') ||
          (playerChoice == '보' && computerChoice == '바위')) {
        result = '플레이어 승리!';
        playerScore++;
      } else {
        result = '컴퓨터 승리!';
        computerScore++;
      }
    });
  }

  void resetGame() {
    setState(() {
      playerChoice = '';
      computerChoice = '';
      result = '';
      playerScore = 0;
      computerScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('가위바위보 게임'), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '점수: 플레이어 $playerScore - $computerScore 컴퓨터',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            Text('플레이어: $playerChoice', style: TextStyle(fontSize: 24)),
            Text('컴퓨터: $computerChoice', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),

            Text(
              result,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: result.contains('플레이어')
                    ? Colors.green
                    : result.contains('컴퓨터')
                    ? Colors.red
                    : Colors.orange,
              ),
            ),

            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => playGame('가위'),
                  child: Text('✂️ 가위', style: TextStyle(fontSize: 18)),
                ),
                ElevatedButton(
                  onPressed: () => playGame('바위'),
                  child: Text('🪨 바위', style: TextStyle(fontSize: 18)),
                ),
                ElevatedButton(
                  onPressed: () => playGame('보'),
                  child: Text('📄 보', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: resetGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('게임 리셋'),
            ),
          ],
        ),
      ),
    );
  }
}
