import 'package:flutter/material.dart';
import 'package:my_social_app/media/models/remote_image.dart';

class RemoteImageNotFoundWidget extends StatelessWidget {
  final RemoteImage media;
  const RemoteImageNotFoundWidget({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/not_found.png",
      fit: BoxFit.contain,
    );
  }
}