import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_image.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/models/remote_image.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/local_image_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/local_video_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/remote_image_widget.dart' show RemoteImageWidget;
import 'package:my_social_app/custom_packages/media/wigets/shared/remote_video_widget.dart';

class MediaWidget extends StatelessWidget {
  final Media media;
  final String blobService;
  const MediaWidget({
    super.key,
    required this.media,
    required this.blobService,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: constraints.constrainWidth() / media.dimention.aspectRatio,
        width: constraints.constrainWidth(),
        child: Builder(
          builder: (context){
            if(media is LocalImage){
              return LocalImageWidget(
                media: media as LocalImage,
              );
            }
            else if(media is LocalVideo){
              return LocalVideoWidget(
                media: media as LocalVideo,
              );
            }
            else if(media is RemoteImage){
              return RemoteImageWidget(
                blobService: blobService,
                media: media as RemoteImage,
              );
            }
            else{
              return RemoteVideoWidget(
                blobService: blobService,
                media: media as RemoteVideo,
              );
            }
          }
        ),
      )
    );
  }
}