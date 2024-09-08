import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/userpay_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentController {
  static Future<void> searchBothUsersAndMakePayment(
    BuildContext context,
    String senderAccountID,
    String receiverUsername,
    double paymentAmount,
    String paymentType,
  ) async {
    try {
      // Step 1: Search for the sender's `userAccountID` by username
      final receiverAccountID = await _getUserAccountIDByUsername(receiverUsername);
      if (receiverAccountID == null) {
        log('Receiver user not found');
        _showSnackBar(context, 'Receiver user not found');
        return;
      }

      // Step 2: Proceed to make payment using both IDs
      await _makePayment(context, senderAccountID, receiverAccountID, paymentAmount, paymentType);
    } catch (e) {
      log('Error: $e');
      _showSnackBar(context, 'Error occurred: $e');
    }
  }

  // Helper function to make the payment using both IDs
  static Future<void> _makePayment(
    BuildContext context,
    String senderAccountID,
    String receiverAccountID,
    double paymentAmount,
    String paymentType,
  ) async {
    Map<String, dynamic> paymentData = {
      "receiverAccountNumber": receiverAccountID,
      "senderAccountNumber": senderAccountID,
      "paymentDate": DateTime.now().toIso8601String().split('T')[0],
      "paymentAmount": paymentAmount,
      "paymentType": paymentType
    };

    try {
      final response = await http.post(
        Uri.parse('https://ptechapp-5ab6d15ba23c.herokuapp.com/payments/transfer'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(paymentData),
      );

      log('Response Status: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        log('Payment successful');
        _showSnackBar(context, 'Payment successful');
        Navigator.pop(context); // Return to the previous screen
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['message'] ?? 'Check your data';
        _showSnackBar(context, 'Payment Failed: $errorMessage');
      }
    } catch (e) {
      log('Error during payment: $e');
      _showSnackBar(context, 'Payment failed due to an error: $e');
    }
  }

  // Function to show SnackBar
  static void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3), // Duration for how long the SnackBar will be visible
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Helper function to fetch `userAccountID` from API based on `username`
  static Future<String?> _getUserAccountIDByUsername(String username) async {
    final String searchUrl = 'https://ptechapp-5ab6d15ba23c.herokuapp.com/users?username=$username';

    try {
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
    } catch (e) {
      log('Error fetching user: $e');
      return null;
    }
  }
}
