import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/Login_Model.dart';

class LoginController {
  final BuildContext context;
  bool isLoading = false;

  LoginController({required this.context});

  Future<void> login(UserLogin userLogin) async {
    const String apiUrl = 'https://ptechapp-5ab6d15ba23c.herokuapp.com/user/authenticate';

    try {
      // Set loading to true
      isLoading = true;

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(userLogin.toJson()),
      );

      log('Response Status: ${response.statusCode}');
      log('Response Body: ${response.body}');

      // Handle response
      if (response.statusCode == 200 && response.body != '''{"success":false}''') {
        final data = LoginResponse.fromJson(jsonDecode(response.body));
        final userAccountID = data.data.userAccountId;

        log('data: $data');
        log('userAccountID: $userAccountID');

        // Save userAccountID to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userAccountID', userAccountID);  // Save user ID

        // Navigate to TransferPage after successful login
        Navigator.pushReplacementNamed(context, '/home', arguments: userAccountID);
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['message'] ?? 'Username or Password wrong';
        _showSnackBar('Login Failed: $errorMessage');
      }
    } catch (e) {
      _showSnackBar('Error: $e');
    } finally {
      // Set loading to false
      isLoading = false;
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
