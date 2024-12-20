import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:my_social_app/views/shared/video_page_slider/widgets/video_page_player.dart';

class VideoPageSlider extends StatefulWidget {
  final Iterable<MultimediaState> videos;
  final Widget? child;
  final void Function() onNext;
  const VideoPageSlider({
    super.key,
    required this.videos,
    required this.onNext,
    this.child
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
      onPageChanged: (index){
        if(widget.videos.isNotEmpty && index == (widget.videos.length - 1)){
          widget.onNext();
        }
      },
      scrollDirection: Axis.vertical,
      itemCount: widget.videos.length,
      itemBuilder: (context, index) => VideoPagePlayer(
        state: widget.videos.elementAt(index),
        child: widget.child,
      ),
    );
  }
}