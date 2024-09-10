import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/Prefs_Controller.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

PrefsController  prefsController = Get.find<PrefsController>();
Future<void> deleteAccount(BuildContext context) async {
  // Retrieve userAccountID from SharedPreferences
  
  String? userAccountID = prefsController.getuser();

  if (userAccountID != null) {
    
    // Make the API call to delete the account
    var response = await http.delete(
      Uri.parse('https://ptechapp-5ab6d15ba23c.herokuapp.com/user/$userAccountID'),
    );

    if (response.statusCode == 500) {
      log('Response Status: ${response.statusCode}');
      // Account deleted successfully
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account deleted successfully')),
      );

      // Navigate to the SignUpPage after deletion
      Navigator.pushReplacementNamed(context, '/signUp');
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete account')),
      );
    }
  } else {
    // Handle case where userAccountID is not found
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User not logged in')),
    );
  }
}
