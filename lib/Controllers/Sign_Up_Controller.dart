// lib/controllers/sign_up_controller.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/Models/Sign_Up_Model.dart';

class SignUpController {
  final BuildContext context;

  SignUpController({required this.context});

  Future<void> signUp(User user) async {
    const String apiUrl = 'https://ptechapp-5ab6d15ba23c.herokuapp.com/user/register';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['message'] ?? 'Unknown error';
        _showSnackBar('Sign Up Failed: $errorMessage');
      }
    } catch (e) {
      _showSnackBar('Error: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
