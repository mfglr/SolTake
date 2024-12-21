import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/enums/multimedia_type.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:my_social_app/views/shared/circle_pagination_widget/circle_pagination_widget.dart';
import 'package:my_social_app/views/shared/multimedia_slider/widgets/multimedia_image_player.dart';
import 'package:my_social_app/views/shared/multimedia_slider/widgets/multimedia_video_player.dart';

class MultimediaSlider extends StatefulWidget {
  final Iterable<MultimediaState> medias;
  const MultimediaSlider({
    super.key,
    required this.medias
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
                return MultimediaVideoPlayer(state: e);
              }
              return MultimediaImagePlayer(state: e);
            })
            .toList(),
          options: CarouselOptions(
            autoPlay: false,
            enableInfiniteScroll: false,
            height: _calculateHeight(),
            viewportFraction: 0.99,
            onPageChanged: (index,reason) => setState(() { _index = index; }),
          )
        ),
        if(widget.medias.length > 1)
          Positioned(
            bottom: 15,
            child: CirclePaginationWidget(
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