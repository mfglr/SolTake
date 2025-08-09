import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/new_entity_container.dart';

@immutable
class NewEntityCollection<K extends Comparable, V extends Entity<K>> {
  final Map<K, NewEntityContainer<K, V>> _map;
  NewEntityCollection() : _map = <K, NewEntityContainer<K, V>>{};

  const NewEntityCollection._(Map<K, NewEntityContainer<K, V>> map) : _map = map;

  NewEntityCollection<K,V> loading(K key) =>
    NewEntityCollection<K,V>._(_map.setOne(key, NewEntityContainer.loading(key)));
  NewEntityCollection<K,V> success(V entity) =>
    NewEntityCollection<K,V>._(_map.setOne(entity.id, _map[entity.id]?.success(entity)));
  NewEntityCollection<K,V> failed(K key) =>
    NewEntityCollection<K,V>._(_map.setOne(key, _map[key]?.failed()));
  NewEntityCollection<K,V> notFound(K key) =>
    NewEntityCollection<K,V>._(_map.setOne(key, _map[key]?.notFound()));
  NewEntityCollection<K,V> removeOne(V entity) =>
    NewEntityCollection<K,V>._(_map.removeOne(entity.id));
  NewEntityCollection<K,V> removeOneByKey(K key) =>
    NewEntityCollection<K,V>._(_map.removeOne(key));

  NewEntityCollection<K,V> successOne(V entity) =>
    NewEntityCollection<K,V>._(_map.successOne(entity));
  NewEntityCollection<K,V> successMany(Iterable<V> entities) =>
    NewEntityCollection<K,V>._(_map.successMany(entities));

  NewEntityContainer<K,V> operator[](K key) => _map[key] ?? NewEntityContainer.notLoading(key);
}