import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/wigets/media_widget/media_widget.dart';

class CirclerMediaWidget extends StatelessWidget {
  final double diameter;
  final Media media;
  final String blobService;

  const CirclerMediaWidget({
    super.key,
    required this.media,
    required this.diameter,
    required this.blobService
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
      height: diameter,
      width: diameter,
      child: MediaWidget(
        media: media,
        blobService: blobService,
      )
    );
  }
}