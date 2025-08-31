import 'package:flutter/cupertino.dart';
import 'package:multimedia/models/media.dart';

@immutable
abstract class RemoteMedia extends Media{
  final String containerName;
  final String blobName;
  final double height;
  final double width;
  final int size;

  double get aspectRatio => width / height;

  const RemoteMedia({
    required super.type,
    required this.containerName,
    required this.blobName,
    required this.height,
    required this.width,
    required this.size
  });
}