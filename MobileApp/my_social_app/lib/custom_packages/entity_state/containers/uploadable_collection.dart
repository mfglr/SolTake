import 'package:flutter/foundation.dart';
import 'package:my_social_app/custom_packages/entity_state/map_extentions.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/uploadable_container.dart';

@immutable
class UploadableCollection<K, V> {
  final Map<K, UploadableContainer<K, V>> _map;
  UploadableCollection() : _map = <K, UploadableContainer<K, V>>{};
  const UploadableCollection._(Map<K, UploadableContainer<K, V>> map) : _map = map;

  Iterable<UploadableContainer<K,V>> get containers => _map.values;

  UploadableCollection<K,V> uploading(K key, V entity) => 
    UploadableCollection<K, V>._(_map.setOne(key, this[key].uploading(entity)));
  UploadableCollection<K, V> changeRate(K key, double rate) =>
    UploadableCollection<K, V>._(_map.setOne(key, this[key].changeRate(rate)));
  UploadableCollection<K, V> processing(K key) => 
    UploadableCollection<K, V>._(_map.setOne(key, this[key].processing()));
  UploadableCollection<K, V> failed(K key) => 
    UploadableCollection<K, V>._(_map.setOne(key, this[key].failed()));
  UploadableCollection<K, V> reupload(K key) => 
    UploadableCollection<K, V>._(_map.setOne(key, this[key].reupload()));

  UploadableCollection<K, V> remove(K key) => 
    UploadableCollection<K, V>._(_map.removeOne(key));


  UploadableContainer<K, V> operator[](K key) => _map[key] ?? UploadableContainer<K, V>(key: key);
}