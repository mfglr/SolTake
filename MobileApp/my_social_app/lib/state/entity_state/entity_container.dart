import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/loading_state.dart';

@immutable
class EntityContainer<T extends Entity>{
  final LoadingState state;
  final T entity;

  const EntityContainer({
    required this.state,
    required this.entity
  });
}