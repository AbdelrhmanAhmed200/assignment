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
             Spacer(),
            SizedBox(width: 8), // Space between image and text
            Text(
              "Transfer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
             Spacer(),
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
            TransferContacttile(name: "Abdelrhman Ahmed", account: "AW BANK UNI 234-46589-000", imageUrl:"https://scontent.fcai19-7.fna.fbcdn.net/v/t39.30808-1/315871627_112950348300212_3075114113880964300_n.jpg?stp=c0.0.750.750a_dst-jpg_s200x200&_nc_cat=104&ccb=1-7&_nc_sid=0ecb9b&_nc_ohc=Kc5qdz1yW94Q7kNvgGdpxK_&_nc_ht=scontent.fcai19-7.fna&oh=00_AYCDa1P7IcsQGZ70_Un8KPouY9FRKVGMwr6PA4bO2TQ9vQ&oe=66D68B4B") ,
            TransferContacttile(name: "Al-hassan Osama", account: "AW BANK UNI 234-46589-000", imageUrl:"https://scontent.fcai19-7.fna.fbcdn.net/v/t1.6435-9/188226212_572939997023464_187898853519995907_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=epSD4ZpfRyQQ7kNvgGMtJJX&_nc_ht=scontent.fcai19-7.fna&oh=00_AYDHerJIe5on0d2znC2LGoMkOMrYayua8n92DtMofPPwPQ&oe=66F855B0") ,
            TransferContacttile(name: "Mazen Ahmed", account: "AW BANK UNI 234-46589-000", imageUrl:"https://scontent.fcai19-7.fna.fbcdn.net/v/t39.30808-6/449055989_3764299810481861_1934025136644499778_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=127cfc&_nc_ohc=Yb9zJ064XNwQ7kNvgEE1q2B&_nc_ht=scontent.fcai19-7.fna&oh=00_AYAbwzbBxp5u27g9Ht_b9nXxmjAVbr1zhIngc8v9hNzUnQ&oe=66D6A04C") ,
            TransferContacttile(name: "Evelyn Smith", account: "AW BANK UNI 234-46589-000", imageUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYAjcwBzQmPFfa_fhMdbthytgfS-tKIOR5Wg&s") ,
            TransferContacttile(name: "Oliver Wilson", account: "AW BANK UNI 234-46589-000", imageUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHCSHsCL9xlfWXE8FrvpJZCRbyyhl5ekt-Cw&s") ,
            TransferContacttile(name: "Sophia Baker", account: "AW BANK UNI 234-46589-000", imageUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1QckzjSN5rBxhxXy2rt24m_pQNkuZuhnIkg&s") ,
          ]
        )
        
        )
       )
       )

          // Placeholder content
     
    ); 
  }
}
