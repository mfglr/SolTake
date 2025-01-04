import 'dart:io';
import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class UploadItemVideoPlayer extends StatefulWidget {
  final AppFile media;
  final bool displayPlayIcon;
  const UploadItemVideoPlayer({
    super.key,
    required this.media,
    this.displayPlayIcon = true
  });

  @override
  State<UploadItemVideoPlayer> createState() => _UploadItemVideoPlayerState();
}

class _UploadItemVideoPlayerState extends State<UploadItemVideoPlayer> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.file(File(widget.media.file.path));
    _controller.initialize().then((_) => setState((){}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        VideoPlayer(_controller),
        if(widget.displayPlayIcon)
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(153),
              shape: BoxShape.circle
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
            ),
          )
      ],
    );
  }
}