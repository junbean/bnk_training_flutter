import 'package:ex_bank/pages/bank_products_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ex Bank',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFCB2B11, <int, Color>{
          50: Color(0xFFFFF3F2),
          100: Color(0xFFFFE4E1),
          200: Color(0xFFFFCBC4),
          300: Color(0xFFFF9B8A),
          400: Color(0xFFFF6B4F),
          500: Color(0xFFCB2B11),
          600: Color(0xFFB5260F),
          700: Color(0xFF9F220D),
          800: Color(0xFF891D0B),
          900: Color(0xFF731909),
        }),
        primaryColor: const Color(0xFFCB2B11),
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: const Color(0xFFCB2B11),
              brightness: Brightness.light,
              surface: Colors.white,
              background: Colors.white,
            ).copyWith(
              primary: const Color(0xFFCB2B11),
              surface: Colors.white,
              background: Colors.white,
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const BankProductsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
