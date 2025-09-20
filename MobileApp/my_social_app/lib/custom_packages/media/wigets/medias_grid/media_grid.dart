import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_image.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/models/remote_image.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/medias_grid/local_image_grid.dart';
import 'package:my_social_app/custom_packages/media/wigets/medias_grid/local_video_grid.dart';
import 'package:my_social_app/custom_packages/media/wigets/medias_grid/remote_image_grid.dart';
import 'package:my_social_app/custom_packages/media/wigets/medias_grid/remote_video_grid_widget.dart';
import 'package:my_social_app/services/app_client.dart';

class MediaGrid extends StatelessWidget {
  final Media media;
  const MediaGrid({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
      if(media is LocalImage){
        return LocalImageGrid(media: media as LocalImage);
      }
      else if(media is RemoteImage){
        return RemoteImageGrid(
          media: media as RemoteImage,
          baseUrl: AppClient.blobService
        );
      }
      else if(media is LocalVideo){
        return LocalVideoGrid(media: media as LocalVideo);
      }
      else{
        return RemoteVideoGridWidget(
          blobService: AppClient.blobService,
          media: media as RemoteVideo,
        );
      }
    });
  }
}