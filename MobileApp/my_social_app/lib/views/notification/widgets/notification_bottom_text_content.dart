import 'package:flutter/material.dart';

class NotificationBottomTextContent extends StatelessWidget {
  final String content;
  const NotificationBottomTextContent({
    super.key,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "\"$content\"",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
      ),
    );
  }
}