import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '자기소개 페이지',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'NanumGothic'),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 헤더 부분
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[400]!, Colors.blue[600]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      // 프로필 이미지
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage("pic.jpg"),
                      ),
                      SizedBox(height: 20),
                      // 이름
                      Text(
                        '윤준빈',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      // 직업/타이틀
                      Text(
                        'Flutter, Java Spring 개발자',
                        style: TextStyle(fontSize: 18, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 컨텐츠 부분
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 소개 섹션
                  _buildSection(
                    title: '소개',
                    icon: Icons.person_outline,
                    child: Text(
                      '안녕하세요! 저는 Flutter와 Java 백엔드를 배우는 개발자입니다. '
                      '사용자 친화적인 모바일 앱을 만드는 것에 열정을 가지고 있으며, '
                      '현재의 목표는 Java Spring과 Spring을 통한 . '
                      '팀워크를 중시하며, 항상 더 나은 코드를 작성하기 위해 노력합니다.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // 연락처 섹션
                  _buildSection(
                    title: '연락처',
                    icon: Icons.contact_phone,
                    child: Column(
                      children: [
                        _buildContactItem(Icons.email, 'junbin243@naver.com'),
                        _buildContactItem(Icons.phone, '+82 10-4531-2438'),
                        _buildContactItem(Icons.location_on, '부산특별시'),
                        _buildContactItem(Icons.web, 'github.com/junbean'),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  // 기술 스택 섹션
                  _buildSection(
                    title: '기술 스택',
                    icon: Icons.code,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildSkillChip('Flutter'),
                        _buildSkillChip('Dart'),
                        _buildSkillChip('Firebase'),
                        _buildSkillChip('REST API'),
                        _buildSkillChip('Git'),
                        _buildSkillChip('Android'),
                        _buildSkillChip('iOS'),
                        _buildSkillChip('SQLite'),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  // 경험 섹션
                  _buildSection(
                    title: '경험',
                    icon: Icons.work_outline,
                    child: Column(
                      children: [
                        _buildExperienceItem(
                          '모바일 앱 개발',
                          '2022 - 현재',
                          'Flutter를 사용한 크로스 플랫폼 앱 개발 경험',
                        ),
                        _buildExperienceItem(
                          '웹 개발',
                          '2021 - 2022',
                          'React와 Node.js를 사용한 웹 서비스 개발',
                        ),
                        _buildExperienceItem(
                          '프리랜서',
                          '2020 - 2021',
                          '다양한 클라이언트의 모바일 앱 프로젝트 참여',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  // 관심사 섹션
                  _buildSection(
                    title: '관심사',
                    icon: Icons.favorite_outline,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• 새로운 기술 트렌드 학습', style: _bulletTextStyle()),
                        Text('• 오픈소스 프로젝트 기여', style: _bulletTextStyle()),
                        Text('• UI/UX 디자인', style: _bulletTextStyle()),
                        Text('• 개발 커뮤니티 활동', style: _bulletTextStyle()),
                        Text('• 독서 및 영화 감상', style: _bulletTextStyle()),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue[600], size: 24),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          SizedBox(width: 12),
          Text(text, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Colors.blue[700],
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildExperienceItem(String title, String period, String description) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                period,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _bulletTextStyle() {
    return TextStyle(fontSize: 16, height: 1.6, color: Colors.grey[700]);
  }
}
