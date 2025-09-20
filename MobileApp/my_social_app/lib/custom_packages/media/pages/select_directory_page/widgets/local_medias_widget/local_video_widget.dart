import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:my_social_app/custom_packages/media/pages/select_directory_page/widgets/local_medias_widget/local_video_loading_widget.dart';
import 'package:my_social_app/custom_packages/media/pages/select_directory_page/widgets/local_medias_widget/play_icon.dart';
import 'package:my_social_app/custom_packages/media/services/frame_catcher.dart';

class LocalVideoWidget extends StatefulWidget {
  final LocalVideo media;
  final Widget loading;
  const LocalVideoWidget({
    super.key,
    required this.media,
    this.loading = const LocalVideoLoadingWidget()
  });

  @override
  State<LocalVideoWidget> createState() => _LocalVideoWidgetState();
}

class _LocalVideoWidgetState extends State<LocalVideoWidget> {
  late final Future<Uint8List> _bytes;

  @override
  void initState() {
    _bytes = FrameCatcher.catchFrame(widget.media);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => FutureBuilder(
        future: _bytes,
        builder: (context, snapShot) => switch(snapShot.connectionState) {
          ConnectionState.none => widget.loading,
          ConnectionState.waiting => widget.loading,
          ConnectionState.active => widget.loading,
          ConnectionState.done => Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.memory(
                snapShot.data!,
                fit: BoxFit.cover,
                height: constraints.constrainHeight(),
                width: constraints.constrainWidth(),
              ),
              const PlayIcon()
            ],  
          ),
        }
      ),
    );
  }
}

