import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/circle_pagination_widget/circle_pagination_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class AppImageSliderFromMemory extends StatefulWidget {
  final Iterable<Uint8List?> images;
  final int activeIndex;
  const AppImageSliderFromMemory({
    super.key,
    required this.images,
    required this.activeIndex,
  });

  @override
  State<AppImageSliderFromMemory> createState() => _AppImageSliderFromMemoryState();
}

class _AppImageSliderFromMemoryState extends State<AppImageSliderFromMemory> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _index = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _controller.jumpToPage(widget.activeIndex);
    });
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
                if(image != null)
                  Image.memory(
                    image,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )
                else
                  const LoadingWidget(),
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