import 'package:flutter/material.dart';



class ReportsItem2 extends StatelessWidget {
  const ReportsItem2({super.key});


  @override
  Widget build(BuildContext context) {
  return Column(
    
      
     
     
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container( 
         
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration( 

            color: const Color.fromARGB(255, 174, 227, 248),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('In Budget', style: TextStyle(fontWeight: FontWeight.bold)),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text('Shopping', style: TextStyle(fontSize:12.0 )),
              Spacer(),
              Text("\$50.00/\$100.00")
              
                ]
              )
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 248, 205, 242),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Out of Budget', style: TextStyle(fontWeight: FontWeight.bold)),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text('Subscription', style: TextStyle(fontSize: 12.0)),
              Spacer(),
              Text("\$50.00/\$100.00")
              
                ]
               )
            ],
          ),
        ),
      ],
    );
  }
}
