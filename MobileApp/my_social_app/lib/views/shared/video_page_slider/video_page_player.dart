import 'package:flutter/material.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:my_social_app/views/shared/video_page_slider/video_play_button.dart';
import 'package:my_social_app/views/shared/video_page_slider/video_progress_bar.dart';
import 'package:my_social_app/views/shared/video_page_slider/video_volume_button.dart';
import 'package:video_player/video_player.dart';

class VideoPagePlayer extends StatefulWidget {
  final MultimediaState state;
  const VideoPagePlayer({
    super.key,
    required this.state,
  });

  @override
  State<VideoPagePlayer> createState() => _VideoPagePlayerState();
}

class _VideoPagePlayerState extends State<VideoPagePlayer> {
  late final VideoPlayerController _controller;
  late final Uri _url;
  final AppClient _appClient = AppClient();
  
  @override
  void initState() {
    _url = _appClient.generateUri("blobs/${widget.state.containerName}/${widget.state.blobName}");
    _controller = VideoPlayerController.networkUrl(_url, httpHeaders: _appClient.getHeader());
    _controller.setLooping(true);
    _controller
      .initialize()
      .then((_) => _controller.play().then((_) => setState(() {})));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.loose,
      children: [
        AspectRatio(
          aspectRatio: widget.state.width / widget.state.height,
          child: VideoPlayer(_controller)
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: VideoProgressBar(
                    controller: _controller,
                    duration: Duration(seconds: widget.state.duration.round())
                  ),
                ),
                VideoPlayButton(controller: _controller),
                VideoVolumeButton(controller: _controller,)
              ],
            ),
          ),
        )
      ],
    );
  }
}