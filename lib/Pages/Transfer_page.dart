import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/payment_screen.dart';
import '../Sup_Classes/Transfe_bulidicon1.dart';
import '../Sup_Classes/Transfer_ContactTile.dart';
import '../Controllers/main_payment_control.dart'; // Assuming this is the correct path


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
        payments = fetchedPayments;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  void _refreshPage() {
    _loadPaymentDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
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
              // Display loading, error or data
              if (isLoading)
                const Center(child: CircularProgressIndicator()),
              if (hasError)
                const Center(child: Text('Error loading payment details')),
              if (!isLoading && !hasError && payments.isEmpty)
                const Center(child: Text('No payment details found')),
              if (!isLoading && !hasError)
                ...payments.reversed.map((payment) => TransferContactTile(
                      name: payment['receiverName'],
                      account: "AW BANK UNI 234-46589-000",
                      paymentAmount: payment['paymentAmount'],
                    )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
