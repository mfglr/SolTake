import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';


@immutable
class EntityState<K extends Comparable, V extends Entity<K>>{
  final Map<K,V> _map;
  const EntityState._({required Map<K,V> map}) : _map = map;
  EntityState() : _map = <K,V>{};

  V? getValue(K key) => _map[key];
  V? get(bool Function(V) test) => _map.values.where(test).firstOrNull;
  Iterable<V> getList(bool Function(V) test) => _map.values.where(test);
  Iterable<V> get values => _map.values;
  Iterable<V> select(bool Function(V) test) => _map.values.where(test);

  EntityState<K,V> appendOne(V value) => EntityState<K,V>._(map: _map.appendOne(value));
  EntityState<K,V> prependOne(V value) => EntityState<K,V>._(map: _map.prependOne(value));
  EntityState<K,V> updateOne(V value) => EntityState<K,V>._(map: _map.updateOne(value));
  EntityState<K,V> updateElseAppendOne(V value) => EntityState<K,V>._(map: _map.updateElseAppendOne(value));
  EntityState<K,V> updateElsePrependOne(V value) => EntityState<K,V>._(map: _map.updateElsePrependOne(value));
  EntityState<K,V> appendMany(Iterable<V> values) => EntityState<K,V>._(map: _map.appendMany(values));
  EntityState<K,V> updateMany(Iterable<V> values) => EntityState<K,V>._(map: _map.updateMany(values));
  EntityState<K,V> appendList(Iterable<Iterable<V>> list) => EntityState<K,V>._(map: _map.appendLists(list.map((e) => e.where((e) => _map[e.id] == null))));
  EntityState<K,V> where(bool Function(V) test) => EntityState<K,V>._(map: _map.where(test));

  V? operator[](K key) => _map[key];
  Iterable<V> getByKeys(Iterable<K> keys) => keys.map((key) => _map[key]!); 
  EntityState<K,V> setOne(V? value) => value != null ? EntityState<K,V>._(map: _map.setOne(value)) : this;
  EntityState<K,V> setMany(Iterable<V> values) => EntityState<K,V>._(map: _map.setMany(values));
  EntityState<K,V> removeOne(K id) => EntityState<K,V>._(map: _map.removeOne(id));
  
}