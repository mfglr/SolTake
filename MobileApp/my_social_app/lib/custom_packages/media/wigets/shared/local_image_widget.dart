import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_image.dart';

class LocalImageWidget extends StatelessWidget {
  final LocalImage media;
  final BoxFit fit;
  const LocalImageWidget({
    super.key,
    required this.media,
    this.fit = BoxFit.cover
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Image.file(
        media.file,
        fit: fit,
        height: constraints.constrainHeight(),
        width: constraints.constrainWidth(),
      ),
    );
  }
}