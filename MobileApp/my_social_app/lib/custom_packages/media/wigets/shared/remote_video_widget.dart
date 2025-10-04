import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/play_button.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/video_duration_bar.dart';
import 'package:my_social_app/custom_packages/media/wigets/shared/volume_button.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

class RemoteVideoWidget extends StatefulWidget {
  final String blobService;
  final RemoteVideo media;
  final bool autoPlay;
  final BehaviorSubject<int>? positionSubject;

  const RemoteVideoWidget({
    super.key,
    required this.media,
    required this.blobService,
    required this.autoPlay,
    this.positionSubject
  });

  @override
  State<RemoteVideoWidget> createState() => _RemoteVideoWidgetState();
}

class _RemoteVideoWidgetState extends State<RemoteVideoWidget> {
  late final VideoPlayerController _controller;
  double _rate = 0;
  Iterable<(double offsetRate, double sizeRate)> _buffers = [];

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
    final rate = details.localPosition.dx / witdth;
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
    final url = "${widget.blobService}/${widget.media.containerName}/${widget.media.blobName}";
    _controller = VideoPlayerController
        .networkUrl(Uri.parse(url))
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
                builder: (context, constranits) => SizedBox(
                  height: constranits.constrainHeight(),
                  width: constranits.constrainWidth(),
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