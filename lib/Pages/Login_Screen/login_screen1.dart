import 'package:flutter/material.dart';

class LoginScreen1 extends StatelessWidget {
  const LoginScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for the image at the top
              SizedBox(
                height: 200,
                child: Image.asset("images/login.png"), // Replace with your asset image
              ),
              const SizedBox(height: 24),
              
              // Title text
              const Text(
                'Easy, Fast & Trusted',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // Subtitle text
              Text(
                'Fast money transfer and guaranteed safe transactions with others.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // Indicator dots
             
              
            ]   
          ),
        ),
      ),
    );
  }
}
