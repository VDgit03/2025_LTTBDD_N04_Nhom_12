import 'package:flutter/material.dart';

class CrossImage extends StatelessWidget {
  const CrossImage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assests/images/0dce76f26a245bbe3422774f024e9d06.jpg',
      'assests/images/78fb17a85ecef840177b480e63657492.jpg',
      'assests/images/ff94bd243ba0b15d9e90cb183c45f52e.jpg',
    ];

    return SizedBox(
      height: 610,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
