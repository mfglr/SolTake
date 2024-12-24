import 'package:carousel_slider/carousel_slider.dart';
import 'package:circles_pagination/circles_pagination.dart';
import 'package:flutter/material.dart';
import 'package:multimedia_slider/widgets/multimedia_image_player.dart';
import 'package:multimedia_slider/widgets/multimedia_video_player.dart';
import 'package:multimedia_state/multimedia_state.dart';

class MultimediaSlider extends StatefulWidget {
  final Iterable<MultimediaState> medias;
  final String blobServiceUrl;
  final Map<String,String>? headers;
  final String notFoundImagePath;
  
  const MultimediaSlider({
    super.key,
    required this.medias,
    required this.blobServiceUrl,
    required this.notFoundImagePath,
    this.headers
  });

  @override
  State<MultimediaSlider> createState() => _MultimediaSliderState();
}

class _MultimediaSliderState extends State<MultimediaSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _index = 0;

  double _calculateHeight(){
    double minAspectRatio = double.maxFinite;
    for(var media in widget.medias){
      double aspectRatio = media.width / media.height;
      if(aspectRatio < minAspectRatio){
        minAspectRatio = aspectRatio;
      }
    }
    return MediaQuery.sizeOf(context).width / minAspectRatio;
  }
 
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: widget.medias
            .map((e){
              if(e.multimediaType == MultimediaType.video){
                return MultimediaVideoPlayer(
                  state: e,
                  blobServiceUrl: widget.blobServiceUrl,
                  headers: widget.headers,
                );
              }
              return MultimediaImagePlayer(
                state: e,
                notFoundImagePath: widget.notFoundImagePath,
                blobServiceUrl: widget.blobServiceUrl,
                headers: widget.headers,
              );
            })
            .toList(),
          options: CarouselOptions(
            autoPlay: false,
            enableInfiniteScroll: false,
            height: _calculateHeight(),
            viewportFraction: 0.999,
            onPageChanged: (index,reason) => setState(() { _index = index; }),
          )
        ),
        if(widget.medias.length > 1)
          Positioned(
            bottom: 15,
            child: CirclesPagination(
              numberOfCircles: widget.medias.length,
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