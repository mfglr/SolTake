import 'dart:io';

import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';

class UploadItemImagePlayer extends StatelessWidget {
  final AppFile media;
  const UploadItemImagePlayer({
    super.key,
    required this.media
  });

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(media.file.path),
      fit: BoxFit.cover,
    );
  }
}