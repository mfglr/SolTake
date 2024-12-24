import 'package:flutter/material.dart';

class PlayIcon extends StatelessWidget {
  const PlayIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(153),
        shape: BoxShape.circle
      ),
      child: Icon(
        Icons.play_arrow_rounded,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}