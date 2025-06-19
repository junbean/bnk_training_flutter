import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Login Demo', home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _message = "";

  Future<void> _login() async {
    final url = Uri.parse('http://localhost:8090/api/login'); // ← 서버 주소 확인 필요
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _message = "로그인 성공! 사용자: ${data['username']}";
      });
    } else {
      setState(() {
        _message = "로그인 실패: 아이디 또는 비밀번호 오류";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: '아이디',
                hintText: "제대로 입력해주세요",
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: '비밀번호'),
              obscureText: true,
              obscuringCharacter: "*",
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text('로그인')),
            const SizedBox(height: 20),
            Text(_message, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
