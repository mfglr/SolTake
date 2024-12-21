import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class TakeVideoSpeedDial extends StatelessWidget {
  final SpeedDialDirection direction;
  final void Function() takeVideoFromGallery;
  final void Function() takeVideoFromCamera;
  const TakeVideoSpeedDial({
    super.key,
    required this.direction,
    required this.takeVideoFromGallery,
    required this.takeVideoFromCamera
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
        SpeedDialChild(
          child: const Icon(Icons.video_file),
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
          label: "Gallery",
          onTap: takeVideoFromGallery
        ),
        SpeedDialChild(
          child: const Icon(Icons.photo_camera),
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          label: "Camera",
          onTap: takeVideoFromCamera
        ),
      ],
    );
  }
}