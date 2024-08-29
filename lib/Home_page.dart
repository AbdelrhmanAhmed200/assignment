import 'package:flutter/material.dart';
import 'transaction_item.dart';
import 'Transactions_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://fbi.cults3d.com/uploaders/14684840/illustration-file/388d5e1a-7c44-4172-a0c9-0a34c088be8c/sova-avatar.jpg'),
                  radius: 30,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good morning',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Sova',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
           
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20 , width: 50,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8 ,
                    height: MediaQuery.of(context).size.height * 0.15 ,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                    ),
                    ),
                    child: 
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text(
                            " Current Balance",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            ' \$12,567,890',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    
                  ),
                  const SizedBox(height: 1,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8 ,
                    height: MediaQuery.of(context).size.width * 0.2 ,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(255, 98, 47, 238), Color.fromARGB(255, 238, 156, 241)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                    ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text(
                          ' 3452 1235 7894 1678',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          ' 4/25/2025',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LAST TRANSACTIONS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // Navigate to the TransactionsPage when 'More' is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TransactionsPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'More',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const TransactionItem(
              title: 'Shopping',
              date: 'Tue 15.06.2021',
              amount: '\$29.90',
            ),
            const TransactionItem(
              title: 'Movie Ticket',
              date: 'Wed 16.06.2021',
              amount: '\$9.50',
            ),
            const TransactionItem(
              title: 'Amazon',
              date: 'Thu 17.06.2021',
              amount: '\$19.30',
            ),
            const TransactionItem(
              title: 'Udemy',
              date: 'Fri 18.06.2021',
              amount: '\$14.99',
            ),
            const SizedBox(height: 10),
            const TransactionItem(
              title: 'Books',
              date: 'Fri 08.05.2021',
              amount: '\$14.00',
            ),
            const SizedBox(height: 10),
            const TransactionItem(
              title: 'Spotify',
              date: 'Mon 11.03.2021',
              amount: '\$8.99',
            ),
            const SizedBox(height: 10),
            const TransactionItem(
              title: 'Tryhackme',
              date: 'Fri 5.11.2021',
              amount: '\$108.99',
            ),
          ],
        ),
      ),
    );
  }
}
