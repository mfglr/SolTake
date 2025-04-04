import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia_grid/circler_multimedia.dart';
import 'package:my_social_app/services/app_client.dart';

class UserImageWidget extends StatelessWidget {
  final Multimedia? image;
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
      child: CirclerMultimedia(
        blobServiceUrl: AppClient.blobService,
        diameter: diameter,
        noMediaPath: "assets/images/no_profile_image.png",
        notFoundMediaPath: "assets/images/no_profile_image.png",
        state: image,
      )
    );
  }
}



