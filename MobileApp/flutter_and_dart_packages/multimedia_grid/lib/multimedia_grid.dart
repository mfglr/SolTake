import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia/models/multimedia_status.dart';
import 'package:multimedia/models/multimedia_type.dart';

class MultimediaGrid extends StatelessWidget {
  final Multimedia? state;
  final String noMediaPath;
  final String notFoundMediaPath;
  final void Function()? onTap;
  final double aspectRatio;

  const MultimediaGrid({
    super.key,
    required this.state,
    required this.noMediaPath,
    required this.notFoundMediaPath,
    this.onTap,
    this.aspectRatio = 1
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          AspectRatio(
            aspectRatio: aspectRatio,
            child: Builder(
              builder: (context) {
                if(state == null) return Image.asset(noMediaPath);
                if(state!.status == MultimediaStatus.failed) return Image.asset(notFoundMediaPath);
                if(state!.status == MultimediaStatus.started) return  const Center( child: CircularProgressIndicator() );
                return Image.memory(
                  state!.data!,
                  fit: BoxFit.cover,
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
      ),
    );
  }
}