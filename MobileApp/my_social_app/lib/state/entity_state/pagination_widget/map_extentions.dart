import 'package:my_social_app/state/entity_state/pagination_widget/paginable.dart';

extension MapExtentions<K extends Comparable,V extends Paginable<K>> on Map<K,V>{
  Map<K,V> prependOne(V value) =>
    { for (var e in [value, ...values]) e.paginationProperty : e };
  Map<K,V> appendOne(V value) => 
    { for (var e in [...values, value]) e.paginationProperty : e };
  Map<K,V> addOneInOrder(V value) =>
    {
      for (
        var e in [
          ...values.takeWhile((e) => e.paginationProperty.compareTo(value.paginationProperty) > 0),
          value,
          ...values.skipWhile((e) => e.paginationProperty.compareTo(value.paginationProperty) > 0)
        ]
      ) e.paginationProperty : e 
    };
  Map<K,V> updateOne(V value) =>
    { for( var e in [...values.map((e) => e.paginationProperty.compareTo(value.paginationProperty) == 0 ? value : e)]) e.paginationProperty : e };

  Map<K,V> updateElsePrependOne(V value) =>
    this[value.paginationProperty] != null ? updateOne(value) : prependOne(value);
  Map<K,V> updateElseAppendOne(V value) => 
    this[value.paginationProperty] != null ? updateOne(value) : appendOne(value);
  

  Map<K,V> removeOne(K paginationProperty) =>
    { for (var e in [...values.where((e) => e.paginationProperty.compareTo(paginationProperty) != 0)]) e.paginationProperty : e };
  
  Map<K,V> where(bool Function(V) test) => 
    { for (var e in [...values.where(test)]) e.paginationProperty : e };

  Map<K,V> prependMany(Iterable<V> values) => 
    { for (var e in [...values,...this.values]) e.paginationProperty : e };
  Map<K,V> appendMany(Iterable<V> values) =>
    { for (var e in [...this.values, ...values]) e.paginationProperty : e };
  Map<K,V> updateMany(Iterable<V> values) =>
    { for (var e in [
      ...this.values.map(
        (e) => 
          values.any((value) => value.paginationProperty.compareTo(e.paginationProperty) == 0) 
            ? values.where((x) => x.paginationProperty.compareTo(e.paginationProperty) == 0).first
            : e
      )
    ]) e.paginationProperty : e };

  Map<K,V> removeMany(Iterable<V> values) =>
    { for (var e in [...this.values.where((e) => values.any((v) => v.paginationProperty.compareTo(e.paginationProperty) != 0) )]) e.paginationProperty : e };

  Map<K,V> appendLists(Iterable<Iterable<V>> list) =>
    appendMany(list.expand((e) => e));
}