import 'dart:io';
import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/circle_pagination_widget/circle_pagination_widget.dart';

class CarouselSliderWidget extends StatefulWidget {
  final Iterable<XFile> images;
  final void Function(XFile) removeImage;
  
  const CarouselSliderWidget({
    super.key,
    required this.images,
    required this.removeImage
  });

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _index = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();
  
  void _changeIndex(index){
    _carouselController
      .animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear
      );
    setState(() { _index = index; });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: widget.images.map((image) => Center(
            child: Stack(
              children: [
                Image.file(
                  File(image.path),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: FilledButton(
                    onPressed: () => widget.removeImage(image),
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
                      minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20
                    ),
                  ),
                ),
              ]
            )
          )).toList(),
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1,
            height: MediaQuery.sizeOf(context).height,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) => setState(() { _index = index; }),
          ),
        ),
        if(widget.images.length > 1)
          Positioned(
            bottom: 15,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CirclePaginationWidget(
                    numberOfCircles: widget.images.length,
                    changeActiveIndex: _changeIndex,
                    activeIndex: _index,
                  ),
                ],
              ),
            ),
          ),
      ]
    );
  }
}


