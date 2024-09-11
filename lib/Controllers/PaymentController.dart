import 'dart:developer';
import 'package:flutter_application_1/Controllers/Prefs_Controller.dart';
import 'package:flutter_application_1/Models/userpay_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentController extends GetxController {
  PrefsController prefsController = Get.find<PrefsController>();

  static Future<void> searchBothUsersAndMakePayment(
    String senderAccountID,
    String receiverUsername,
    double paymentAmount,
    String paymentType,
  ) async {
    try {
      // Validate that receiverUsername is not empty
      if (receiverUsername.isEmpty) {
        log('Receiver username is empty');
        Get.snackbar('Error', 'Receiver username cannot be empty');
        return;
      }

      // Step 1: Search for the receiver's `userAccountID` by username
      final receiverAccountID = await _getUserAccountIDByUsername(receiverUsername);

      // Check if receiverAccountID is null
      if (receiverAccountID == null) {
        log('Receiver account ID not found');
        Get.snackbar('Error', 'Receiver account not found');
        return;
      }

      // Step 2: Proceed to make payment using both IDs
      await _makePayment(senderAccountID, receiverAccountID, paymentAmount, paymentType);
    } catch (e) {
      log('Error: $e');
    }
  }

  // Helper function to make the payment using both IDs
  static Future<void> _makePayment(
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
      "paymentType": paymentType,
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
        Get.back();
        Get.snackbar('Congrats', 'Payment successful');
      } 
    } catch (e) {
      log('Error during payment: $e');
    }
  }

  // Helper function to fetch `userAccountID` from API based on `username`
  static Future<String?> _getUserAccountIDByUsername(String username) async {
    if (username.isEmpty) {
      log('Username is empty');
      return null; // Return null if username is empty
    }

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
