import 'package:flutter/foundation.dart';

@immutable
class Dimention {
  final double width;
  final double height;

  double get aspectRatio => width / height;

  const Dimention({
    required this.width,
    required this.height
  });
}