import 'package:flutter/material.dart';

class NoSolutions extends StatelessWidget {
  final String text;
  const NoSolutions({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.not_interested,
            size: 50,
          ),
          Text(
            text,
            style:const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}