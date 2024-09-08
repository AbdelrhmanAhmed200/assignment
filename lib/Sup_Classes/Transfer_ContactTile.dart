import 'package:flutter/material.dart';

class TransferContactTile extends StatelessWidget {
  
  final String name;
  final String account;
  final String paymentAmount;

  const TransferContactTile({
    super.key, 
    required this.name,
    required this.account,
    required this.paymentAmount
  });

  // Function to extract initials from the name
  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';
    if (nameParts.length > 1) {
      initials = nameParts[0][0] + nameParts[1][0];
    } else {
      initials = nameParts[0][0];
    }
    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0),
      child: Container(
        padding: const EdgeInsets.all(16),
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
          children: [
            // CircleAvatar to display initials
            CircleAvatar(
              backgroundColor: Colors.purple.shade100,
              child: Text(
                getInitials(name),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ), 
                SizedBox(width: 30,),
                Text(
                 "\$" + paymentAmount,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ), 

                  ]
                ),
                const SizedBox(height: 10,),
               
                Text(
                  account,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}
