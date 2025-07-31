import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_status.dart';

@immutable
class EntityContainer<I extends Comparable, E extends Entity<I>> {
  final I id;
  final EntityStatus status;
  final E? entity;

  const EntityContainer._({
    required this.id,
    required this.status,
    required this.entity
  });

  factory EntityContainer.loading(I id) => 
    EntityContainer<I,E>._(
      id: id,
      status: EntityStatus.loading,
      entity: null
    );

  factory EntityContainer.success(E entity) =>
    EntityContainer._(
      id: entity.id,
      status: EntityStatus.success,
      entity: entity
    );
  
  factory EntityContainer.failed(I id) =>
    EntityContainer._(
      id: id,
      status: EntityStatus.failed,
      entity: null
    );
  
  factory EntityContainer.notFound(I id) =>
    EntityContainer._(
      id: id,
      status: EntityStatus.notFound,
      entity: null
    );
}