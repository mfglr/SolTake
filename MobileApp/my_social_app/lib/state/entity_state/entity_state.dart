import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/has_id.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';

@immutable
class EntityState<K extends Comparable<K>,V extends HasId<K>>{
  final Map<K,V> _map;
  const EntityState._({required Map<K,V> map}) : _map = map;
  factory EntityState() => const EntityState._(map: {});

  V? get(bool Function(V) test) => _map.values.where(test).firstOrNull;
  Iterable<V> getList(bool Function(V) test) => _map.values.where(test);
  V? getValue(K key) => _map[key];

  EntityState<K,V> prependOne(V value) =>
    _map[value.id] != null ? this : EntityState._(map: _map.prependOne(value));
  EntityState<K,V> appendOne(V value) =>
    _map[value.id] != null ? this : EntityState._(map: _map.appendOne(value));
  EntityState<K,V> appendMany(Iterable<V> values) =>
    EntityState._(map: _map.appendMany(values.where((e) => _map[e.id] == null)));
  EntityState<K,V> appendList(Iterable<Iterable<V>> list) =>
    EntityState._(map: _map.appendLists(list.map((e) => e.where((e) => _map[e.id] == null))));
  EntityState<K,V> updateOne(V value) => 
    EntityState._(map: _map.updateOne(value));
  EntityState<K,V> where(bool Function(V) test) =>
    EntityState._(map: _map.where(test));

  

  // Map<int,T> updateMany(Iterable<T?> values){
  //   final Map<int,T> entities = {};
  //   entities.addAll(this.entities);
  //   for(final value in values){
  //     if(value != null) entities[value.id] = value;
  //   }
  //   return entities;
  // }
  // Map<int,T> removeOne(int id){
  //   final Map<int,T> entities = {};
  //   entities.addAll(this.entities);
  //   entities.removeWhere((key,value) => key == id);
  //   return entities;
  // }
  // Map<int,T> removeMany(Iterable<int> ids){
  //   final Map<int,T> entities = {};
  //   entities.addAll(this.entities); 
  //   entities.removeWhere((key,value) => ids.any((id) => id == key));
  //   return entities;
  // }
  // Map<int,T> removeLists(Iterable<Iterable<int>> lists){
  //   final Map<int,T> entities = {};
  //   entities.addAll(this.entities);
  //   for(final list in lists){
  //     entities.removeWhere((key,e) => list.any((id) => id == key));
  //   }
  //   return entities;
  // }
  
}