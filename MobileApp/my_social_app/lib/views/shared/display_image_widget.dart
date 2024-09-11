import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/views/shared/image_not_found_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class DisplayImageWidget extends StatefulWidget {
  final Uint8List? image;
  final ImageStatus status;
  final BoxFit? boxFit;
  final void Function()? onTap;
  const DisplayImageWidget({
    super.key,
    required this.image,
    required this.status,
    this.boxFit,
    this.onTap,
  });

  @override
  State<DisplayImageWidget> createState() => _DisplayImageWidgetState();
}

class _DisplayImageWidgetState extends State<DisplayImageWidget> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: widget.onTap,
      child: Builder(
        builder: (context){
          switch(widget.status){
            case ImageStatus.done:
              return Image.memory(
                widget.image!,
                fit: widget.boxFit,
              );
            case ImageStatus.started:
              return const LoadingWidget();
            case ImageStatus.notStarted:
              return const LoadingWidget();
            case ImageStatus.notFound:
              return const ImageNotFoundWidget();
          }
        }
      ),
    );
  }
}