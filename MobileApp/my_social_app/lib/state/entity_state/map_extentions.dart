import 'package:my_social_app/state/entity_state/entity.dart';

extension MapExtentions<K extends Comparable, V extends Entity<K>> on Map<K,V>{
  Map<K,V> prependOne(V value) => { value.id: value, ...this };
  Map<K,V> appendOne(V value) => { ...this, value.id: value };
  Map<K,V> updateOne(V value) => { for (var e in values) e.id : (e.id.compareTo(value.id) == 0 ? value : e) };
  Map<K,V> removeOne(K key) => { for (var e in [...values.where((e) => e.id.compareTo(key) != 0)]) e.id : e };
  Map<K,V> updateElsePrependOne(V value) => this[value.id] != null ? updateOne(value) : prependOne(value);
  Map<K,V> updateElseAppendOne(V value) => this[value.id] != null ? updateOne(value) : appendOne(value);
  
  // WARNING: This assumes that `this.values` is already sorted by descending id.
  Map<K,V> addOneInOrder(V value) =>
    {
      for (
        var e in [
          ...values.takeWhile((e) => e.id.compareTo(value.id) > 0),
          value,
          ...values.skipWhile((e) => e.id.compareTo(value.id) > 0)
        ]
      ) e.id : e
    };

  
  Map<K,V> where(bool Function(V) test) =>
    { for (var e in [...values.where(test)]) e.id : e };
  Map<K,V> prependMany(Iterable<V> values) => 
    { for (var e in [...values,...this.values]) e.id : e };
  Map<K,V> appendMany(Iterable<V> values) =>
    { for (var e in [...this.values, ...values]) e.id : e };
  Map<K, V> updateMany(Iterable<V> values) => 
    { for (var e in [...this.values.map((e) => values.where((v) => v.id.compareTo(e.id) == 0).firstOrNull ?? e)]) e.id: e };
  Map<K, V> removeMany(Iterable<V> values) =>
    { for (var e in [...this.values.where((e) => !values.any((v) => v.id.compareTo(e.id) == 0))]) e.id: e };
  Map<K, V> removeByKeys(Iterable<K> keys) =>
    { for (var e in [...values.where((e) => !keys.any((key) => key.compareTo(e.id) == 0))]) e.id: e };
  Map<K,V> appendLists(Iterable<Iterable<V>> list) =>
    appendMany(list.expand((e) => e));
}

extension MapExtentions1<K, V> on Map<K,V>{
  Map<K,V> setOne(K key, V? value) => 
    value != null
      ? { for (var entry in [...entries, MapEntry(key, value)]) entry.key : entry.value }
      : this;

  Map<K,V> prependOne(K key, V value) => { for (var entry in [MapEntry(key, value), ...entries]) entry.key : entry.value };
  // Map<K,V> updateOne(K key, V value) => { for( var entry in [...entries.map((e) => e.key.compareTo(key) == 0 ? MapEntry(key, value) : e)]) entry.key : entry.value };
  // Map<K,V> updateElsePrependOne(K key, V value) => this[key] != null ? updateOne(key, value) : prependOne(key, value);
}