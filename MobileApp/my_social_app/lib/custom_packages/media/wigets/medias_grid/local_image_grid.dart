import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_image.dart';

class LocalImageGrid extends StatelessWidget {
  final LocalImage media;
  
  const LocalImageGrid({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Image.file(
        media.file,
        fit: BoxFit.cover,
        height: constraints.constrainWidth(),
        width: constraints.constrainWidth(),
      ),
    );
  }
}