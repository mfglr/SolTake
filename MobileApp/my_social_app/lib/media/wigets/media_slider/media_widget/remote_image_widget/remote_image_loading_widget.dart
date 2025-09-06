import 'package:flutter/material.dart';
import 'package:my_social_app/media/models/remote_image.dart';

class RemoteImageLoadingWidget extends StatelessWidget {
  final RemoteImage media;
  const RemoteImageLoadingWidget({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: media.dimention.aspectRatio,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
        ),
      ),
    );
  }
}