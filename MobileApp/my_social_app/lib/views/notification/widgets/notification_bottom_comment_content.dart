import 'package:flutter/material.dart';

class NotificationBottomCommentContent extends StatelessWidget {
  final String content;
  const NotificationBottomCommentContent({
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