import 'package:flutter/material.dart';

class ImageNotFoundWidget extends StatelessWidget {
  const ImageNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cancel_outlined,
            size: 40,
          ),
          Text(
            "Not Found!",
            style: TextStyle(
              fontSize: 45
            ),
          )
        ],  
      ),
    );
  }
}