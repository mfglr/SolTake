import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_slider/circles_pagination/circles_pagination.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_widget/media_widget.dart';
import 'package:my_social_app/services/app_client.dart';

class MediaSlider extends StatefulWidget {
  final Iterable<Media> medias;
  final int activeIndex;
  const MediaSlider({
    super.key,
    required this.medias,
    this.activeIndex = 0
  });

  @override
  State<MediaSlider> createState() => _MediaSliderState();
}

class _MediaSliderState extends State<MediaSlider> {
  final PageController _controller = PageController();
  late int _index;
  late final double _minAspectRatio;

  @override
  void initState() {
    _minAspectRatio = widget.medias.map((e) => e.dimention.aspectRatio).min;

    _index = widget.activeIndex >= widget.medias.length || widget.activeIndex < 0 ? 0 : widget.activeIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpToPage(_index);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: constraints.constrainWidth() / _minAspectRatio,
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.medias.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Center(
                child: MediaWidget(
                  media: widget.medias.elementAt(index),
                  blobService: AppClient.blobService,
                ),
              ),
              onPageChanged: (index) => setState(() => _index = index),
            ),
          ),
          if(widget.medias.length > 1)
            Container(
              margin: const EdgeInsets.all(5),
              child: CirclesPagination(
                numberOfCircles: widget.medias.length,
                changeActiveIndex: (index){
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear
                  );
                  setState(() { _index = index; });
                },
                activeIndex: _index
              ),
            )
        ],
      ),
    );
  }
}