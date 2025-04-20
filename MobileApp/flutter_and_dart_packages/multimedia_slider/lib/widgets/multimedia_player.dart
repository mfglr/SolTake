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
  final bool displayRemaningDuration;
  final bool displayVolume;
  final bool displayPlayButton;
  final bool play;
  final void Function() onInit;

  const MultimediaPlayer({
    super.key,
    required this.media,
    required this.blobServiceUrl,
    required this.notFoundImagePath,
    required this.noImagePath,
    required this.onInit,
    this.displayRemaningDuration = true,
    this.displayVolume = true,
    this.displayPlayButton = true,
    this.play = false,
  });

  @override
  Widget build(BuildContext context) {
    return media.multimediaType == MultimediaType.image 
      ? MultimediaImagePlayer(
          media: media,
          notFoundImagePath: notFoundImagePath,
          noImagePath: noImagePath,
          onInit: onInit,
        )
      : MultimediaVideoPlayer(
          media: media,
          blobServiceUrl: blobServiceUrl,
          displayPlayButton: displayPlayButton,
          displayRemaningDuration: displayRemaningDuration,
          displayVolume: displayVolume,
          play: play,
        );
  }
}