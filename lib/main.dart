import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/onboarding_screen.dart';
import 'package:flutter_application_1/Pages/controller_page.dart';
import 'package:flutter_application_1/bindings.dart';

import 'package:flutter_application_1/view/login_page.dart';
import 'package:flutter_application_1/view/sign_up_page.dart';
import 'package:get/get.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      initialRoute: '/',
      initialBinding: Binding(),
    
      getPages: [
        GetPage(name: '/', page: () => const OnBoardingScreen(), ),
        GetPage(name: '/signUp', page: () => const SignUpPage(), ),
        GetPage(name: '/login', page: () => const LoginPage(), ),
        GetPage(name: '/home', page: () => const MyApp(), )
      ],
    );
  }
}


