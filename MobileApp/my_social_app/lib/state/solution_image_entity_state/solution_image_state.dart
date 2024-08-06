import 'dart:typed_data';
import 'package:my_social_app/state/image_status.dart';

class SolutionImageState{
  final int id;
  final int solutionId;
  final String blobName;
  final double height;
  final double width;
  final ImageStatus state;
  final Uint8List? image;

  const SolutionImageState({
    required this.id,
    required this.solutionId,
    required this.blobName,
    required this.height,
    required this.width,
    required this.state,
    required this.image,
  });

  SolutionImageState load(Uint8List image)
    => SolutionImageState(
        id: id,
        solutionId: solutionId,
        blobName: blobName,
        height: height,
        width: width,
        state: ImageStatus.done,
        image: image
      );
}