import 'package:flutter/material.dart';

class NoSolutionImage extends StatelessWidget {
  const NoSolutionImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image
      .asset(
        "assets/images/no_image.jpg",
        fit: BoxFit.cover,
      );
  }
}