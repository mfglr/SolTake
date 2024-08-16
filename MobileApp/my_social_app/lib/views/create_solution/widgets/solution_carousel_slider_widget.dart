import 'dart:io';
import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/create_solution_state/actions.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';

class SolutionCarouselSliderWidget extends StatefulWidget {
  final Iterable<XFile> images;
  const SolutionCarouselSliderWidget({super.key,required this.images});

  @override
  State<SolutionCarouselSliderWidget> createState() => _SolutionCarouselSliderWidgetState();
}

class _SolutionCarouselSliderWidgetState extends State<SolutionCarouselSliderWidget> {
  final CarouselController _controller = CarouselController();
  int _activePage = 0;

  void _changeActivePage(index){
    setState(() {
      _activePage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: widget.images.map((image) => Stack(
            fit: StackFit.expand,
            children:[
              Image.file(
                File(image.path),
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () => store.dispatch(RemoveSolutoionImageAction(image: image)),
                  icon: const Icon(Icons.close,color: Colors.white,size: 32),
                ),
              )
            ]
          )).toList(),
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1,
            height: MediaQuery.sizeOf(context).height,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) => _changeActivePage(index),
          ),
        ),
        Positioned(
          child: Builder(
            builder: (context) {
              if(widget.images.length <= 1) return const SpaceSavingWidget();
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.images.mapIndexed((index,_) => IconButton(
                  onPressed: () => _controller.animateToPage(index,duration: const Duration(milliseconds: 300)),
                  icon: Icon(
                    Icons.circle,
                    color: index == _activePage ?Colors.black : Colors.white,
                    size: 8,
                  )
                )).toList(),
              );
            }
          ),
        ),
      ],
    );
  }
}