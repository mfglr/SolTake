import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:my_social_app/media/models/media.dart';
import 'package:my_social_app/media/models/uploadable.dart';

@immutable
abstract class LocalMedia extends Media implements Uploadable{
  final File file;
  const LocalMedia({
    required super.type,
    required this.file,
  });
}