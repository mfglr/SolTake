import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/entity_status.dart';

@immutable
class EntityContainer<K extends Comparable, E extends Entity<K>> {
  final EntityStatus status;
  final E? entity;

  const EntityContainer({
    required this.status,
    required this.entity
  });
}