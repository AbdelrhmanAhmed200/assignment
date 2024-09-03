import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Login_Screen/onboarding_screen.dart';

import 'Pages/Home_page.dart';
import 'Pages/Transfer_page.dart';
import 'Pages/Reports_page.dart';
import 'Pages/More_page.dart';


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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildGradientIcon(Icons.wallet, _selectedIndex == 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildGradientIcon(Icons.send, _selectedIndex == 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildGradientIcon(Icons.analytics_rounded, _selectedIndex == 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildGradientIcon(Icons.more_horiz, _selectedIndex == 3),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildGradientIcon(IconData icon, bool isSelected) {
    if (isSelected) {
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              Color.fromARGB(255, 138, 39, 244),
              Color.fromARGB(255, 238, 127, 203),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ).createShader(bounds);
        },
        child: Icon(
          icon,
          size: 28,
          color: Colors.white, // The gradient color will override this
        ),
      );
    } else {
      return Icon(
        icon,
        size: 28,
        color: const Color.fromARGB(255, 119, 119, 119), // Gray color for unselected icons
      );
    }
  }
}
