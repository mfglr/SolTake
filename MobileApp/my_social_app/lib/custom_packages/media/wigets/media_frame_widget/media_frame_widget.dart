import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_image.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/models/remote_image.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/local_image_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/local_video_frame_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/remote_image_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/remote_video_frame_widget.dart';

class MediaFrameWidget extends StatelessWidget {
  final Media media;
  final BoxFit fit;
  final String blobService;

  const MediaFrameWidget({
    super.key,
    required this.media,
    required this.blobService,
    this.fit = BoxFit.cover
  });

  @override
  Widget build(BuildContext context) {
    if(media is LocalImage){
      return LocalImageWidget(
        media: media as LocalImage,
        fit: fit,
      );
    }
    else if(media is LocalVideo){
      return LocalVideoFrameWidget(
        media: media as LocalVideo,
        fit: fit,
      );
    }
    else if(media is RemoteVideo){
      return RemoteVideoFrameWidget(
        media: media as RemoteVideo,
        blobService: blobService
      );
    }
    else{
      return RemoteImageWidget(
        blobService: blobService,
        media: media as RemoteImage
      );
    }
  }
}