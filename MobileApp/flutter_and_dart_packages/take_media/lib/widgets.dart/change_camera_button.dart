import 'package:flutter/material.dart';

class ChangeCameraButton extends StatelessWidget {
  final void Function() onPressed;
  const ChangeCameraButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withAlpha(153),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.change_circle_outlined,
          color: Colors.white,
          size: 25,
        )
      ),
    );
  }
}