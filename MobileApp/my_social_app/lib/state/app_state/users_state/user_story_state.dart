import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';

@immutable
class UserStoryState {
  final int id;
  final DateTime createdAt;
  final bool isViewed;
  final Multimedia media;

  const UserStoryState({
    required this.id,
    required this.createdAt,
    required this.isViewed,
    required this.media
  });
}