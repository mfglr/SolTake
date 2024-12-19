import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:my_social_app/views/shared/video_page_slider/video_page_player.dart';

class VideoPageSlider extends StatefulWidget {
  final Iterable<MultimediaState> videos;
  const VideoPageSlider({
    super.key,
    required this.videos
  });

  @override
  State<VideoPageSlider> createState() => _VideoPageSliderState();
}

class _VideoPageSliderState extends State<VideoPageSlider> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemCount: widget.videos.length,
      itemBuilder: (context, index) => VideoPagePlayer(state: widget.videos.elementAt(index)),
    );
  }
}