import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TakeMediaSpeedDial extends StatelessWidget {
  final SpeedDialDirection direction;
  final void Function() takeFromGallery;
  final void Function() takeFromCamera;
  const TakeMediaSpeedDial({
    super.key,
    required this.direction,
    required this.takeFromGallery,
    required this.takeFromCamera
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
          child: const Icon(Icons.image),
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
          label: AppLocalizations.of(context)!.take_video_speed_dial_gallery,
          onTap: takeFromGallery
        ),
        SpeedDialChild(
          child: const Icon(Icons.photo_camera),
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          label: AppLocalizations.of(context)!.take_video_speed_dial_camera,
          onTap: takeFromCamera
        ),
      ],
    );
  }
}