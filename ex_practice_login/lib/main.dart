import 'package:ex_practice_login/pages/home_page.dart';
import 'package:ex_practice_login/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Home App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 초기 화면을 로그인 페이지로 설정
      initialRoute: '/login',
      // 라우트 정의
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// 대시보드 페이지
class DashboardPage extends StatelessWidget {
  final String userEmail;

  const DashboardPage({super.key, this.userEmail = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '안녕하세요! 👋',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            userEmail.isNotEmpty
                ? '$userEmail님, 오늘도 좋은 하루 되세요!'
                : '오늘도 좋은 하루 되세요!',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          SizedBox(height: 24),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildDashboardCard(
                  title: '할 일',
                  count: '5',
                  icon: Icons.task_alt,
                  color: Colors.green,
                  onTap: () {
                    // 할 일 페이지로 네비게이션
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('할 일 페이지로 이동')));
                  },
                ),
                _buildDashboardCard(
                  title: '메시지',
                  count: '12',
                  icon: Icons.message,
                  color: Colors.blue,
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('메시지 페이지로 이동')));
                  },
                ),
                _buildDashboardCard(
                  title: '알림',
                  count: '3',
                  icon: Icons.notifications,
                  color: Colors.orange,
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('알림 페이지로 이동')));
                  },
                ),
                _buildDashboardCard(
                  title: '설정',
                  count: '',
                  icon: Icons.settings,
                  color: Colors.purple,
                  onTap: () {
                    // 설정 탭으로 이동할 수 있도록 콜백 추가 가능
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('설정 탭으로 이동')));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required String count,
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              if (count.isNotEmpty) ...[
                SizedBox(height: 4),
                Text(
                  count,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// 프로필 페이지
class ProfilePage extends StatelessWidget {
  final String userEmail;

  const ProfilePage({Key? key, this.userEmail = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 24),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue[100],
            child: Icon(Icons.person, size: 60, color: Colors.blue),
          ),
          SizedBox(height: 16),
          Text(
            '사용자',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            userEmail.isNotEmpty ? userEmail : 'test@example.com',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          SizedBox(height: 32),
          _buildProfileItem(
            icon: Icons.email,
            title: '이메일',
            subtitle: userEmail.isNotEmpty ? userEmail : 'test@example.com',
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('이메일 편집')));
            },
          ),
          _buildProfileItem(
            icon: Icons.phone,
            title: '전화번호',
            subtitle: '+82 10-1234-5678',
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('전화번호 편집')));
            },
          ),
          _buildProfileItem(
            icon: Icons.location_on,
            title: '위치',
            subtitle: '서울, 대한민국',
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('위치 편집')));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 24),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}

// 설정 페이지
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '설정',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          _buildSettingItem(
            icon: Icons.notifications,
            title: '알림',
            subtitle: '푸시 알림 설정',
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _notificationsEnabled ? '알림이 활성화되었습니다' : '알림이 비활성화되었습니다',
                    ),
                  ),
                );
              },
            ),
          ),
          _buildSettingItem(
            icon: Icons.dark_mode,
            title: '다크 모드',
            subtitle: '어두운 테마 사용',
            trailing: Switch(
              value: _darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _darkModeEnabled = value;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _darkModeEnabled ? '다크 모드가 활성화되었습니다' : '다크 모드가 비활성화되었습니다',
                    ),
                  ),
                );
              },
            ),
          ),
          _buildSettingItem(
            icon: Icons.language,
            title: '언어',
            subtitle: '한국어',
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('언어 설정 페이지로 이동')));
            },
          ),
          _buildSettingItem(
            icon: Icons.security,
            title: '보안',
            subtitle: '비밀번호 및 보안 설정',
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('보안 설정 페이지로 이동')));
            },
          ),
          _buildSettingItem(
            icon: Icons.help,
            title: '도움말',
            subtitle: '자주 묻는 질문',
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('도움말 페이지로 이동')));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 24),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
