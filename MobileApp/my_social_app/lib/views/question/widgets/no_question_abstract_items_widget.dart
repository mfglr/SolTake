import 'package:flutter/material.dart';

class NoQuestionAbstractItemsWidget extends StatelessWidget {
  const NoQuestionAbstractItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.not_interested,
          size: 45,
        ),
        Text(
          "No Questions",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        )
      ],
    );
  }
}