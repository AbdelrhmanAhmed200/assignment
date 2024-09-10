import 'dart:convert';
import 'dart:developer'; // Import the log function
import 'package:flutter_application_1/Controllers/Prefs_Controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/main_transfer_model.dart';

class MainPaymentControl extends GetxController {
  PrefsController  prefsController = Get.find<PrefsController>();

  // Fetch userAccountID from SharedPreferences
  Future<String?> getUserAccountId() async {
    final userid = prefsController.getuser();
    return  userid;
  }

  // Fetch all payment details by userAccountID (no pagination)
  Future<List<PaymentDetail>> fetchPaymentDetails(String userAccountID) async {
    final url = Uri.parse('https://ptechapp-5ab6d15ba23c.herokuapp.com/payments/$userAccountID');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;

      // Ensure correct mapping from JSON and handle potential null values
      return data.map((item) => PaymentDetail(
        receiverAccountNumber: item['receiverAccountNumber'] as String,
        paymentAmount: item['paymentAmount']?.toString() ?? '0.0', // Ensure paymentAmount is a String
      )).toList();
    } else {
      log('[MainPaymentControl] Failed to fetch payment details. Status code: ${response.statusCode}, body: ${response.body}');
      throw Exception('Failed to load payment details. Status code: ${response.statusCode}');
    }
  }

  // Fetch username for a given userAccountID
  Future<String> fetchReceiverName(String userAccountID) async {
    final url = Uri.parse('https://ptechapp-5ab6d15ba23c.herokuapp.com/users?userAccountID=$userAccountID');
    log('[MainPaymentControl] Fetching receiver name for userAccountID: $userAccountID');

    final response = await http.get(url);
    log('[MainPaymentControl] Receiver name API response status for $userAccountID: ${response.statusCode}');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;

      // Find the username based on userAccountID
      for (var item in data) {
        final accountId = item['userAccountID'] as String?;
        if (accountId == userAccountID) {
          final username = item['username'] as String? ?? 'Unknown';
          log('[MainPaymentControl] Received username for $userAccountID: $username');
          return username;
        }
      }

      // If no matching userAccountID found, return 'Unknown'
      return 'Unknown';
    } else {
      log('[MainPaymentControl] Failed to load receiver name for $userAccountID. Status code: ${response.statusCode}');
      return 'Unknown'; // Handle error gracefully by returning 'Unknown'
    }
  }

  // Fetch all payment details and link with receiver names
  Future<List<Map<String, dynamic>>> fetchAllPaymentDetails() async {
    final userAccountID = await getUserAccountId();

    if (userAccountID == null) {
      log('[MainPaymentControl] Error: No userAccountID found in SharedPreferences');
      throw Exception('No userAccountID found in SharedPreferences');
    }

    try {
      // Fetch all payment details for the user
      final payments = await fetchPaymentDetails(userAccountID);

      if (payments.isEmpty) {
        log('[MainPaymentControl] No payments found for userAccountID: $userAccountID');
        return [];
      }

      // Fetch receiver names for all payments in a single operation (if possible)
      List<Map<String, dynamic>> combinedDetails = [];

      // Optionally, you could cache fetched receiver names to avoid redundant calls
      for (final payment in payments) {
        final receiverName = await fetchReceiverName(payment.receiverAccountNumber);

        log('[MainPaymentControl] Combining payment with receiver details: Receiver Name = $receiverName, Payment Amount = ${payment.paymentAmount}');

        combinedDetails.add({
          'receiverName': receiverName,
          'paymentAmount': payment.paymentAmount,
          'receiverAccountNumber': payment.receiverAccountNumber,
        });
      }

      return combinedDetails;
    } catch (e) {
      log('[MainPaymentControl] Error fetching payment details: $e', error: e);
      throw Exception('Error fetching payment details');
    }
  }
}
