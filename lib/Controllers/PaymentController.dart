import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/userpay_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentController {
  static Future<void> searchBothUsersAndMakePayment(
      BuildContext context, String senderUsername, String receiverUsername, double paymentAmount, String paymentType) async {
    try {
      // Step 1: Search for the sender's `userAccountID` by username
      final senderAccountID = await _getUserAccountIDByUsername(senderUsername);
      if (senderAccountID == null) {
        log('Sender user not found');
        _showSnackBar(context, 'Sender user not found');
        return;
      }

      // Step 2: Search for the receiver's `userAccountID` by username
      final receiverAccountID = await _getUserAccountIDByUsername(receiverUsername);
      if (receiverAccountID == null) {
        log('Receiver user not found');
        _showSnackBar(context, 'Receiver user not found');
        return;
      }

      // Step 3: Proceed to make payment using both IDs
      await _makePayment(context, senderAccountID, receiverAccountID, paymentAmount, paymentType);
    } catch (e) {
      log('Error: $e');
      _showSnackBar(context, 'Error occurred: $e');
    }
  }

  // Helper function to make the payment using both IDs
  static Future<void> _makePayment(
      BuildContext context, String senderAccountID, String receiverAccountID, double paymentAmount, String paymentType) async {
    Map<String, dynamic> paymentData = {
      "receiverAccountNumber": receiverAccountID,
      "senderAccountNumber": senderAccountID,
      "paymentDate": DateTime.now().toIso8601String().split('T')[0],
      "paymentAmount": paymentAmount,
      "paymentType": paymentType
    };

    final response = await http.post(
      Uri.parse('https://ptechapp-5ab6d15ba23c.herokuapp.com/payments/transfer'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(paymentData),
    );

    if (response.statusCode == 200) {
      log('Payment successful');
      _showSnackBar(context, 'Payment successful');
    } else {
      final errorData = jsonDecode(response.body);
      final errorMessage = errorData['message'] ?? 'Check your data';
      _showSnackBar(context, 'Payment Failed: $errorMessage');
    }
  }

  // Helper function to fetch `userAccountID` from API based on `username` using GET request
  static Future<String?> _getUserAccountIDByUsername(String username) async {
    final String searchUrl = 'https://ptechapp-5ab6d15ba23c.herokuapp.com/users?username=$username';

    final response = await http.get(
      Uri.parse(searchUrl),
      headers: {'Content-Type': 'application/json'},
    );

    log('Response Status: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);

      log('Parsed JSON List: $jsonResponse');

      List<Userpay> users = jsonResponse.map((data) => Userpay.fromJson(data)).toList();

      for (var user in users) {
        if (user.username == username) {
          return user.userAccountID;
        }
      }

      log('userAccountID not found in the response list');
      return null;
    } else {
      log('Failed to find user: ${response.body}');
      return null;
    }
  }

  // Function to show SnackBar
  static void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
