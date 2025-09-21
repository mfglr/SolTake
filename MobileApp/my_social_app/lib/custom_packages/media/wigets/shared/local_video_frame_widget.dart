import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:my_social_app/custom_packages/media/services/frame_catcher.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/failed_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/loading_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/play_button.dart';

class LocalVideoFrameWidget extends StatefulWidget {
  final LocalVideo media;
  final BoxFit fit;
  const LocalVideoFrameWidget({
    super.key,
    required this.media,
    this.fit = BoxFit.cover
  });

  @override
  State<LocalVideoFrameWidget> createState() => _LocalVideoFrameWidgetState();
}

class _LocalVideoFrameWidgetState extends State<LocalVideoFrameWidget> {
  late final Future<Uint8List> _bytes;

  @override
  void initState() {
    _bytes = FrameCatcher.catchFrame(widget.media);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _bytes,
      builder: (context, snapShot) => switch(snapShot.connectionState) {
        ConnectionState.none => const FailedWidget(),
        ConnectionState.waiting => const LoadingWidget(),
        ConnectionState.active =>const LoadingWidget(),
        ConnectionState.done => LayoutBuilder(
          builder: (context, constraints) => Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.memory(
                snapShot.data!,
                fit: widget.fit,
                height: constraints.constrainHeight(),
                width: constraints.constrainWidth(),
              ),
              const PlayButton()
            ],
          ),
        ),
      }
    );
  }
}