import 'dart:io';
import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/create_question_state/actions.dart';
import 'package:my_social_app/state/store.dart';

class CarouselSliderWidget extends StatelessWidget {
  final Iterable<XFile> images;
  const CarouselSliderWidget({super.key,required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((image) => Column(
        children: [
          Stack(
            children:[
              Image.file(File(image.path)),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: (){
                    if(images.length == 1){
                      store.dispatch(const ClearCreateQuestionStateAction());
                      Navigator.of(context).pop();
                    }
                    else{
                      store.dispatch(RemoveImageAction(image: image));
                    }
                  },
                  icon: const Icon(Icons.close,color: Colors.white,size: 32,),
                ),
              )
            ]
          ),
        ],
      )).toList(),
      options: CarouselOptions(
        autoPlay: false,
        viewportFraction: 0.9,
        height: MediaQuery.sizeOf(context).height,
        enableInfiniteScroll: false
      ),
    );
  }
}