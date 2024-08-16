import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/views/shared/image_not_found_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class DisplayImageWidget extends StatelessWidget {
  final Uint8List? image;
  final ImageStatus status;
  final BoxFit? boxFit;
  const DisplayImageWidget({
    super.key,
    required this.image,
    required this.status,
    this.boxFit
  });

  @override
  Widget build(BuildContext context) {
    return  Builder(              
      builder: (context){
        switch(status){
          case ImageStatus.done:
            return Image.memory(
              image!,
              fit: boxFit,
            );
          case ImageStatus.started:
            return const LoadingWidget();
          case ImageStatus.notStarted:
            return const LoadingWidget();
          case ImageStatus.notFound:
            return const ImageNotFoundWidget();
        }
      }
    );
  }
}