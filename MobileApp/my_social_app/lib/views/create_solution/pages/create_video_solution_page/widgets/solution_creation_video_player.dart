import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/clear_upload_button/clear_upload_button.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:video_player/video_player.dart';

class SolutionCreationVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;
  final bool displayVolumeOffButton;
  final bool displayDuration;
  final void Function() play;
  final void Function() pause;
  final void Function()? onDeleted;

  const SolutionCreationVideoPlayer({
    super.key,
    required this.controller,
    required this.play,
    required this.pause,
    this.displayVolumeOffButton = true,
    this.displayDuration = true,
    this.onDeleted
  });

  @override
  State<SolutionCreationVideoPlayer> createState() => _SolutionCreationVideoPlayerState();
}

class _SolutionCreationVideoPlayerState extends State<SolutionCreationVideoPlayer> {

  void onCompleted(){
    if(widget.controller.value.isCompleted){
      setState(() {});
    }
  }

  void onDurationChanged(){
    Future
      .delayed(const Duration(milliseconds: 1000))
      .then((_){ if(mounted) setState(() {}); });
  }

  @override
  void initState() {
    widget.controller.addListener(onCompleted);
    widget.controller.addListener(onDurationChanged);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(onCompleted);
    widget.controller.removeListener(onDurationChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller.value.isInitialized
      ? GestureDetector(
        onTap: () => widget.controller.value.isPlaying ? widget.pause() : widget.play(),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: VideoPlayer(widget.controller)
            ),
            if(widget.displayVolumeOffButton)
              Positioned(
                bottom: 5,
                right: 5,
                child: IconButton(
                  onPressed: (){
                    widget.controller
                      .setVolume(widget.controller.value.volume == 0 ? 1 : 0)
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
                        widget.controller.value.volume == 0 ? Icons.volume_off : Icons.volume_up,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ),
                )
              ),
            if(widget.displayDuration)
              Positioned(
                top: 5,
                left: 5,
                child: IconButton(
                  onPressed: null,
                  icon: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        (widget.controller.value.duration.inSeconds - widget.controller.value.position.inSeconds).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ),
                ),
              ),
            if(!widget.controller.value.isPlaying)
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
              ),
            if(widget.onDeleted != null)
              Positioned(
                top: 5,
                right: 5,
                child: ClearUploadButton(onPressed: widget.onDeleted!)
              )
          ],
        ),
      ) 
      : const Center(
        child: LoadingWidget()
      );
  }
}