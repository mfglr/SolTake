import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';

@immutable
abstract class LocalMedia extends Media{
  final File file;
  const LocalMedia({
    required super.type,
    required super.dimention,
    required this.file,
  });
}