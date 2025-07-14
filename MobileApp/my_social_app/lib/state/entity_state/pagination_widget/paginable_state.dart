import 'package:my_social_app/state/entity_state/pagination_widget/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_widget/paginable.dart';

class PaginableState<K extends Comparable, V extends Paginable<K>>{
  final Map<K,V> _map;
  PaginableState() : _map = <K,V>{};
  PaginableState._({required Map<K,V> map}) : _map = map;

  V? get(bool Function(V) test) => _map.values.where(test).firstOrNull;
  Iterable<V> getList(bool Function(V) test) => _map.values.where(test);
  V? getValue(K key) => _map[key];
  Iterable<V> get values => _map.values;
  Iterable<V> select(bool Function(V) test) => _map.values.where(test);

  PaginableState<K,V> appendOne(V value) => PaginableState<K,V>._(map: _map.appendOne(value));
  PaginableState<K,V> prependOne(V value) => PaginableState<K,V>._(map: _map.prependOne(value));
  PaginableState<K,V> updateOne(V value) => PaginableState<K,V>._(map: _map.updateOne(value));
  PaginableState<K,V> removeOne(K id) => PaginableState<K,V>._(map: _map.removeOne(id));
  PaginableState<K,V> updateElseAppendOne(V value) => PaginableState<K,V>._(map: _map.updateElseAppendOne(value));
  PaginableState<K,V> updateElsePrependOne(V value) => PaginableState<K,V>._(map: _map.updateElsePrependOne(value));
  PaginableState<K,V> appendMany(Iterable<V> values) => PaginableState<K,V>._(map: _map.appendMany(values));
  PaginableState<K,V> updateMany(Iterable<V> values) => PaginableState<K,V>._(map: _map.updateMany(values));
  PaginableState<K,V> where(bool Function(V) test) => PaginableState<K,V>._(map: _map.where(test));
  
}