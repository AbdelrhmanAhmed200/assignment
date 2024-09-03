import 'package:flutter/material.dart';
import 'package:flutter_application_1/Sup_Classes/transaction_item.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: const Center(
        child: Padding(
        padding: EdgeInsets.all(35.0),
        child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width:10,),
                Text(" Jan"),
                 SizedBox(width: 10,),
                Text(" Feb"),
                 SizedBox(width: 10,),
                Text(" Apri"),
                 SizedBox(width: 10,),
                Text(" Aug"),
                 SizedBox(width: 10,),
                Text(" Oct"),
              ],
            ),
            SizedBox(height: 30),
            TransactionItem(
              title: ' Shopping',
              date: ' Tue 15.06.2021',
              amount: '\$29.90 ',
            ),
            TransactionItem(
              title: ' Movie Ticket',
              date: ' Wed 16.06.2021',
              amount: '\$9.50 ',
            ),
            TransactionItem(
              title: ' Amazon',
              date: ' Thu 17.06.2021',
              amount: '\$19.30 ',
            ),
            TransactionItem(
              title: ' Udemy',
              date: ' Fri 18.06.2021',
              amount: '\$14.99 ',
            ),
            SizedBox(height: 10),
            TransactionItem(
              title: ' Books',
              date: ' Fri 08.05.2021',
              amount: '\$14.00 ',
            ),
            SizedBox(height: 10),
            TransactionItem(
              title: ' Spotify',
              date: ' Mon 11.03.2021',
              amount: '\$8.99 ',
            ),
             SizedBox(height: 10),
            TransactionItem(
              title: ' Tryhackme',
              date: 'Fri 5.11.2021',
              amount: '\$108.99 ',
            ),
             SizedBox(height: 10),
            TransactionItem(
              title: ' Discord',
              date: 'Sun 5.12.2023',
              amount: '\$99.50 ',
            ),
            SizedBox(height: 10),
            TransactionItem(
              title: 'Chat-Gpt',
              date: 'Wed 15.12.2023',
              amount: '\$240 ',
            ),
          ],
        ),
      ),
     
      )
      )
    );
  }
}