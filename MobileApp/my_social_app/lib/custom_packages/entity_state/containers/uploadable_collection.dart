import 'package:flutter/foundation.dart';
import 'package:my_social_app/custom_packages/entity_state/map_extentions.dart';
import 'package:my_social_app/custom_packages/entity_state/containers/uploadable_container.dart';

@immutable
class UploadableCollection<V> {
  final Map<String, UploadableContainer<V>> _map;
  UploadableCollection() : _map = <String, UploadableContainer<V>>{};
  const UploadableCollection._(Map<String, UploadableContainer<V>> map) : _map = map;

  UploadableCollection<V> uploading(String key, V entity) => 
    UploadableCollection<V>._(_map.setOne(key, this[key].uploading(entity)));
  UploadableCollection<V> changeRate(String key, double rate) =>
    UploadableCollection<V>._(_map.setOne(key, this[key].changeRate(rate)));
  UploadableCollection<V> processing(String key) => 
    UploadableCollection<V>._(_map.setOne(key, this[key].processing()));
  UploadableCollection<V> success(String key) => 
    UploadableCollection<V>._(_map.setOne(key, this[key].success()));
  UploadableCollection<V> failed(String key) => 
    UploadableCollection<V>._(_map.setOne(key, this[key].failed()));
  UploadableCollection<V> reupload(String key) => 
    UploadableCollection<V>._(_map.setOne(key, this[key].reupload()));

  UploadableContainer<V> operator[](String key) => _map[key] ?? UploadableContainer<V>(key: key);
}