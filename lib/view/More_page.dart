import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/Prefs_Controller.dart';
import 'package:flutter_application_1/Controllers/more_page_controller.dart'; // Import the controller for the delete logic
import 'package:get/get.dart'; // Import the signup page

class MorePage extends StatelessWidget {
   MorePage({super.key});
  PrefsController  prefsController = Get.find<PrefsController>();
  

  void _signOut() {
  prefsController.deleteuser();
  Get.offAllNamed('/login');
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('More options'),
      ),
      body: 
      Center(
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
                onPressed: () => _signOut(), // Navigate to SignupPage
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
