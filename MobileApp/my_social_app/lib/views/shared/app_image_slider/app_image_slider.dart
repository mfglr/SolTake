import 'dart:io';
import 'package:app_file/app_file.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/circle_pagination_widget/circle_pagination_widget.dart';
import 'package:my_social_app/views/shared/app_image_slider/clear_upload_button.dart';

class AppImageSlider extends StatefulWidget {
  final Iterable<AppFile> images;
  final void Function(AppFile image) removeImage;
  final bool displayRemoveImageButton;

  const AppImageSlider({
    super.key,
    required this.images,
    required this.removeImage,
    this.displayRemoveImageButton = true
  });

  @override
  State<AppImageSlider> createState() => _AppImageSliderState();
}

class _AppImageSliderState extends State<AppImageSlider> {
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
                  File(image.file.path),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                if(widget.displayRemoveImageButton)
                  Positioned(
                    right: 15,
                    top: 15,
                    child: ClearUploadButton(
                      onPressed: () => widget.removeImage(image)
                    ) 
                  )
              ],
            ),
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