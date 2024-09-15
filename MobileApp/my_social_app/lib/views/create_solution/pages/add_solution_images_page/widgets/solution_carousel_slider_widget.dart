import 'dart:io';
import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/circle_pagination_widget/circle_pagination_widget.dart';

class SolutionCarouselSliderWidget extends StatefulWidget {
  final Iterable<XFile> images;
  final void Function(XFile) removeImage;

  const SolutionCarouselSliderWidget({
    super.key,
    required this.images,
    required this.removeImage
  });

  @override
  State<SolutionCarouselSliderWidget> createState() => _SolutionCarouselSliderWidgetState();
}

class _SolutionCarouselSliderWidgetState extends State<SolutionCarouselSliderWidget> {
  final CarouselController _controller = CarouselController();
  int _activeIndex = 0;

  void _changeActiveIndex(index){
     _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear
    );
    setState(() { _activeIndex = index; });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: widget.images.map((image) => Stack(
            alignment: AlignmentDirectional.center,
            children:[
              Image.file(
                File(image.path),
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () => widget.removeImage(image),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 32
                  ),
                ),
              )
            ]
          )).toList(),
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1,
            height: MediaQuery.sizeOf(context).height,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) => setState(() { _activeIndex = index; }),
          ),
        ),
        if(widget.images.length > 1)
        Positioned(
          bottom: MediaQuery.sizeOf(context).height / 64,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CirclePaginationWidget(
                  changeActiveIndex: _changeActiveIndex,
                  numberOfCircles: widget.images.length,
                  activeIndex: _activeIndex,
                ),
              ],
            ),
          )
        )
      ],
    );
  }
}