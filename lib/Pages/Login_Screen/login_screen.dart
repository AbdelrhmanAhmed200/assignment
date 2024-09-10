import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  String  title, description,image;
   LoginScreen({super.key,required  this.title,required this.description,required this.image});



  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for the image at the top
              SizedBox(
                height: 200,
                child: Image.asset(image), // Replace with your asset image
              ),
              const SizedBox(height: 24),
              
              // Title text
               Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // Subtitle text
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // Indicator dots
             
              
            ]   
          ),
        ),
      );
    
  }
}
