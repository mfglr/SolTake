import 'dart:io';
import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/circle_pagination_widget/circle_pagination_widget.dart';

class CarouselSliderWidget extends StatefulWidget {
  final Iterable<XFile> images;
  final void Function(XFile image) removeImage;
  

  const CarouselSliderWidget({
    super.key,
    required this.images,
    required this.removeImage
  });

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: widget.images.map((image) => Center(
            child: Stack(
              children: [
                Image.file(
                  File(image.path),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                // Positioned(
                //   right: 0,
                //   top: 0,
                //   child: ClearUploadButton(
                //     onPressed: () => widget.removeImage(image)
                //   ) 
                // )
              ],
            )
          )).toList(),
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1,
            height: MediaQuery.sizeOf(context).height,
            enableInfiniteScroll: false,
            onPageChanged: (index,reason) => setState(() { _index = index; }),
          ),
        ),
        if(widget.images.length > 1)
          Positioned(
            bottom: 15,
            child: CirclePaginationWidget(
              numberOfCircles: widget.images.length,
              activeIndex: _index,
              changeActiveIndex: (index){
                _controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear
                );
                setState(() { _index = index; });
              }
            )
          ),
      ],
    );
  }
}