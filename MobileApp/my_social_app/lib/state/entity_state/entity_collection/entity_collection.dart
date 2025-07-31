import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_container.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';

@immutable
class EntityCollection<K,V> {
  final Map<K, EntityContainer<V>> _map;
  EntityCollection() : _map = <K, EntityContainer<V>>{};
  const EntityCollection._(Map<K, EntityContainer<V>> map) : _map = map;

  EntityCollection<K,V> loading(K key) => EntityCollection._(_map.setOne(key, EntityContainer.loading()));
  EntityCollection<K,V> success(K key, V entity) => EntityCollection._(_map.setOne(key, EntityContainer.success(entity)));
  EntityCollection<K,V> failed(K key) => EntityCollection._(_map.setOne(key, EntityContainer.failed()));
  EntityCollection<K,V> notFound(K key) => EntityCollection._(_map.setOne(key, EntityContainer.notFound()));
  
  EntityCollection<K,V> setOne(K key, V? entity) => EntityCollection._(_map.setOne(key,this[key].updateOne(entity)));
  // EntityCollection<K,V> setMany(Map<K, V?> map) => EntityCollection._(_map.setMany(map));
  
  EntityContainer<V> operator[](K key) => _map[key] ?? EntityContainer.notLoading();
}