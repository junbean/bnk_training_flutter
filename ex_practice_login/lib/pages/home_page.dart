// 홈 페이지
import 'package:ex_practice_login/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String userEmail = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 라우트 arguments로부터 사용자 정보 가져오기
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      userEmail = args['userEmail'] ?? '';
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그아웃'),
          content: Text('정말 로그아웃하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // 로그인 페이지로 이동하면서 모든 이전 화면들 제거
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('로그아웃'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // 뒤로가기 버튼 숨기기
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: _logout)],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          DashboardPage(userEmail: userEmail),
          ProfilePage(userEmail: userEmail),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: '대시보드'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
