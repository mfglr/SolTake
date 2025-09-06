import 'package:flutter/material.dart';
import 'package:my_social_app/media/models/local_image.dart';

class LocalImageWidget extends StatelessWidget {
  final LocalImage localImage;
  const LocalImageWidget({
    super.key,
    required this.localImage
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Image.file(
        localImage.file,
        fit: BoxFit.cover,
        height: constraints.constrainHeight(),
        width: constraints.constrainWidth(),
      ),
    );
  }
}