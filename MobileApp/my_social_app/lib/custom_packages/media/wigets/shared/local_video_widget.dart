import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/play_button.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/video_duration_bar.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/volume_button.dart';
import 'package:rxdart/subjects.dart';
import 'package:video_player/video_player.dart';

class LocalVideoWidget extends StatefulWidget {
  final LocalVideo media;
  final bool autoPlay;
  final BehaviorSubject<int>? positionSubject;
  const LocalVideoWidget({
    super.key,
    required this.media,
    required this.autoPlay,
    this.positionSubject
  });

  @override
  State<LocalVideoWidget> createState() => _LocalVideoWidgetState();
}

class _LocalVideoWidgetState extends State<LocalVideoWidget> {
  late final VideoPlayerController _controller;
  double _rate = 0;
  Iterable<(double,double)> _buffers = [];
  
  void _updateRate() =>
    setState(() => _rate = _controller.value.position.inMicroseconds / _controller.value.duration.inMicroseconds);   
  
  void _updateBuffer(){
    var duration = _controller.value.duration.inMicroseconds;
    setState(
      () => 
        _buffers = _controller.value.buffered.map((e) => (
          e.start.inMicroseconds / duration,
          (e.end.inMicroseconds - e.start.inMicroseconds) / duration
        ))
    );
  }

  void _onTapMove(DragUpdateDetails details, double witdth){
    final rate = details.localPosition.dy / witdth;
    _controller
      .seekTo(Duration(microseconds: (rate * _controller.value.duration.inMicroseconds).round()))
      .then((_) => setState(() {}));
  }

  void _onTapDown(TapDownDetails details, double witdth){
    final rate = details.localPosition.dx / witdth;
    _controller
      .seekTo(Duration(microseconds: (rate * _controller.value.duration.inMicroseconds).round()))
      .then((_) => setState(() {}));
  }

  void _onPositionChange(){
    if(widget.positionSubject != null){
      widget.positionSubject!.add(_controller.value.position.inMilliseconds);
    }
  }

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
    _controller.addListener(_updateBuffer);
    _controller.addListener(_updateRate);
    _controller.addListener(_onPositionChange);
    
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_updateBuffer);
    _controller.removeListener(_updateRate);
    _controller.removeListener(_onPositionChange);
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
        VideoDurationBar(
          rate: _rate,
          buffers: _buffers,
          onTapMove: _onTapMove,
          onTapDown: _onTapDown,
        )
      ],
    );
  }
}