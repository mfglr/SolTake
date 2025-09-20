import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/custom_packages/media/pages/select_directory_page/widgets/local_medias_widget/local_media_widget.dart';

class LocalMediasWidget extends StatelessWidget {
  final Iterable<LocalMedia> medias;
  final int numberOfColumn;
  final void Function(LocalMedia) remove;
  final void Function(int index) onPressed;

  const LocalMediasWidget({
    super.key,
    required this.medias,
    required this.numberOfColumn,
    required this.remove,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: medias
        .mapIndexed((index, media) => Container(
          padding: const EdgeInsets.all(1),
          height: MediaQuery.of(context).size.width / numberOfColumn,
          width: MediaQuery.of(context).size.width / numberOfColumn,
          child: LocalMediaWidget(
            localMedia: media,
            remove: remove,
            onpressed: () => onPressed(index),
          )
        ))
        .toList(),
    );
  }
}