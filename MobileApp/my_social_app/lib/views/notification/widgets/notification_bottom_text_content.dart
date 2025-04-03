import 'package:flutter/material.dart';
import 'package:my_social_app/helpers/string_helpers.dart';

class NotificationBottomTextContent extends StatelessWidget {
  final String content;
  const NotificationBottomTextContent({
    super.key,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "\"${compressText(content, 30) }\"",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.black
      ),
    );
  }
}