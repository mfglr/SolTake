import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/has_id.dart';
import 'package:my_social_app/state/entity_state/page.dart' as pagination;

@immutable
class Pagination<K extends Comparable<K>,V extends HasId<K>>{
  final bool isLast;
  final bool loadingNext;
  final bool loadingPrev;
  final int recordsPerPage;
  final bool isDescending;
  final Iterable<V> values;

  const Pagination({
    required this.isLast,
    required this.loadingNext,
    required this.loadingPrev,
    required this.isDescending,
    required this.recordsPerPage,
    required this.values,
  });

  factory Pagination.init(int recordsPerPage,bool isDescending)
    => Pagination(
        isLast: false,
        loadingNext: false,
        loadingPrev: false,
        values: const [],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  
  pagination.Page<K> get prev => 
    pagination.Page(
      offset: values.firstOrNull?.id,
      take: recordsPerPage,
      isDescending: !isDescending
    );

  pagination.Page<K> get next =>
    pagination.Page(
      offset: values.lastOrNull?.id,
      take: recordsPerPage,
      isDescending: isDescending
    );

  bool get hasAtLeastOnePage => values.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loadingNext;
  bool get noPage => isReadyForNextPage && !hasAtLeastOnePage;
  bool get isReadyForPrevPage => !loadingPrev;

  Iterable<V> merge(V value) => [value, ...values.where((e) => e.id.compareTo(value.id) != 0)];

  Pagination<K,V> prependMany(Iterable<V> values)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: [...values, ...this.values]
      );
  Pagination<K,V> appendMany(Iterable<V> values)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: [...this.values,...values]
      );

  Pagination<K,V> startLoadingNext()
    => Pagination(
        isLast: isLast,
        loadingNext: true,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values,
      );
  Pagination<K,V> stopLoadingNext()
    => Pagination(
        isLast: isLast,
        loadingNext: false,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values,
      );
  Pagination<K,V> addNextPage(Iterable<V> values)
    => Pagination(
        isLast: values.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        values: [...this.values, ...values],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
      
  Pagination<K,V> startLoadingPrev()
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: true,
        values: values,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> stopLoadingPrev()
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        values: values,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> addPrevPage(Iterable<V> values)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        values: [...values.toList().reversed, ...this.values],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  
  Pagination<K,V> prependOne(V value){
    if(values.any((e) => e.id.compareTo(value.id) == 0)) return this;
    return Pagination(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      values: [value, ...values],
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
    );
  }
  Pagination<K,V> appendOne(V value){
    if(values.any((e) => e.id.compareTo(value.id) == 0)) return this;
    return Pagination(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      values: [...values, value],
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
    );
  }
  Pagination<K,V> prependOneAndRemovePrev(V value)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        values: [value, ...values.where((e) => e.id.compareTo(value.id) != 0)],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> prependOneAndRemoveOne(V addedOne,K removedOne)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: [addedOne, ...values.where((e) => e.id != removedOne)],
      );
  Pagination<K,V> addfirstPage(Iterable<V> values)
    => Pagination(
        isLast: values.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        values: values,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination<K,V> appendLastPage(Iterable<V> values)
    => Pagination(
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
    Pagination(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
      values: values.where(test)
    );
}