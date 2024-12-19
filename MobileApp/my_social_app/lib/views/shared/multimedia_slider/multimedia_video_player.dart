import 'package:flutter/material.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:video_player/video_player.dart';

class MultimediaVideoPlayer extends StatefulWidget {
  final MultimediaState state;
  final bool autoPlay;
  const MultimediaVideoPlayer({
    super.key,
    required this.state,
    this.autoPlay = false
  });

  @override
  State<MultimediaVideoPlayer> createState() => _MultimediaVideoPlayerState();
}

class _MultimediaVideoPlayerState extends State<MultimediaVideoPlayer> {
  late final VideoPlayerController _controller;
  late final Uri _url;
  late int _remaningDuration;
  final AppClient _appClient = AppClient();

  void _setRemainingDuration(){
    setState(() {
      _remaningDuration = (widget.state.duration - _controller.value.position.inSeconds).round();
    });
  }

  @override
  void initState() {
    _remaningDuration = widget.state.duration.round();
    _url = _appClient.generateUri("blobs/${widget.state.containerName}/${widget.state.blobName}");
    _controller = VideoPlayerController.networkUrl(_url, httpHeaders: _appClient.getHeader());
    _controller.setLooping(true);
    _controller.addListener(_setRemainingDuration);
    _controller
      .initialize()
      .then((_){
        if(widget.autoPlay){
          _controller.play().then((_) => setState(() {}));
        }
      });
    super.initState();
  }

  
  void play(){
    if(_controller.value.isInitialized){
      _controller.play().then((_) => setState(() {}));
    }
  }

  void pause(){
    if(_controller.value.isInitialized){
      _controller.pause().then((_) => setState(() {}));
    }
  }

  void volumeUp(){
    if(_controller.value.isInitialized){
      _controller.setVolume(1.0).then((_) => setState((){}));
    }
  }

  void volumeOff(){
    if(_controller.value.isInitialized){
      _controller.setVolume(0.0).then((_) => setState((){}));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(_setRemainingDuration);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.value.isPlaying ? pause() : play(),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          VideoPlayer(_controller),
          if(!_controller.value.isPlaying)
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.4),
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 75,
                color: Colors.white,
              ),
            ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.4),
              ),
              child: IconButton(
                onPressed: () => _controller.value.volume == 0.0 ? volumeUp() : volumeOff(),
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(const EdgeInsets.all(6)),
                  minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: Icon(
                  _controller.value.volume == 1 ? Icons.volume_up_sharp : Icons.volume_off_sharp,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            )
          ),
          Positioned(
            top: 15,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  _remaningDuration.toString(),
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          )
        ],
      )
    );
  }
}