import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_frame_widget/media_frame_widget.dart';
import 'package:my_social_app/custom_packages/status_widgets/not_found_widget.dart';
import 'package:my_social_app/services/app_client.dart';

class UserImageWidget extends StatelessWidget {
  final Media? image;
  final double diameter;
  final void Function()? onPressed;
  
  const UserImageWidget({
    super.key,
    required this.image,
    required this.diameter,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipOval(
        child: SizedBox(
          height: diameter,
          width: diameter,
          child: image != null
            ? MediaFrameWidget(
                blobService: AppClient.blobService,
                media: image!,
              )
            : const NotFoundWidget()
        ),
      )
    );
  }
}



