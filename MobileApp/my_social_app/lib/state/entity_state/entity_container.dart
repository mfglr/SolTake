import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/entity_state/entity_status.dart';

@immutable
class EntityContainer<V> {
  final EntityStatus status;
  final V? entity;

  bool get isSuccess => status == EntityStatus.success;

  const EntityContainer._({
    required this.status,
    required this.entity
  });

  factory EntityContainer.success(V entity) =>
    EntityContainer<V>._(
      status: EntityStatus.success,
      entity: entity
    );
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

  EntityContainer<V> success(V entity) =>
    EntityContainer._(
      status: EntityStatus.success,
      entity: entity
    );
  EntityContainer<V> failed() =>
    EntityContainer._(
      status: EntityStatus.failed,
      entity: entity
    );
  EntityContainer<V> notFound() =>
    EntityContainer._(
      status: EntityStatus.notFound,
      entity: entity
    );
  EntityContainer<V> update(V? entity) =>
    EntityContainer._(
      status: status,
      entity: entity
    );
  EntityContainer<V> remove() =>
    EntityContainer<V>._(
      status: EntityStatus.notFound,
      entity: null,
    );
}