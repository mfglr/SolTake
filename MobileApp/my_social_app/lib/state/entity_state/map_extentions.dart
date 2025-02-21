import 'package:my_social_app/state/entity_state/has_id.dart';

extension MapExtentions<K extends Comparable<K>,V extends HasId<K>> on Map<K,V>{
  Map<K,V> prependOne(V value) =>
    { for (var e in [value, ...values]) e.id : e };
  Map<K,V> appendOne(V value) => 
    { for (var e in [...values, value]) e.id : e };
  Map<K,V> updateOne(V value) => 
    { for( var e in [...values.map((e) => e.id == value.id ? value : e)]) e.id : e };
  Map<K,V> addInOrder(V value) =>
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
    { for (var e in [...this.values,...values]) e.id : e };
  Map<K,V> appendLists(Iterable<Iterable<V>> list) =>
    appendMany(list.expand((e) => e));
  Map<K,V> removeOne(int id) => 
    { for (var e in [...values.where((e) => e.id != id)]) e.id : e };
 
  // Map<int,T> updateMany(Iterable entities) =>
  //   { for (var e in [...values.where(test)])}
  // Map<int,T> removeMany(Iterable<int> ids){
  //   Map<int,T> r = {};
  //   r.addEntries(values.where((e) => !ids.any((x) => x == e.id)).map((e) => MapEntry(e.id, e)));
  //   return r;
  // }
}