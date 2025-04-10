import 'package:duration_to_minutes/duration_to_minutes.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:video_player/video_player.dart';

class MultimediaVideoPlayer extends StatefulWidget {
  final Multimedia media;
  final String blobServiceUrl;
  final Map<String,String>? headers;
  final bool displayRemaningDuration;
  final bool displayVolume;
  final bool displayPlayButton;
  final bool play;

  const MultimediaVideoPlayer({
    super.key,
    required this.media,
    required this.blobServiceUrl,
    this.headers,
    this.displayRemaningDuration = true,
    this.displayVolume = true,
    this.displayPlayButton = true,
    this.play = false
  });

  @override
  State<MultimediaVideoPlayer> createState() => _MultimediaVideoPlayerState();
}

class _MultimediaVideoPlayerState extends State<MultimediaVideoPlayer> {
  late final VideoPlayerController _controller;
  late final Uri _url;
  late int _remaningDuration;

  void _setRemainingDuration(){
    setState(() {
      _remaningDuration = (widget.media.duration - _controller.value.position.inSeconds).round();
    });
  }

  @override
  void initState() {
    _remaningDuration = widget.media.duration.round();
    _url = Uri.parse("${widget.blobServiceUrl}/${widget.media.containerName}/${widget.media.blobName}");
     
    _controller = VideoPlayerController.networkUrl(_url, httpHeaders: widget.headers ?? const <String,String>{});
    _controller.addListener(_setRemainingDuration);
    _controller.setLooping(false);
    if(!widget.play){
      _controller.initialize().then((_) => setState((){}));
    }
    else{
      _controller
        .initialize()
        .then((_) => _controller.play())
        .then((_) => setState((){}));
    }
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
          AspectRatio(
            aspectRatio: widget.media.aspectRatio,
            child: VideoPlayer(_controller)
          ),
          if(!_controller.value.isPlaying && widget.displayPlayButton)
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withAlpha(153),
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 75,
                color: Colors.white,
              ),
            ),
          if(widget.displayVolume)
            Positioned(
              bottom: 15,
              right: 15,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withAlpha(153),
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
          if(widget.displayRemaningDuration)
            Positioned(
              top: 15,
              left: 5,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(153),
                  borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: DurationToMinutes(
                  duration: _remaningDuration,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              )
            )
        ],
      )
    );
  }
}