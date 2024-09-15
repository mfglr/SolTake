import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/constants/routes.dart';

class CreateMediaSpeedDial extends StatelessWidget {
  final SpeedDialDirection direction;
  final void Function(Iterable<XFile>) onMediaLoaded;

  const CreateMediaSpeedDial({
    super.key,
    required this.direction,
    required this.onMediaLoaded
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.camera,
      activeIcon: Icons.close,
      openCloseDial: ValueNotifier(false),
      spaceBetweenChildren: 15,
      direction: SpeedDialDirection.up,
      renderOverlay: true,
      buttonSize: const Size.fromRadius(35),
      animationCurve: Curves.bounceOut,
      animationDuration: const Duration(milliseconds: 200),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.photo),
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
          onTap: (){
            ImagePicker()
              .pickMultiImage(imageQuality: 100)
              .then((images) => onMediaLoaded(images));
          }
        ),
        SpeedDialChild(
          child: const Icon(Icons.photo_camera),
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          onTap: () =>
            Navigator
              .of(context)
              .pushNamed(takeImageRoute)
              .then((image) => onMediaLoaded([image as XFile])),
        ),
        SpeedDialChild(
          child: const Icon(Icons.videocam),
          shape: const CircleBorder(),
          backgroundColor: Colors.red,
          onTap: () => 
            Navigator
            .of(context)
            .pushNamed(takeVideoRoute)
            .then((video) => onMediaLoaded([video as XFile]))
        )
      ],
    );
  }
}