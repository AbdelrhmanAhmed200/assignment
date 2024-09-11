import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/Home_Controller.dart';
import 'package:flutter_application_1/Controllers/PaymentController.dart';
import 'package:flutter_application_1/Controllers/Prefs_Controller.dart';
import 'package:flutter_application_1/Models/Home_page_model.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _receiverUsernameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String? _senderAccountID;
  final UserController _controller = Get.put(UserController());
  PrefsController prefsController = Get.find<PrefsController>();

  @override
  void initState() {
    super.initState();
    _loadSenderAccountID();
  }

  // Load the sender's account ID from shared preferences
  Future<void> _loadSenderAccountID() async {
    setState(() {
      _senderAccountID = prefsController.getuser();
    });
  }

  void makePayment() async {
    String receiverUsername = _receiverUsernameController.text;

    // Validate receiver username
    if (receiverUsername.isEmpty) {
      Get.snackbar('Error', 'Receiver username cannot be empty');
      return;
    }

    User? user = await _controller.fetchUserByAccountId();
    if (_senderAccountID == null) {
      Get.snackbar('Error', 'Sender account ID not available');
      return;
    }

    double paymentAmount = double.tryParse(_amountController.text) ?? 0.0;
    if (paymentAmount == 0) {
      Get.snackbar('Error', 'Enter a valid payment amount');
      return;
    }

    if (paymentAmount > user!.balance) {
      Get.snackbar('Error', 'Insufficient balance');
      return;
    }

    String paymentType = 'test'; // Adjust the payment type as needed

    // Proceed to make the payment
    await PaymentController.searchBothUsersAndMakePayment(
      _senderAccountID!,
      receiverUsername,
      paymentAmount,
      paymentType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Make Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _receiverUsernameController,
              decoration: const InputDecoration(labelText: 'Receiver Username'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: makePayment,
              child: const Text('Send Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
