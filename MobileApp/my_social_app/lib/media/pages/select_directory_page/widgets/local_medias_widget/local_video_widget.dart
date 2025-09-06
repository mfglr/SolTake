import 'package:flutter/material.dart';
import 'package:my_social_app/media/models/local_video.dart';

class LocalVideoWidget extends StatelessWidget {
  final LocalVideo localVideo;
  
  const LocalVideoWidget({
    super.key,
    required this.localVideo
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        LayoutBuilder(
          builder: (context, constraints) => Image.file(
            localVideo.file,
            fit: BoxFit.cover,
            height: constraints.constrainHeight(),
            width: constraints.constrainWidth(),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle
          ),
          margin: const EdgeInsets.all(8),
          child: const Icon(
            Icons.play_arrow_rounded,
            color: Colors.white,
          )
        )
      ],
    );
  }
}