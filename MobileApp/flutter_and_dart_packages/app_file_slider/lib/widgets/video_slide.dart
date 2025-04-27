import 'dart:io';
import 'package:app_file/app_file.dart';
import 'package:app_file_slider/widgets/play_icon.dart';
import 'package:duration_to_minutes/duration_to_minutes.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSlide extends StatefulWidget {
  final AppFile file;
  const VideoSlide({
    super.key,
    required this.file
  });

  @override
  State<VideoSlide> createState() => _VideoSlideState();
}

class _VideoSlideState extends State<VideoSlide> {
  late VideoPlayerController _controller;
  int _duration = 0;

  void _play() => _controller.play().then((_) => setState(() {}));
  void _pause() => _controller.pause().then((_) => setState(() {}));

  void _setDuration() => setState(() { 
    _duration = _controller.value.duration.inSeconds - _controller.value.position.inSeconds; 
  }); 

  @override
  void initState() {
    _controller = VideoPlayerController.file(File(widget.file.file.path));
    _controller.initialize().then((_) => setState(() {}));
    _controller.addListener(_setDuration);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_setDuration);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
      ? Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: _controller.value.isPlaying ? _pause : _play,
                child: VideoPlayer(_controller)
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(153),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  child: DurationToMinutes(
                    duration: _duration,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
          if(!_controller.value.isPlaying)
            GestureDetector(
              onTap: _controller.value.isPlaying ? _pause : _play,
              child: PlayIcon()
            ),
        ],
      )
      : Center(child: CircularProgressIndicator());
  }
}