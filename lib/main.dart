import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Login_Screen/onboarding_screen.dart';
import 'package:flutter_application_1/Pages/Nav_Bar.dart';
import 'package:flutter_application_1/view/login_page.dart';
import 'package:flutter_application_1/view/sign_up_page.dart';

import 'view/Home_page.dart';
import 'Pages/Transfer_page.dart';
import 'Pages/Reports_page.dart';
import 'view/More_page.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingScreen(),
        '/signUp': (context) => const SignUpPage(),
        '/login' : (context) => const LoginPage(),
        '/home': (context) => const MyApp(), // Added route for MyApp
      },
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const TransferPage(),
    const ReportsPage(),
    const MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
