import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_widget/media_widget.dart';
import 'package:my_social_app/services/app_client.dart';

class MediasGrid extends StatelessWidget {
  final Iterable<Media> medias;
  final int numberOfColumn;

  const MediasGrid({
    super.key,
    required this.medias,
    required this.numberOfColumn,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Wrap(
        children: 
          medias
            .map(
              (media) => SizedBox(
                height: constraints.constrainWidth() / numberOfColumn,
                width: constraints.constrainWidth() / numberOfColumn,
                child: Container(
                  margin: const EdgeInsets.all(1),
                  child: MediaWidget(
                    media: media,
                    blobService: AppClient.blobService,
                  ),
                ),
              )
            )
            .toList()
      ),
    );
  }
}