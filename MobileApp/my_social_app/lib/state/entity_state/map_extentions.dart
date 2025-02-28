import 'package:my_social_app/state/entity_state/base_entity.dart';

extension MapExtentions<K extends Comparable,V extends BaseEntity<K>> on Map<K,V>{
  Map<K,V> prependOne(V value) =>
    { for (var e in [value, ...values]) e.id : e };
  Map<K,V> appendOne(V value) => 
    { for (var e in [...values, value]) e.id : e };
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
  Map<K,V> updateOne(V value) => 
    { for( var e in [...values.map((e) => e.id == value.id ? value : e)]) e.id : e };
  Map<K,V> removeOne(K id) =>
    { for (var e in [...values.where((e) => e.id.compareTo(id) != 0)]) e.id : e };
  
  Map<K,V> where(bool Function(V) test) => 
    { for (var e in [...values.where(test)]) e.id : e };

  Map<K,V> appendMany(Iterable<V> values) => 
    { for (var e in [...this.values,...values]) e.id : e };
  Map<K,V> prependMany(Iterable<V> values) => 
    { for (var e in [...values,...this.values]) e.id : e };
  Map<K,V> updateMany(Iterable<V> values) =>
    { for (var e in [
      ...this.values.map(
        (e) => 
          values.any((value) => value.id.compareTo(e.id) == 0) 
            ? values.where((x) => x.id.compareTo(e.id) == 0).first
            : e
      )
    ]) e.id : e };
  Map<K,V> removeMany(Iterable<V> values) =>
    { for (var e in [...this.values.where((e) => values.any((v) => v.id.compareTo(e.id) != 0) )]) e.id : e };

  Map<K,V> appendLists(Iterable<Iterable<V>> list) =>
    appendMany(list.expand((e) => e));
}