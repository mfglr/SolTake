import 'package:app_file/app_file.dart';
import 'package:app_file_slider/widgets/image_slide.dart';
import 'package:app_file_slider/widgets/remove_media_button.dart';
import 'package:app_file_slider/widgets/video_slide.dart';
import 'package:circles_pagination/circles_pagination.dart';
import 'package:flutter/material.dart';

class AppFileSlider extends StatefulWidget {
  final Iterable<AppFile> medias;
  final void Function(AppFile) onRemoved;

  const AppFileSlider({
    super.key,
    required this.medias,
    required this.onRemoved
  });

  @override
  State<AppFileSlider> createState() => _AppFileSliderState();
}

class _AppFileSliderState extends State<AppFileSlider> {
  final PageController _controller = PageController();
  int _activeIndex = 0;
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PageView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) => setState(() { _activeIndex = index; }),
          children: widget.medias
            .map((e) => Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                e.type == AppFileTypes.image ? ImageSlide(file: e) : VideoSlide(file: e),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RemoveMediaButton(onPressed: () => widget.onRemoved(e)),
                ),
              ],
            )).toList(),
        ),
        if(widget.medias.length > 1)
          Positioned(
            bottom: MediaQuery.of(context).size.height / 16,
            child: CirclesPagination(
              numberOfCircles: widget.medias.length,
              changeActiveIndex: (index) => _controller.animateToPage(
                index,
                duration: Duration(milliseconds: 200),
                curve: Curves.linear
              ),
              activeIndex: _activeIndex
            ),
          )
      ],
    );
  }
}