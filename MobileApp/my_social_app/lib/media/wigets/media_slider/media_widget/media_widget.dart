import 'package:flutter/material.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/media/wigets/media_slider/media_widget/local_image_widget/local_image_widget.dart';
import 'package:my_social_app/media/wigets/media_slider/media_widget/remote_image_widget/remote_image_widget.dart';
import 'package:my_social_app/media/models/local_image.dart';
import 'package:my_social_app/media/models/media.dart';
import 'package:my_social_app/media/models/remote_image.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';

class MediaWidget extends StatelessWidget {
  final Media media;
  const MediaWidget({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    if(media is LocalImage){
      return LocalImageWidget(media: media as LocalImage);
    }
    if(media is RemoteImage){
      return RemoteImageWidget(
        media: media as RemoteImage,
        blobService: AppClient.blobService
      );
    }
    return const SpaceSavingWidget();
  }
}