import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_social_app/media/models/local_image.dart';

class LocalImageWidget extends StatelessWidget {
  final LocalImage media;
  const LocalImageWidget({
    super.key,
    required this.media
  });

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(media.file.path),
      fit: BoxFit.contain,
    );
  }
}