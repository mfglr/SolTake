import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/enums/multimedia_type.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:my_social_app/views/multimedia_slider/multimedia_image_player.dart';
import 'package:my_social_app/views/multimedia_slider/multimedia_video_player.dart';
import 'package:video_player/video_player.dart';

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
  // late final Iterable<VideoPlayerController> _controllers;
  // final AppClient _appClient = AppClient();

  // @override
  // void initState() {
  //   _controllers = widget.medias
  //     .where((media) => media.multimediaType == MultimediaType.video)
  //     .map((media){
  //       var url = _appClient.generateUri("blobs/${media.containerName}/${media.blobName}");
  //       var controller = VideoPlayerController.networkUrl(url, httpHeaders: _appClient.getHeader());
  //       controller.setLooping(true);
  //       return controller;
  //     });

  //   super.initState();
  // }

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
    return CarouselSlider(
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
      )
    );
  }
}