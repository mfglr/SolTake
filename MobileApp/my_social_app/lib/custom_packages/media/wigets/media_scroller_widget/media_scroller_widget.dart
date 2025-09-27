import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_widget/media_widget.dart';

class MediaScrollerWidget extends StatefulWidget {
  final Iterable<Media> medias;
  final Widget Function(int index)? childGenerator;
  final String blobService;

  const MediaScrollerWidget({
    super.key,
    required this.medias,
    required this.blobService,
    this.childGenerator
  });

  @override
  State<MediaScrollerWidget> createState() => _MediaScrollerWidgetState();
}

class _MediaScrollerWidgetState extends State<MediaScrollerWidget> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemBuilder: (context, index) => Center(
        child: MediaWidget(
          media: widget.medias.elementAt(index),
          blobService: widget.blobService,
          autoPlay: true,
          child: 
            widget.childGenerator != null
              ? widget.childGenerator!(index)
              : null,
        ),
      ),
      scrollDirection: Axis.vertical,
    );
  }
}