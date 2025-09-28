import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_frame_widget/media_frame_widget.dart';
import 'package:my_social_app/services/app_client.dart';

class MediasGrid extends StatelessWidget {
  final Iterable<Media> medias;
  final int numberOfColumn;
  final void Function(Media)? onTap;

  const MediasGrid({
    super.key,
    required this.medias,
    required this.numberOfColumn,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Wrap(
        children: 
          medias
            .map(
              (media) => GestureDetector(
                onTap: onTap != null ? () => onTap!(media) : null,
                child: SizedBox(
                  height: constraints.constrainWidth() / numberOfColumn,
                  width: constraints.constrainWidth() / numberOfColumn,
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    child: MediaFrameWidget(
                      media: media,
                      blobService: AppClient.blobService,
                    ),
                  ),
                ),
              )
            )
            .toList()
      ),
    );
  }
}