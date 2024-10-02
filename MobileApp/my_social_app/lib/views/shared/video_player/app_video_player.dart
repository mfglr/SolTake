import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  final File file;
  final int id;
  final double aspectRatio;
  final bool displayVolumeOffButton;

  const AppVideoPlayer({
    super.key,
    required this.file,
    required this.id,
    this.aspectRatio = 1,
    this.displayVolumeOffButton = true
  });

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.file(widget.file);
    _controller
      .initialize()
      .then((_){ setState(() {}); });
    
    super.initState();
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized 
      ? GestureDetector(
        onTap: (){
          if(_controller.value.isPlaying){
              _controller
                .pause()
                .then((_){ setState(() {}); });
            }
            else{
              _controller
                .play()
                .then((_) => setState(() => {}));
            }
        },
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller)
            ),
            if(widget.displayVolumeOffButton)
              Positioned(
                bottom: 5,
                right: 5,
                child: IconButton(
                  onPressed: (){
                    _controller
                      .setVolume(_controller.value.volume == 0 ? 1 : 0)
                      .then((_) => setState(() {}) );
                  },
                  icon: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        _controller.value.volume == 0 ? Icons.volume_off : Icons.volume_up,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ),
                )
              ),
            if(!_controller.value.isPlaying)
              Positioned(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(3),
                    child: Icon(
                      color: Colors.white,
                      size: 60,
                      Icons.play_circle_fill_outlined 
                    ),
                  ),
                )
              )
          ],
        ),
      ) 
      : AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: const LoadingWidget()
      );
  }
}