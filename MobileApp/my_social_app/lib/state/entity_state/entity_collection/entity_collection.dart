import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_container.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';

@immutable
class EntityCollection<I extends Comparable,E extends Entity<I>> {
  final Map<I, EntityContainer<I, E>> _map;
  EntityCollection() : _map = <I, EntityContainer<I, E>>{};
  const EntityCollection._(Map<I, EntityContainer<I,E>> map) : _map = map;

  EntityCollection<I,E> loading(I id) => EntityCollection._(_map.setOne(EntityContainer.loading(id)));
  EntityCollection<I,E> success(E entity) => EntityCollection._(_map.setOne(EntityContainer.success(entity)));
  EntityCollection<I,E> failed(I id) => EntityCollection._(_map.setOne(EntityContainer.failed(id)));
  EntityCollection<I,E> notFound(I id) => EntityCollection._(_map.setOne(EntityContainer.notFound(id)));
  
  E? getEntity(I id) => _map[id]?.entity;
}