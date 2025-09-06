import 'package:flutter/material.dart';
import 'package:my_social_app/media/models/remote_image.dart';

class RemoteImageCompletedWidget extends StatelessWidget {
  final RemoteImage media;
  const RemoteImageCompletedWidget({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      media.bytes!,
    );
  }
}