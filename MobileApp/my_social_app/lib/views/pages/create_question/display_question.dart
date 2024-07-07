import 'dart:io';

import 'package:flutter/material.dart';

class DisplayQuestion extends StatelessWidget {
  final String imagePath;
  const DisplayQuestion({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.file(File(imagePath)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: 
                (){},
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: const Text("NEXT")
                    ),
                    const Icon(Icons.arrow_circle_right_outlined)
                  ],
                )
              )
            ],
          )
        ],
      ),
      
    );
  }
}