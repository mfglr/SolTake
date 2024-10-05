import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/views/shared/image_not_found_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class DisplayImageWidget extends StatefulWidget {
  final Uint8List? image;
  final ImageStatus status;
  final BoxFit? boxFit;
  final StackFit stackFit;
  final double aspectRatio;
  final void Function()? onTap;
  final Widget? centerWidget;
  const DisplayImageWidget({
    super.key,
    required this.image,
    required this.status,
    required this.aspectRatio,
    this.centerWidget,
    this.boxFit,
    this.stackFit = StackFit.loose,
    this.onTap,
  });

  @override
  State<DisplayImageWidget> createState() => _DisplayImageWidgetState();
}

class _DisplayImageWidgetState extends State<DisplayImageWidget> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / widget.aspectRatio,
      child: Builder(
        builder: (context){
          switch(widget.status){
            case ImageStatus.done:
              return GestureDetector(
                onTap: widget.onTap,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  fit: widget.stackFit,
                  children: [
                    Image.memory(
                      widget.image!,
                      fit: widget.boxFit,
                    ),
                    if(widget.centerWidget != null)
                      Positioned(
                        child: widget.centerWidget!
                      )
                  ],
                ),
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