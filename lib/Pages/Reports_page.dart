import 'package:flutter/material.dart';
import '../MonthlySpendingChart.dart';
import '../Reports_item.dart';
import '../Reports_item2.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

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
                  padding: const EdgeInsets.all(2), // Space between avatar and border
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 98, 47, 238),
                        Color.fromARGB(255, 239, 142, 242),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://fbi.cults3d.com/uploaders/14684840/illustration-file/388d5e1a-7c44-4172-a0c9-0a34c088be8c/sova-avatar.jpg'),
                    radius: 20,
                  ),
                ),
                Positioned(
                  top: 3, // Adjust this to position the dot correctly
                  right: 0, // Adjust this to position the dot correctly
                  child: Container(
                    width: 8.47,
                    height: 8.47,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(219, 245, 5, 5),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Space between image and text
            const Text(
              "Reports",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const SizedBox(width: 39),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ReportsItem(),
                const SizedBox(height: 20),
                Container(
                  height: 420,
                  padding: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      // Add any shadow if needed
                    ],
                  ),
                  child: const MonthlySpendingChart(),
                ),
                const SizedBox(height: 10),
                const ReportsItem2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
