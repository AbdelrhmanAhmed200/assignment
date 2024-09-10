import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/payment_screen.dart';
import '../Sup_Classes/Transfe_bulidicon1.dart';
import '../Sup_Classes/Transfer_ContactTile.dart';
import '../Controllers/main_payment_control.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  List<Map<String, dynamic>> payments = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _loadPaymentDetails(); // Load data on widget initialization
  }

  Future<void> _loadPaymentDetails() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      final fetchedPayments = await MainPaymentControl().fetchAllPaymentDetails();
      setState(() {
        payments = fetchedPayments.reversed.toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
      debugPrint('Error fetching payment details: $error'); // Print error details
    }
  }

  void _refreshPage() {
    _loadPaymentDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 98, 47, 238),
                        Color.fromARGB(255, 239, 142, 242)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 238, 238, 239),
                          Color.fromARGB(255, 251, 251, 251)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/me.png'),
                      radius: 20,
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(219, 245, 5, 5),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const SizedBox(width: 8),
            const Text(
              "Transfer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                TransfeBulidicon1(image: "images/icons/k(1).png"),
                TransfeBulidicon1(image: "images/icons/s(1).png"),
                TransfeBulidicon1(image: "images/icons/p(1).png"),
                TransfeBulidicon1(image: "images/icons/n(1).png"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Transfers",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _refreshPage,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
  child: isLoading
      ? const Center(child: CircularProgressIndicator())
      : hasError
          ? const Center(child: Text('Error loading payment details'))
          : payments.isEmpty
              ? const Center(child: Text('No payment details found'))
              : ListView.builder(
                reverse: false,
                  itemCount: payments.length,
                  itemBuilder: (context, index) {
                    if (index < 0 || index >= payments.length) {
                      log('[TransferPage] Invalid index: $index for payments length: ${payments.length}');
                      return const SizedBox.shrink();  // Prevent further rendering if index is invalid
                    }

                    final payment = payments[index];

                    // Log the payment for debugging
                    log('[TransferPage] Payment at index $index: $payment');

                    // Handle invalid or null payment data gracefully
                    if (payment.isEmpty) {
                      log('[TransferPage] Invalid or null payment at index $index');
                      return const SizedBox.shrink();  // Return empty widget if invalid
                    }

                    // Extract details safely
                    final receiverName = payment['receiverName'] ?? 'Unknown Receiver';
                    final accountNumber = payment['receiverAccountNumber'] ?? 'Unknown Account';
                    final paymentAmount = payment['paymentAmount']?.toString() ?? '0.0';

                    log('[TransferPage] Displaying payment: Receiver Name = $receiverName, '
                        'Account Number = $accountNumber, Payment Amount = $paymentAmount');

                    // Ensure valid data before rendering TransferContactTile
                    return TransferContactTile(
                      name: receiverName,
                      account: "AW BANK UNI 234-46589-000",
                      paymentAmount: paymentAmount,
                    );
                  },
                ),
)


          ],
        ),
      ),
    );
  }
}
