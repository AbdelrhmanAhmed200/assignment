import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'MonthlySpendingChart.dart';
import 'Reports_item.dart';
import 'Reports_item2.dart';



class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://fbi.cults3d.com/uploaders/14684840/illustration-file/388d5e1a-7c44-4172-a0c9-0a34c088be8c/sova-avatar.jpg',
              ),
              radius: 20, // Adjust the radius as needed
            ),
             Spacer(),
             // Space between image and text
            Text(
              "Reports",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
             Spacer(),
             SizedBox(width: 39,)
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
                const SizedBox(height: 20,),
                
            
             Container(
              height: 420,
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  
                ],
              ),
            
              
             child:  const MonthlySpendingChart()
                
              ),
              const SizedBox(height: 10,),
              const ReportsItem2()
              
             
          ]
            ),
        )
        )
        )
        );
       
     
        
      
      }
      }