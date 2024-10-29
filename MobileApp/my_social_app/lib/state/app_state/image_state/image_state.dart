import 'dart:typed_data';

import 'package:my_social_app/state/app_state/image_state/image_status.dart';

class ImageState {
  final double height;
  final double width;
  final ImageStatus state;
  final Uint8List? data;
  
  const ImageState({
    required this.height,
    required this.width,
    required this.state,
    required this.data
  });
}