import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Nav_Bar.dart';
import 'package:flutter_application_1/Pages/Reports_page.dart';
import 'package:flutter_application_1/view/Home_page.dart';
import 'package:flutter_application_1/view/More_page.dart';
import 'package:flutter_application_1/view/Transfer_page.dart';

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
     MorePage(),
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