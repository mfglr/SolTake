import 'package:flutter/material.dart';

class PlayIcon extends StatelessWidget {
  const PlayIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(128),
        shape: BoxShape.circle
      ),
      child: const Icon(
        Icons.play_arrow,
        color: Colors.white,
      ),
    );
  }
}