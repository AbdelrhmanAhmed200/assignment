import 'package:flutter/material.dart';

import 'login_screen1.dart';
import 'login_screen2.dart';
import 'login_screan3.dart';
import 'package:flutter_application_1/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // Controller to keep track of the page we are on
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for onboarding screens
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              }
              );
            },
            children: const [
              // Replace with your actual onboarding content widgets
              LoginScreen1(),
              LoginScreen2(),
              login_screen3(),
            ],
          ),
          // Dot indicators
          Align(
            alignment: const Alignment(0.0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Skip button
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text('skip', style: TextStyle(color: Colors.black)),
                ),
                // Dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),
                // Next or Done button
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyApp()),
                          );
                        },
                        child: const Text('done',style: TextStyle(color: Colors.black)),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        
                        child: const Text('next', style: TextStyle(color: Colors.black)),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
