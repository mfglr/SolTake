import 'dart:io';

import 'package:app_file/app_file.dart';
import 'package:flutter/cupertino.dart';

class ImageSlide extends StatelessWidget {
  final AppFile file;
  const ImageSlide({
    super.key,
    required this.file
  });

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(file.file.path)
    );
  }
}