import 'package:flutter/material.dart';

class TakePhotoButton extends StatelessWidget {
  final void Function() onPressed;
  const TakePhotoButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: onPressed,
      child: const Icon(Icons.photo_camera)
    );
  }
}