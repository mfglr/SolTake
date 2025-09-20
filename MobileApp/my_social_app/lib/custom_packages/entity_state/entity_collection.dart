import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_container.dart';
import 'package:my_social_app/custom_packages/entity_state/map_extentions.dart';

@immutable
class EntityCollection<K,V> {
  final Map<K, EntityContainer<K, V>> _map;
  EntityCollection() : _map = <K, EntityContainer<K, V>>{};
  const EntityCollection._(Map<K, EntityContainer<K, V>> map) : _map = map;

  EntityCollection<K,V> create(K key) =>
    EntityCollection._(_map.setOne(key, EntityContainer.create(key)));

  EntityCollection<K,V> load(K key) =>
    EntityCollection._(_map.setOne(key, this[key].load()));
  EntityCollection<K,V> loadSuccess(K key, V entity) =>
    EntityCollection._(_map.setOne(key, this[key].loadSuccess(entity)));
  EntityCollection<K,V> loadFailed(K key) => 
    EntityCollection._(_map.setOne(key, this[key].loadFailed()));
  EntityCollection<K,V> notFound(K key) => 
    EntityCollection._(_map.setOne(key, this[key].notFound()));
   EntityCollection<K,V> loadSuccessMany(Map<K,V> map) =>
    EntityCollection._(_map.setMany(map.map((k,v) => MapEntry(k, EntityContainer.loadSuccess(k,v)))));

  EntityCollection<K,V> upload(K key, V entity) =>
    EntityCollection._(_map.setOne(key,this[key].upload(entity)));
  EntityCollection<K,V> changeRate(K key,double rate) =>
    EntityCollection._(_map.setOne(key, this[key].changeRate(rate)));
  EntityCollection<K,V> processing(K key) =>
    EntityCollection._(_map.setOne(key, this[key].processing()));
  EntityCollection<K,V> uploadSuccess(K key) =>
    EntityCollection._(_map.setOne(key, this[key].uploadSuccess()));
  EntityCollection<K,V> uploadFailed(K key) =>
    EntityCollection._(_map.setOne(key, this[key].uploadFailed()));
  
  EntityCollection<K,V> delete(K key)
    => EntityCollection._(_map.setOne(key, this[key].delete()));
  
  EntityCollection<K,V> remove(K key) =>
    EntityCollection._(_map.removeOne(key));
 
  EntityCollection<K,V> update(K key, V? entity)
    => EntityCollection._(_map.setOne(key, this[key].update(entity)));

  int get length => _map.length;
  EntityContainer<K, V> operator[](K key) => _map[key] ?? EntityContainer.create(key);
}