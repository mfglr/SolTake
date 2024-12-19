import 'package:my_social_app/enums/multimedia_type.dart';

class Multimedia {
  final String containerName;
  final String blobName;
  final int size;
  final double height;
  final double width;
  final double duration;
  final MultimediaType multimediaType;

  const Multimedia({
    required this.containerName,
    required this.blobName,
    required this.size,
    required this.height,
    required this.width,
    required this.duration,
    required this.multimediaType
  });
}