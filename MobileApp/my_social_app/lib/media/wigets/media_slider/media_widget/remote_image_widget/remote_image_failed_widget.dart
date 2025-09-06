import 'package:flutter/material.dart';
import 'package:my_social_app/media/models/remote_image.dart';

class RemoteImageFailedWidget extends StatelessWidget {
  final RemoteImage media;
  const RemoteImageFailedWidget({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/failed.png",
      fit: BoxFit.contain,
    );
  }
}