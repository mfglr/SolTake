import 'package:flutter/material.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:my_social_app/views/shared/video_page_slider/widgets/video_play_button.dart';
import 'package:my_social_app/views/shared/video_page_slider/widgets/video_progress_bar.dart';
import 'package:video_player/video_player.dart';

class VideoPagePlayer extends StatefulWidget {
  final MultimediaState state;
  final Widget? child;
  final void Function()? onDoubleTap;
  const VideoPagePlayer({
    super.key,
    required this.state,
    this.child,
    this.onDoubleTap
  });

  @override
  State<VideoPagePlayer> createState() => _VideoPagePlayerState();
}

class _VideoPagePlayerState extends State<VideoPagePlayer> {
  late final VideoPlayerController _controller;
  late final Uri _url;
  final AppClient _appClient = AppClient();

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
    _url = _appClient.generateUri("blobs/${widget.state.containerName}/${widget.state.blobName}");
    _controller = VideoPlayerController.networkUrl(_url, httpHeaders: _appClient.getHeader());
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
      onDoubleTap: widget.onDoubleTap,
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.loose,
        children: [
          AspectRatio(
            aspectRatio: widget.state.width / widget.state.height,
            child: VideoPlayer(_controller)
          ),
          Positioned(
            bottom: 5,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                children: [
                  if(widget.child != null)
                    widget.child!,
                  Row(
                    children: [
                      Expanded(
                        child: VideoProgressBar(
                          controller: _controller,
                          duration: Duration(seconds: widget.state.duration.round())
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
                color: Colors.black.withOpacity(0.4),
                shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  _isVolumeOpen ? Icons.volume_up_sharp : Icons.volume_off_sharp,
                  size: 65,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}