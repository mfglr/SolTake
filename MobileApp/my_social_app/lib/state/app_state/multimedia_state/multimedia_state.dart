import 'dart:typed_data';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_status.dart';

abstract class MultimediaState {
  final String containerName;
  final String blobName;
  final int size;
  final double height;
  final double width;
  final double duration;
  final int multimediaType;
  final MultimediaStatus status;
  final Uint8List? data;
  
  const MultimediaState({
    required this.containerName,
    required this.blobName,
    required this.size,
    required this.height,
    required this.width,
    required this.duration,
    required this.multimediaType,
    required this.status,
    required this.data
  });
}