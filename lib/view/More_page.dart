import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/more_page_controller.dart';
 // Import the controller for the delete logic

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More options'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: ElevatedButton(
            onPressed: () => deleteAccount(context), // Call the method from the controller
            child: const Text('Delete Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
          ),
        ),
      ),
    );
  }
}
