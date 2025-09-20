import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:my_social_app/custom_packages/media/services/frame_catcher.dart';
import 'package:my_social_app/custom_packages/media/wigets/failed_widget.dart';
import 'package:my_social_app/custom_packages/media/wigets/play_button.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class LocalVideoGrid extends StatefulWidget {
  final LocalVideo media;
  const LocalVideoGrid({
    super.key,
    required this.media,
  });

  @override
  State<LocalVideoGrid> createState() => _LocalVideoGridState();
}

class _LocalVideoGridState extends State<LocalVideoGrid> {
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
                fit: BoxFit.cover,
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