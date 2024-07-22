import 'dart:typed_data';
import 'package:my_social_app/state/image_state.dart';

class SolutionImageState{
  final int id;
  final String blobName;
  final double height;
  final double width;
  final ImageState state;
  final Uint8List? image;

  const SolutionImageState({
    required this.id,
    required this.blobName,
    required this.height,
    required this.width,
    required this.state,
    required this.image,
  });
}