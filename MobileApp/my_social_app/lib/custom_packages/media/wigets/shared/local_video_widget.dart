import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/play_button.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/video_duration_bar.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/volume_button.dart';
import 'package:video_player/video_player.dart';

class LocalVideoWidget extends StatefulWidget {
  final LocalVideo media;
  final bool autoPlay;

  const LocalVideoWidget({
    super.key,
    required this.media,
    this.autoPlay = false,
  });

  @override
  State<LocalVideoWidget> createState() => _LocalVideoWidgetState();
}

class _LocalVideoWidgetState extends State<LocalVideoWidget> {
  late final VideoPlayerController _controller;
  double _rate = 0;
  
  void _updateRate() =>
    setState(() => _rate = _controller.value.position.inMicroseconds / _controller.value.duration.inMicroseconds);   
  

  @override
  void initState() {
    _controller =
      VideoPlayerController
        .file(widget.media.file)
        ..setLooping(true)
        ..initialize()
        .then(
          (_) => widget.autoPlay
            ? _controller
                .play()
                .then((_) => setState((){}))
            : setState((){})
        );
    _controller.addListener(_updateRate);
    
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_updateRate);
    _controller.dispose();
    super.dispose();
  }
    

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            GestureDetector(
              onTap: (){
                if(_controller.value.isPlaying){
                  _controller
                    .pause()
                    .then((_) => setState(() {}));
                }
                else{
                  _controller
                    .play()
                    .then((_) => setState(() {}));
                }
              },
              child: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  height: constraints.constrainHeight(),
                  width: constraints.constrainWidth(),
                  child: VideoPlayer(
                    _controller,
                    
                  ),
                ),
              ),
            ),
            if(!_controller.value.isPlaying)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: VolumeButton(
                      onTap: () =>
                        (_controller.value.volume == 0
                          ? _controller.setVolume(1)
                          : _controller.setVolume(0)
                        )
                        .then((_) => _controller.play().then((_) => setState(() {}))),
                      isVolumeOff: () => _controller.value.volume == 0
                    ),
                  ),
                  PlayButton(
                    onTap: () => _controller.play().then((_) => setState(() {})),
                  ),
                ],
              )
          ],
        ),
        VideoDurationBar(rate: _rate)
      ],
    );
  }
}