import 'package:flutter/widgets.dart';
import 'package:my_social_app/custom_packages/entity_state/entity.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';

@immutable
class AIModelState extends Entity<int>{
  final String name;
  final int solPerInputToken;
  final int solPerOutputToken;
  final Media image;

  AIModelState({
    required super.id,
    required this.name,
    required this.solPerInputToken,
    required this.solPerOutputToken,
    required this.image
  });
}