import 'package:flutter/cupertino.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';

@immutable
abstract class RemoteMedia extends Media{
  final String containerName;
  final String blobName;
  final int size;

  const RemoteMedia({
    required super.type,
    required super.dimention,
    required this.containerName,
    required this.blobName,
    required this.size
  });
}