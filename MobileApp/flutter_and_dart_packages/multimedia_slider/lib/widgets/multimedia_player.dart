import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:multimedia_slider/widgets/multimedia_image_player.dart';
import 'package:multimedia_slider/widgets/multimedia_video_player.dart';

class MultimediaPlayer extends StatelessWidget {
  final Multimedia media;
  final String blobServiceUrl;
  final String notFoundImagePath;
  final String noImagePath;

  const MultimediaPlayer({
    super.key,
    required this.media,
    required this.blobServiceUrl,
    required this.notFoundImagePath,
    required this.noImagePath
  });

  @override
  Widget build(BuildContext context) {
    return media.multimediaType == MultimediaType.image 
      ? MultimediaImagePlayer(
          media: media,
          blobServiceUrl: blobServiceUrl,
          notFoundImagePath: notFoundImagePath,
          noImagePath: noImagePath
        )
      : MultimediaVideoPlayer(
          media: media,
          blobServiceUrl: blobServiceUrl
        );
  }
}