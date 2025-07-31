import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class ProfileImageWidget extends StatelessWidget {
  final UserState user;
  final double diameter;
  final void Function()? onPressed;
  const ProfileImageWidget({
    super.key,
    required this.user,
    required this.diameter,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Builder(
        builder: (context){
          if(user.userImageState == null) return UserImageWidget(image: user.image,diameter: diameter);
          if(user.userImageState!.status == UploadStatus.success) return UserImageWidget(image: user.image,diameter: diameter);
          if(user.userImageState!.status == UploadStatus.failed) return UserImageWidget(image: user.image,diameter: diameter);
          
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ClipOval(
                child: Image.file(
                  File(user.userImageState!.image.file.path),
                  height: diameter,
                  width: diameter,
                  fit: BoxFit.cover,
                ),
              ),
              if(user.userImageState!.rate == 1 && user.userImageState!.status == UploadStatus.loading)
                LoadingAnimationWidget.threeRotatingDots(
                  color: Colors.green,
                  size: diameter / 2
                )
              else
                SizedBox(
                  height: diameter,
                  width: diameter,
                  child: CircularProgressIndicator(
                    value: user.userImageState!.rate,
                    color: Colors.green,
                    backgroundColor: Colors.white.withAlpha(153),
                  ),
                )
            ],
          );
        }
      ),
    );
  }
}