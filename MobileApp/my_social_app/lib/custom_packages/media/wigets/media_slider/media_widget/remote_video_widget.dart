import 'package:flutter/cupertino.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
import 'package:my_social_app/custom_packages/media/wigets/play_button.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_widget/video_duration_bar.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/media_widget/volume_button.dart';
import 'package:video_player/video_player.dart';

class RemoteVideoWidget extends StatefulWidget {
  final bool autoPlay;
  final RemoteVideo media;
  final String blobService;
  const RemoteVideoWidget({
    super.key,
    required this.media,
    required this.blobService,
    this.autoPlay = false
  });

  @override
  State<RemoteVideoWidget> createState() => _RemoteVideoWidgetState();
}

class _RemoteVideoWidgetState extends State<RemoteVideoWidget> {
  late final VideoPlayerController _controller;
  double _rate = 0;
  
  void _updateRate() =>
    setState(() => _rate = _controller.value.position.inMicroseconds / _controller.value.duration.inMicroseconds);

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
              child: AspectRatio(
                aspectRatio: widget.media.dimention.aspectRatio,
                child: VideoPlayer(
                  _controller
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