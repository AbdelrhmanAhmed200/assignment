import 'package:flutter/material.dart';

class TransfeBulidicon1 extends StatelessWidget {
  final String image;

  const TransfeBulidicon1({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return buildIconTransfer(image);
  }

  Padding buildIconTransfer(String image) {
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
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Padding around the image
          child: Container(
            width: 50, // Adjust the size of the image
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), // Square with slight rounding
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain, // Ensures the entire image fits inside the container
              ),
            ),
          ),
        ),
      ),
    );
  }
}
