import 'package:flutter/material.dart';

class CameraCloseButton extends StatelessWidget {
  const CameraCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withAlpha(153),
      ),
      child: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.close_outlined,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}