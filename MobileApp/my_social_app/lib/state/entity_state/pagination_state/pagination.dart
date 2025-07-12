import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart' as pagination;

@immutable
class Pagination<K extends Comparable, V extends Entity<K>>{
  final bool isLast;
  final bool loadingNext;
  final bool loadingPrev;
  final int recordsPerPage;
  final bool isDescending;
  final Iterable<V> values;

  Iterable<V> select(bool Function(V) test) => values.where(test);

  const Pagination({
    required this.isLast,
    required this.loadingNext,
    required this.loadingPrev,
    required this.isDescending,
    required this.recordsPerPage,
    required this.values,
  });

  factory Pagination.init(int recordsPerPage,bool isDescending)
    => Pagination<K,V>(
        isLast: false,
        loadingNext: false,
        loadingPrev: false,
        values: const [],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  
  pagination.Page<K> get prev =>
    pagination.Page<K>(
      offset: values.firstOrNull?.id,
      take: recordsPerPage,
      isDescending: !isDescending
    );

  pagination.Page<K> get next =>
    pagination.Page<K>(
      offset: values.lastOrNull?.id,
      take: recordsPerPage,
      isDescending: isDescending
    );

  pagination.Page<K> get first =>
    pagination.Page<K>(
      offset: null,
      take: recordsPerPage,
      isDescending: isDescending
    );

  bool get hasAtLeastOnePage => values.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loadingNext;
  bool get noPage => isReadyForNextPage && !hasAtLeastOnePage;
  bool get isReadyForPrevPage => !loadingPrev;
  bool get isEmpty => isLast && values.isEmpty;

  V? get(bool Function(V) test) => values.where(test).firstOrNull; 
  V? getById(K id) => values.where((e) => e.id.compareTo(id) == 0).firstOrNull;
  Iterable<V> getByIds(Iterable<K> ids) => values.where((e) => ids.any((id) => id.compareTo(e.id) == 0));

  Iterable<V> merge(V value) => [value, ...values.where((e) => e.id.compareTo(value.id) != 0)];

  Pagination<K,V> clear() =>
    Pagination<K,V>(
      isLast: false,
      loadingNext: false,
      loadingPrev: false,
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
      values: const []
    );
  Pagination<K,V> prependMany(Iterable<V> values)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: [...values, ...this.values]
      );
  Pagination<K,V> appendMany(Iterable<V> values)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: [...this.values,...values]
      );
  Pagination<K,V> updateMany(Iterable<V> values)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: this.values.map((e) => values.where(((value) => e.id.compareTo(value.id) == 0)).firstOrNull ?? e)
      );
  Pagination<K,V> removeMany(Iterable<K> ids)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values.where((value) => !ids.any((id) => id.compareTo(value.id) == 0))
      );
  Pagination<K,V> startLoadingNext()
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: true,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values,
      );
  Pagination<K,V> stopLoadingNext()
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: false,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values,
      );
  Pagination<K,V> addNextPage(Iterable<V> values)
    => Pagination<K,V>(
        isLast: values.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        values: [...this.values, ...values],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> startLoadingPrev()
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: true,
        values: values,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> stopLoadingPrev()
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        values: values,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> addPrevPage(Iterable<V> values)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        values: [...values.toList().reversed, ...this.values],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> addOne(V value)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        values: isDescending ? [value, ...values] : [...values, value],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> prependOne(V value)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        values: [value, ...values],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> appendOne(V value)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        values: [...values, value],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> updateOne(V value)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values.map((e) => e.id.compareTo(value.id) == 0 ? value : e)
      );
  Pagination<K,V> removeOne(K key)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values.where((value) => value.id.compareTo(key) != 0)
      );
  Pagination<K,V> prependOneAndRemovePrev(V value)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        values: [value, ...values.where((e) => e.id.compareTo(value.id) != 0)],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> prependOneAndRemoveOne(V addedOne,K removedOne)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: [addedOne, ...values.where((e) => e.id != removedOne)],
      );
  Pagination<K,V> prependOneAndRemoveWhere(V addedOne,bool Function(V) test)
    => Pagination<K,V>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: [addedOne, ...values.where(test)],
      );

  Pagination<K,V> refreshPage(Iterable<V> values)
    => Pagination<K,V>(
        isLast: values.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        values: values,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> appendLastPage(Iterable<V> values)
    => Pagination<K,V>(
        isLast: true,
        loadingNext: false,
        loadingPrev: loadingPrev,
        values: [...this.values, ...values],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> addInOrder(V value){
    if(!isLast && (values.isEmpty || value.id.compareTo(values.last.id) < 0)) return this;
    return Pagination(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      values: [
        ...values.takeWhile((e) => e.id.compareTo(value.id) > 0),
        value,
        ...values.skipWhile((e) => e.id.compareTo(value.id) > 0)
      ],
      isDescending: isDescending,
      recordsPerPage: recordsPerPage
    );
  }
  Pagination<K,V> where(bool Function(V) test) =>
    Pagination<K,V>(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
      values: values.where(test)
    );
}