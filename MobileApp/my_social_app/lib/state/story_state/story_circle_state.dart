import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';

@immutable
class StoryCircleState {
  final int userId;
  final Multimedia? image;
  final bool isViewed;
  final String userName;

  const StoryCircleState({
    required this.userId,
    required this.image,
    required this.isViewed,
    required this.userName
  });
}
