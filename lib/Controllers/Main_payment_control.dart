import 'dart:convert';
import 'package:flutter_application_1/Models/main_transfer_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MainPaymentControl {
  
  // Fetch userAccountID from SharedPreferences
  Future<String?> getUserAccountId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userAccountID');
  }

  // Fetch payment details by userAccountID
  Future<List<PaymentDetail>> fetchPaymentDetails(String userAccountID) async {
    final response = await http.get(Uri.parse('https://ptechapp-5ab6d15ba23c.herokuapp.com/payments/$userAccountID'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => PaymentDetail(
        receiverAccountNumber: item['receiverAccountNumber'],
        paymentAmount: item['paymentAmount'],
      )).toList();
    } else {
      throw Exception('Failed to load payment details');
    }
  }

  // Fetch receiver name by receiverAccountNumber
  Future<ReceiverDetail> fetchReceiverName(String receiverAccountNumber) async {
    final response = await http.get(Uri.parse('https://ptechapp-5ab6d15ba23c.herokuapp.com/users?receiverAccountNumber=$receiverAccountNumber '));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Handle both list and map responses
      if (data is List && data.isNotEmpty) {
        return ReceiverDetail(userName: data[1]['username']); // Access first item
      } else if (data is Map) {
        return ReceiverDetail(userName: data['username']);
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to load receiver details');
    }
  }

  // Fetch all payment details and link with receiver names
  Future<List<Map<String, dynamic>>> fetchAllPaymentDetails() async {
    final userAccountID = await getUserAccountId();

    // Ensure userAccountID is not null before proceeding
    if (userAccountID == null) {
      throw Exception('No userAccountID found in SharedPreferences');
    }

    final payments = await fetchPaymentDetails(userAccountID);

    // For each payment, fetch receiver name and combine details
    final receiverNamesFutures = payments.map((payment) {
      return fetchReceiverName(payment.receiverAccountNumber).then((receiver) {
        return {
          'receiverName': receiver.userName,
          'paymentAmount': payment.paymentAmount,
          'receiverAccountNumber': payment.receiverAccountNumber,
        };
      });
    }).toList();

    // Wait for all receiver name fetches to complete
    final receiverNames = await Future.wait(receiverNamesFutures);

    return receiverNames;
  }
}
