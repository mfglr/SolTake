import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/new_entity_container.dart';

@immutable
class NewEntityCollection<K extends Comparable, V extends Entity<K>> {
  final Map<K, NewEntityContainer<K, V>> _map;
  NewEntityCollection() : _map = <K, NewEntityContainer<K, V>>{};

  const NewEntityCollection._(Map<K, NewEntityContainer<K, V>> map) : _map = map;

  NewEntityCollection<K,V> setOne(V entity) => NewEntityCollection._(_map.setOne(entity));
  NewEntityCollection<K,V> setMany(Iterable<V> entities) => NewEntityCollection._(_map.setMany(entities));

  NewEntityContainer<K,V>? operator[](K key) => _map[key];
}