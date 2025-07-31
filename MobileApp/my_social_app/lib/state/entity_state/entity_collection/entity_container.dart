import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_status.dart';

@immutable
class EntityContainer<V> {
  final EntityStatus status;
  final V? entity;

  bool get isSuccess => status == EntityStatus.success;

  const EntityContainer._({
    required this.status,
    required this.entity
  });


  factory EntityContainer.notLoading() => 
    EntityContainer<V>._(
      status: EntityStatus.notLoading,
      entity: null
    );

  factory EntityContainer.loading() => 
    EntityContainer<V>._(
      status: EntityStatus.loading,
      entity: null
    );

  factory EntityContainer.success(V entity) =>
    EntityContainer<V>._(
      status: EntityStatus.success,
      entity: entity
    );
  
  factory EntityContainer.failed() =>
    const EntityContainer._(
      status: EntityStatus.failed,
      entity: null
    );
  
  factory EntityContainer.notFound() =>
    EntityContainer<V>._(
      status: EntityStatus.notFound,
      entity: null
    );

  EntityContainer<V> updateOne(V? entity) =>
    EntityContainer<V>._(
      status: status,
      entity: entity,
    );

  EntityContainer<V> removeOne() =>
    EntityContainer<V>._(
      status: EntityStatus.notFound,
      entity: null,
    );
}