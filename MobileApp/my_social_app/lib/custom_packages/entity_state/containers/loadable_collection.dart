import 'package:flutter/foundation.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/loadable_container.dart';
import 'package:my_social_app/custom_packages/entity_state/map_extentions.dart';

@immutable
class LoadableCollection<K, V> {
  final Map<K, LoadableContainer<K, V>> _map;
  LoadableCollection() : _map = <K, LoadableContainer<K, V>>{};
  const LoadableCollection._(Map<K, LoadableContainer<K, V>> map) : _map = map;

  LoadableCollection<K,V> loadSuccessMany(Map<K,V> map) =>
    LoadableCollection._(_map.setMany(map.map((k,v) => MapEntry(k, LoadableContainer.success(k,v)))));

  LoadableCollection<K,V> loading(K key) =>
    LoadableCollection<K,V>._(_map.setOne(key, this[key].loading()));
  LoadableCollection<K,V> success(K key, V entity) =>
    LoadableCollection<K,V>._(_map.setOne(key, this[key].success(entity)));
  LoadableCollection<K,V> failed(K key) =>
    LoadableCollection<K,V>._(_map.setOne(key, this[key].failed()));
  LoadableCollection<K,V> notFound(K key) =>
    LoadableCollection<K,V>._(_map.setOne(key, this[key].notFound()));
  
  LoadableContainer<K,V> operator[](K key) =>
    _map[key] ?? LoadableContainer<K,V>(key: key);
}