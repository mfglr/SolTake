import 'package:flutter/material.dart';

class StartVideoButton extends StatelessWidget {
  final void Function() onPressed;
  const StartVideoButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      shape: const CircleBorder(),
      onPressed: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}