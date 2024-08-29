import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(Object context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('More options'),
      ),
      body: const Center(
        child: Padding(
        padding: EdgeInsets.all(35.0),
        child: 
        
        // Space between image and text
            Text(
              "More coming soon",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
        
        )
        )
        

    );
  }
  
 

}