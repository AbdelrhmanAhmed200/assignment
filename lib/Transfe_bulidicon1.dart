import 'package:flutter/material.dart';

class TransfeBulidicon1 extends StatelessWidget {
  final String imageUrl;

  const TransfeBulidicon1({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return buildIconTransfer(imageUrl);
  }

  Padding buildIconTransfer(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Container(
        width: 66,
        height: 66,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
