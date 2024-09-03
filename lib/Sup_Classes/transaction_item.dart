import 'package:flutter/material.dart';
class TransactionItem extends StatelessWidget {
  final String title;
  final String date;
  final String amount;

  const TransactionItem({super.key, 
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.symmetric(vertical: 5.0),
       child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
       )
    );
  }
}