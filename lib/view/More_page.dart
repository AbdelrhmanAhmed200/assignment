import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/more_page_controller.dart'; // Import the controller for the delete logic
import 'package:flutter_application_1/view/login_page.dart'; // Import the signup page

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  void _signOut(BuildContext context) {
    // Implement sign-out logic if needed here
    // For now, we'll just navigate to the SignupPage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage ()), // Navigate to SignupPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('More options'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => deleteAccount(context), // Call the method from the controller
                child: const Text(
                  'Delete Account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20), // Add spacing between buttons
              ElevatedButton(
                onPressed: () => _signOut(context), // Navigate to SignupPage
                child: const Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
