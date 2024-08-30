import 'package:flutter/material.dart';



class ReportsItem extends StatelessWidget {
  const ReportsItem({super.key});


  @override
  Widget build(BuildContext context) {
  return Row(
        
      children: [
        Container( 
          
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration( 

            color: Colors.yellow.shade200,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Column(
            
            children: [
             
              Text('Money In', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              
              
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text('+ \$3,456.98', style: TextStyle(fontSize: 18.0)),
              Icon(Icons.arrow_upward, color: Colors.green),
                ]
              )
            ],
          ),
        ),
        const SizedBox(width: 20,),
        Container(
         
          width: 160,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Column(
            
            children: [
              Text('Money Out', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text('- \$1,567.25', style: TextStyle(fontSize: 18.0)),
              Icon(Icons.arrow_downward, color: Colors.red),
                ]
               )
            ],
          ),
        ),
      ],
    );
  }
}
