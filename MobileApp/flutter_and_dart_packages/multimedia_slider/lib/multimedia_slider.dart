import 'package:carousel_slider/carousel_slider.dart';
import 'package:circles_pagination/circles_pagination.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:multimedia_slider/widgets/multimedia_image_player.dart';
import 'package:multimedia_slider/widgets/multimedia_video_player.dart';

class MultimediaSlider extends StatefulWidget {
  final Iterable<Multimedia> medias;
  final String blobServiceUrl;
  final Map<String,String>? headers;
  final String notFoundMediaPath;
  final String noMediaPath;
  final int activeIndex;
  final Widget Function(int index)? child;
  
  const MultimediaSlider({
    super.key,
    required this.medias,
    required this.blobServiceUrl,
    required this.notFoundMediaPath,
    required this.noMediaPath,
    this.headers,
    this.activeIndex = 0,
    this.child
  });

  @override
  State<MultimediaSlider> createState() => _MultimediaSliderState();
}

class _MultimediaSliderState extends State<MultimediaSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  late int _index;

  @override
  void initState() {
    _index = widget.activeIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpToPage(_index);
    });
    super.initState();
  }

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
    if(widget.medias.isEmpty) return Image.asset(widget.noMediaPath);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: widget.medias
            .mapIndexed((index,media) => Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Builder(builder: (context){
                  if(media.multimediaType == MultimediaType.video){
                    return MultimediaVideoPlayer(
                      media: media,
                      blobServiceUrl: widget.blobServiceUrl,
                      headers: widget.headers,
                    );
                  }
                  return MultimediaImagePlayer(
                    media: media,
                    notFoundImagePath: widget.notFoundMediaPath,
                    noImagePath: widget.noMediaPath,
                    blobServiceUrl: widget.blobServiceUrl,
                    headers: widget.headers,
                  );
                }),
                if(widget.child != null) widget.child!(index)
              ],
            ))
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