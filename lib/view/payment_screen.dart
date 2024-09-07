import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/PaymentController.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _senderUsernameController = TextEditingController();
  final TextEditingController _receiverUsernameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void makePayment() async {
    String senderUsername = _senderUsernameController.text;
    String receiverUsername = _receiverUsernameController.text;
    double paymentAmount = double.tryParse(_amountController.text) ?? 0.0;
    String paymentType = 'test';

    // Call PaymentController to search for both sender and receiver IDs, then make the payment
    await PaymentController.searchBothUsersAndMakePayment(
      context,  // Pass the BuildContext here
      senderUsername,
      receiverUsername,
      paymentAmount,
      paymentType
    );

    // Show a confirmation or error after payment processing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Payment processed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Make Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _senderUsernameController,
              decoration: const InputDecoration(labelText: 'Your Username'),
            ),
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
              child: const Text('Send Payment',style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      ),
    );
  }
}
