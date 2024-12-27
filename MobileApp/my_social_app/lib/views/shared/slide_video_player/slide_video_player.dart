import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/views/shared/slide_video_player/video_play_button.dart';
import 'package:my_social_app/views/shared/slide_video_player/video_progress_bar.dart';
import 'package:video_player/video_player.dart';

class SlideVideoPlayer extends StatefulWidget {
  final Multimedia media;
  final Widget? child;
  final String baseBlobUrl;
  final Map<String,String>? headers;
  const SlideVideoPlayer({
    super.key,
    required this.media,
    required this.baseBlobUrl,
    this.headers,
    this.child,
  });

  @override
  State<SlideVideoPlayer> createState() => _SlideVideoPlayerState();
}

class _SlideVideoPlayerState extends State<SlideVideoPlayer> {
  late final VideoPlayerController _controller;
  late final Uri _url;

  bool _displayVolumeState = false;
  bool _isVolumeOpen = true;
  void volumeUp(){
    _controller
      .setVolume(1.0)
      .then((_){
        setState(() {
          _isVolumeOpen = true;
          if(!_displayVolumeState){
            _displayVolumeState = true;
            Future
              .delayed(const Duration(seconds: 3))
              .then((_){
                if(mounted) setState(() => _displayVolumeState = false);
              });
          }
        });
      });
  }
  void volumeOff(){
    _controller
      .setVolume(0.0)
      .then((_){
        setState(() {
          _isVolumeOpen = false;
          if(!_displayVolumeState){
            _displayVolumeState = true;
            Future
              .delayed(const Duration(seconds: 3))
              .then((_){
                if(mounted) setState(() => _displayVolumeState = false);
              });
          }
        });
      });
  }

  @override
  void initState() {
    _url = Uri.parse("${widget.baseBlobUrl}/${widget.media.containerName}/${widget.media.blobName}");
    _controller = VideoPlayerController.networkUrl(_url, httpHeaders: widget.headers ?? {});
    _controller.setLooping(true);
    _controller.initialize().then((_) => _controller.play().then((_) => setState(() {})));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isVolumeOpen ? volumeOff : volumeUp,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              AspectRatio(
                aspectRatio: widget.media.aspectRatio,
                child: VideoPlayer(_controller)
              ),
            ],
          ),
          Positioned(
            bottom: 15,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(widget.child != null)
                    widget.child!,
                  Row(
                    children: [
                      Expanded(
                        child: VideoProgressBar(
                          controller: _controller,
                          duration: Duration(seconds: widget.media.duration.round())
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        child: VideoPlayButton(controller: _controller)
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          if(_displayVolumeState)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(102),
                shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  _isVolumeOpen ? Icons.volume_up_sharp : Icons.volume_off_sharp,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}