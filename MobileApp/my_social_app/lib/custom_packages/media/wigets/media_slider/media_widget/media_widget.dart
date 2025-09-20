import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_widget/local_video_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_widget/remote_video_widget.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_widget/local_image_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_widget/remote_image_widget.dart';
import 'package:my_social_app/custom_packages/media/models/local_image.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/models/remote_image.dart';

class MediaWidget extends StatelessWidget {
  final Media media;
  const MediaWidget({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    if(media is LocalImage){
      return LocalImageWidget(
        media: media as LocalImage
      );
    }
    else if(media is RemoteImage){
      return RemoteImageWidget(
        media: media as RemoteImage,
        blobService: AppClient.blobService
      );
    }
    else if(media is LocalVideo){
      return LocalVideoWidget(
        media: media as LocalVideo
      );
    }
    else{
      return RemoteVideoWidget(
        blobService: AppClient.blobService,
        media: media as RemoteVideo,
      );
    }
  }
}