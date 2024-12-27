import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayButton extends StatefulWidget {
  final VideoPlayerController controller;
  const VideoPlayButton({
    super.key,
    required this.controller
  });

  @override
  State<VideoPlayButton> createState() => _VideoPlayButtonState();
}

class _VideoPlayButtonState extends State<VideoPlayButton> {
  void play(){
    if(widget.controller.value.isInitialized){
      widget.controller.play().then((_) => setState(() {}));
    }
  }

  void pause(){
    if(widget.controller.value.isInitialized){
      widget.controller.pause().then((_) => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.controller.value.isPlaying ? pause : play,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Icon(
        widget.controller.value.isPlaying ? Icons.pause_circle_outline_sharp : Icons.play_circle_outline_sharp,
        color: Colors.white,
        size: 30,
      )
    );
  }
}