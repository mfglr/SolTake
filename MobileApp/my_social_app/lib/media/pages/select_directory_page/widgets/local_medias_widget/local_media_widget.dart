import 'package:flutter/material.dart';
import 'package:my_social_app/media/models/local_image.dart';
import 'package:my_social_app/media/models/local_media.dart';
import 'package:my_social_app/media/models/local_video.dart';
import 'package:my_social_app/media/pages/select_directory_page/widgets/local_medias_widget/local_image_widget.dart';
import 'package:my_social_app/media/pages/select_directory_page/widgets/local_medias_widget/local_video_widget.dart';

class LocalMediaWidget extends StatelessWidget {
  final void Function(LocalMedia) remove;
  final void Function() onpressed;
  final LocalMedia localMedia;
  
  const LocalMediaWidget({
    super.key,
    required this.localMedia,
    required this.remove,
    required this.onpressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Builder(
            builder: (context){
              if(localMedia is LocalImage){
                return LocalImageWidget(localImage: localMedia as LocalImage);
              }
              else{
                return LocalVideoWidget(localVideo: localMedia as LocalVideo);
              }
            }
          ),
          GestureDetector(
            onTap: () => remove(localMedia),
            child: Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(128),
                shape: BoxShape.circle
              ),
              child: const Icon(
                Icons.close,
                size: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}