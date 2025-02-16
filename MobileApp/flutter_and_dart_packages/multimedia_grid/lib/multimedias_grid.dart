import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia_grid/multimedia_grid.dart';

class MultimediasGrid extends StatelessWidget {
  final Iterable<Multimedia> medias;
  final String blobServiceUrl;
  final String noMediaPath;
  final String notFoundMediaPath;
  final void Function(int)? onTap;
  
  const MultimediasGrid({
    super.key,
    required this.medias,
    required this.blobServiceUrl,
    required this.noMediaPath,
    required this.notFoundMediaPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1
      ),
      itemCount: medias.length,
      itemBuilder: (context, index) => MultimediaGrid(
        state: medias.elementAt(index),
        blobServiceUrl: blobServiceUrl,
        noMediaPath: noMediaPath,
        notFoundMediaPath: notFoundMediaPath,
        aspectRatio: 1,
        onTap: onTap != null ? () => onTap!(index) : null,
      )
    );
  }
}