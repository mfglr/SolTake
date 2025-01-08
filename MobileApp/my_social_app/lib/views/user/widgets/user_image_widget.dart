import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:multimedia_grid/circler_multimedia.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_user_image_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';

class UserImageWidget extends StatelessWidget {
  final int userId;
  final double diameter;
  final void Function()? onPressed;
  
  const UserImageWidget({
    super.key,
    required this.userId,
    required this.diameter,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UploadUserImageState?>(
      converter: (store) => store.state.uploadEntityState.entities.whereType<UploadUserImageState>().firstOrNull,
      builder:(context,state) => state == null
        ? CirclerMultimedia(
            blobServiceUrl: AppClient.blobService,
            diameter: diameter,
            noMediaPath: "assets/images/no_profile_image.png",
            notFoundMediaPath: "assets/images/no_profile_image.png",
            state: UserState.multimedia(userId),
            headers: AppClient().getHeader(),
            onTap: onPressed,
          )
        : Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipOval(
              child: Image.file(
                File(state.medias.first.file.path),
                height: diameter,
                width: diameter,
                fit: BoxFit.cover,
              ),
            ),
            CircularProgressIndicator(
              value: state.rate,
              color: Colors.green,
              backgroundColor: Colors.white.withAlpha(153),
            )
          ],
        )
    );
  }
}

