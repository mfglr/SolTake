import 'package:flutter/cupertino.dart';
import 'package:my_social_app/media/models/dimention.dart';
import 'package:my_social_app/media/models/media.dart';

@immutable
abstract class RemoteMedia extends Media{
  final String containerName;
  final String blobName;
  final int size;
  final Dimention dimention;

  const RemoteMedia({
    required super.type,
    required this.dimention,
    required this.containerName,
    required this.blobName,
    required this.size
  });
}