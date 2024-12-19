import 'dart:typed_data';
import 'package:my_social_app/enums/multimedia_type.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_status.dart';

abstract class MultimediaState {
  final String containerName;
  final String blobName;
  final int size;
  final double height;
  final double width;
  final double duration;
  final MultimediaType multimediaType;
  final MultimediaStatus state;
  final Uint8List? data;
  
  const MultimediaState({
    required this.containerName,
    required this.blobName,
    required this.size,
    required this.height,
    required this.width,
    required this.duration,
    required this.multimediaType,
    required this.state,
    required this.data
  });
}