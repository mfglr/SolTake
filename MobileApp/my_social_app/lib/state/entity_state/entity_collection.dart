import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_container.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';

@immutable
class EntityCollection<K,V> {
  final Map<K, EntityContainer<V>> _map;
  EntityCollection() : _map = <K, EntityContainer<V>>{};
  const EntityCollection._(Map<K, EntityContainer<V>> map) : _map = map;

  EntityCollection<K,V> loading(K key) => EntityCollection._(_map.setOne(key, EntityContainer.loading()));
  EntityCollection<K,V> success(K key, V entity) => EntityCollection._(_map.setOne(key, _map[key]?.success(entity)));
  EntityCollection<K,V> failed(K key) => EntityCollection._(_map.setOne(key, _map[key]?.failed()));
  EntityCollection<K,V> notFound(K key) => EntityCollection._(_map.setOne(key, _map[key]?.notFound()));
  EntityCollection<K,V> updateOne(K key, V? entity) => EntityCollection._(_map.setOne(key, _map[key]?.update(entity)));
  EntityCollection<K,V> removeOne(K key) => EntityCollection._(_map.setOne(key, _map[key]?.remove()));
  
  EntityCollection<K,V> successOne(K key, V entity) => EntityCollection._(_map.setOne(key, EntityContainer.success(entity)));
  EntityCollection<K,V> successMany(Map<K,V> map) =>
    EntityCollection._(_map.setMany(map.map((k,v) => MapEntry(k, EntityContainer.success(v)))));


  EntityContainer<V> operator[](K key) => _map[key] ?? EntityContainer.notLoading();
}