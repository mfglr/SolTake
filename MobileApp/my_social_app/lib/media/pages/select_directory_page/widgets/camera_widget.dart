import 'package:flutter/material.dart';
import 'package:my_social_app/media/models/local_media.dart';

class CameraWidget extends StatelessWidget {
  final void Function(LocalMedia) remove;
  final void Function() onPressed;

  const CameraWidget({
    super.key,
    required this.remove,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.black.withAlpha(128),
        child: const Center(
          child: Icon(
            Icons.photo_camera,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}