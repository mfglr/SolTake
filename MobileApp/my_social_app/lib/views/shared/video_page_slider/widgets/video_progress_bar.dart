import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProgressBar extends StatefulWidget {
  final VideoPlayerController controller;
  final Duration duration;
  const VideoProgressBar({
    super.key,
    required this.controller,
    required this.duration
  });

  @override
  State<VideoProgressBar> createState() => _VideoProgressBarState();
}

class _VideoProgressBarState extends State<VideoProgressBar> {

  void seekTo(ThumbDragDetails details){
    widget.controller.seekTo(details.timeStamp).then((_) => setState(() {}));
  }

  void updateState() => setState(() {});

  @override
  void initState() {
    widget.controller.addListener(updateState);
    super.initState();
  }

 @override
 void dispose() {
   widget.controller.removeListener(updateState);
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      timeLabelLocation: TimeLabelLocation.none,
      progressBarColor: Colors.white,
      bufferedBarColor: Colors.black.withOpacity(0.5),
      baseBarColor: Colors.black.withOpacity(0.3),
      onDragUpdate: seekTo,
      onDragStart: seekTo,
      thumbRadius: 0,
      progress: widget.controller.value.position,
      buffered: widget.controller.value.buffered.lastOrNull?.end,
      total: widget.duration,
    );
  }
}