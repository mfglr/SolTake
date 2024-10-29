import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class TakeMultimedyaSpeedDial extends StatelessWidget {
  final void Function()? takeVideo;
  final void Function()? takeImages;
  final void Function()? takeImage;
  final SpeedDialDirection direction;

  const TakeMultimedyaSpeedDial({
    super.key,
    required this.takeImages,
    required this.takeVideo,
    required this.takeImage,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.camera,
      activeIcon: Icons.close,
      openCloseDial: ValueNotifier(false),
      spaceBetweenChildren: 15,
      direction: direction,
      renderOverlay: true,
      buttonSize: const Size.fromRadius(35),
      animationCurve: Curves.bounceOut,
      animationDuration: const Duration(milliseconds: 200),
      children: [
        if(takeImages != null)
          SpeedDialChild(
            child: const Icon(Icons.photo),
            shape: const CircleBorder(),
            backgroundColor: Colors.green,
            onTap: takeImages
          ),
        if(takeImage != null)
          SpeedDialChild(
            child: const Icon(Icons.photo_camera),
            shape: const CircleBorder(),
            backgroundColor: Colors.blue,
            onTap: takeImage
          ),
        if(takeVideo != null)
          SpeedDialChild(
            child: const Icon(Icons.videocam),
            shape: const CircleBorder(),
            backgroundColor: Colors.red,
            onTap: takeVideo
          ),
      ],
    );
  }
}