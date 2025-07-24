import 'package:flutter/material.dart';

class NoQuestionsWidget extends StatelessWidget {
  final String content;
  const NoQuestionsWidget({
    super.key,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.not_interested,
          size: 45,
        ),
        Text(
          content,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        )
      ],
    );
  }
}