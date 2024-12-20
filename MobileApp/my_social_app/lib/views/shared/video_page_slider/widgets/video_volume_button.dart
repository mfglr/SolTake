import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoVolumeButton extends StatefulWidget {
  final VideoPlayerController controller;
  const VideoVolumeButton({
    super.key,
    required this.controller
  });

  @override
  State<VideoVolumeButton> createState() => _VideoVolumeButtonState();
}

class _VideoVolumeButtonState extends State<VideoVolumeButton> {
  
  void volumeUp(){
    if(widget.controller.value.isInitialized){
      widget.controller.setVolume(1.0).then((_) => setState((){}));
    }
  }

  void volumeOff(){
    if(widget.controller.value.isInitialized){
      widget.controller.setVolume(0.0).then((_) => setState((){}));
    }
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.controller.value.volume == 0.0 ? volumeUp : volumeOff,
      icon: Icon(
        widget.controller.value.volume == 0.0 ? Icons.volume_off_sharp : Icons.volume_up_sharp,
        color: Colors.deepPurple[300],
      )
    );
  }
}