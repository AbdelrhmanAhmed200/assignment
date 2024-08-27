import 'package:flutter/material.dart';
import 'Transfe_bulidicon1.dart';
import 'Transfer_ContactTile.dart';


class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

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
            SizedBox(width: 8), // Space between image and text
            Text(
              "               Transfer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add), // The "+" sign
            onPressed: () {
              // Define the action when the "+" button is pressed
            },
          ),
        ],
      ),
      body: const Center(
       child: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
             TransfeBulidicon1(imageUrl: "https://w7.pngwing.com/pngs/136/293/png-transparent-paypal-logo.png"),
             TransfeBulidicon1(imageUrl: "https://play-lh.googleusercontent.com/5tsGR1nI6O8Vyu25HWZXkSTBe_kCEtaifW2oJdlUPJqXH-VJjfzutnxF3H6GpoXx9BI"),
             TransfeBulidicon1(imageUrl: "https://www.instapay.eg/wp-content/uploads/2023/03/11.png"),
             TransfeBulidicon1(imageUrl: "https://www.instapay.eg/wp-content/uploads/2022/03/111-1-150x150.jpg"),
              ]
            ),
            SizedBox(height: 20,),
            TransferContacttile(name: "abdelrhman", account: "kjkdskka ajhugau ahuahd", imageUrl:"https://fbi.cults3d.com/uploaders/14684840/illustration-file/388d5e1a-7c44-4172-a0c9-0a34c088be8c/sova-avatar.jpg") ,
            TransferContacttile(name: "Al-hassan", account: "kjkdskka ajkknau ahuahd", imageUrl:"https://fbi.cults3d.com/uploaders/14684840/illustration-file/388d5e1a-7c44-4172-a0c9-0a34c088be8c/sova-avatar.jpg") ,
            TransferContacttile(name: "mazen", account: "kjjhkslkqkskka ajhugau ahuahd", imageUrl:"https://fbi.cults3d.com/uploaders/14684840/illustration-file/388d5e1a-7c44-4172-a0c9-0a34c088be8c/sova-avatar.jpg") ,
            TransferContacttile(name: "abdelrhman", account: "kjkdskka ajhugau ahuahd", imageUrl:"https://fbi.cults3d.com/uploaders/14684840/illustration-file/388d5e1a-7c44-4172-a0c9-0a34c088be8c/sova-avatar.jpg") ,
            TransferContacttile(name: "Al-hassan", account: "kjkdskka ajkknau ahuahd", imageUrl:"https://fbi.cults3d.com/uploaders/14684840/illustration-file/388d5e1a-7c44-4172-a0c9-0a34c088be8c/sova-avatar.jpg") ,
            TransferContacttile(name: "mazen", account: "kjjhkslkqkskka ajhugau ahuahd", imageUrl:"https://fbi.cults3d.com/uploaders/14684840/illustration-file/388d5e1a-7c44-4172-a0c9-0a34c088be8c/sova-avatar.jpg") ,
          ]
        )
        
        )
       )
       )

          // Placeholder content
     
    ); 
  }
}
