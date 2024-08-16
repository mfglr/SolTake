import 'dart:io';
import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/create_message_state/actions.dart';
import 'package:my_social_app/state/app_state/store.dart';

class CarouselSliderWidget extends StatelessWidget {
  final Iterable<XFile> images;
  const CarouselSliderWidget({super.key,required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((image) => Stack(
        children:[
          Center(
            child: Image.file(
              File(image.path),
            )
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){
                      if(images.length == 1){
                        Navigator.of(context).pop();
                      }
                      else{
                        store.dispatch(RemoveMessageImageAction(image: image));
                      }
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 35
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
      )).toList(),
      options: CarouselOptions(
        autoPlay: false,
        viewportFraction: 1,
        height: MediaQuery.sizeOf(context).height,
        enableInfiniteScroll: false
      ),
    );
  }
}