import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_status.dart';
import 'package:multimedia/models/multimedia_type.dart';

class CirclerMultimedia extends StatelessWidget {
  final Multimedia? state;
  final String noMediaPath;
  final String notFoundMediaPath;
  final double diameter;

  const CirclerMultimedia({
    super.key,
    required this.state,
    required this.noMediaPath,
    required this.notFoundMediaPath,
    required this.diameter,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipOval(
          child: Builder(
            builder: (context) {
              if(state == null){
                return Image.asset(
                  noMediaPath,
                  width: diameter,
                  height: diameter,
                  fit: BoxFit.cover,
                );
              }
              if(state!.status == MultimediaStatus.failed){
                return Image.asset(
                  notFoundMediaPath,
                  width: diameter,
                  height: diameter,
                  fit: BoxFit.cover,
                );
              }
              if(state!.status == MultimediaStatus.started){
                return SizedBox(
                  width: diameter,
                  height: diameter,
                  child: const Center(
                    child: CircularProgressIndicator()
                  ),
                );
              }
              return Image.memory(
                state!.data!,
                fit: BoxFit.cover,
                height: diameter,
                width: diameter,
              );
            }
          )
        ),
        if(state != null && state!.multimediaType == MultimediaType.video)
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(153),
              shape: BoxShape.circle
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 40,
            ),
          )
      ],
    );
  }
}