import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart' as pagination;

@immutable
class Pagination<K extends Comparable, V extends Entity<K>>{
  final bool isLast;
  final bool loadingNext;
  final bool loadingPrev;
  final int recordsPerPage;
  final bool isDescending;
  final Map<K, V> _map;

  const Pagination._({
    required this.isLast,
    required this.loadingNext,
    required this.loadingPrev,
    required this.isDescending,
    required this.recordsPerPage,
    required Map<K,V> map,
  }): _map = map;

  factory Pagination.init(int recordsPerPage, bool isDescending)
    => Pagination<K,V>._(
        isLast: false,
        loadingNext: false,
        loadingPrev: false,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: const {}
      );
  
  pagination.Page<K> get prev =>
    pagination.Page<K>(
      offset: firstId,
      take: recordsPerPage,
      isDescending: !isDescending
    );

  pagination.Page<K> get next =>
    pagination.Page<K>(
      offset: lastId,
      take: recordsPerPage,
      isDescending: isDescending
    );

  pagination.Page<K> get first =>
    pagination.Page<K>(
      offset: null,
      take: recordsPerPage,
      isDescending: isDescending
    );

  bool get hasAtLeastOnePage => _map.values.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loadingNext;
  bool get noPage => isReadyForNextPage && !hasAtLeastOnePage;
  bool get isReadyForPrevPage => !loadingPrev;
  bool get isEmpty => isLast && _map.values.isEmpty;
  K? get firstId => _map.values.firstOrNull?.id;
  K? get lastId => _map.values.lastOrNull?.id;

  V? operator[](K key) => _map[key];
  Iterable<V> get values => _map.values;
  V? get(bool Function(V) test) => _map.values.where(test).firstOrNull; 

  Pagination<K,V> clear() =>
    Pagination<K,V>._(
      isLast: false,
      loadingNext: false,
      loadingPrev: false,
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
      map: const {}
    );
  Pagination<K,V> prependMany(Iterable<V> values)
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.prependMany(values)
      );
  Pagination<K,V> appendMany(Iterable<V> values)
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.appendMany(values)
      );
  Pagination<K,V> updateMany(Iterable<V> values)
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.updateMany(values)
      );
  Pagination<K,V> removeByKeys(Iterable<K> keys)
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.removeByKeys(keys)
      );
  Pagination<K,V> startLoadingNext()
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: true,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map,
      );
  Pagination<K,V> stopLoadingNext()
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: false,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map,
      );
  Pagination<K,V> addNextPage(Iterable<V> values)
    => Pagination<K,V>._(
        isLast: values.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.appendMany(values),
      );
  Pagination<K,V> startLoadingPrev()
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: true,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map,
      );
  Pagination<K,V> stopLoadingPrev()
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map,
      );
  Pagination<K,V> addPrevPage(Iterable<V> values)
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.prependMany(values.toList().reversed),
      );
  Pagination<K,V> addOne(V value)
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: isDescending
          ? _map.prependOne(value)
          : _map.appendOne(value),
      );
  Pagination<K,V> prependOne(V value)
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.prependOne(value),
      );
  Pagination<K,V> appendOne(V value)
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.appendOne(value),
      );
  Pagination<K,V> updateOne(V value)
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.updateOne(value)
      );
  Pagination<K,V> removeOne(K key)
    => Pagination<K,V>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.removeOne(key)
      );
  Pagination<K,V> refreshPage(Iterable<V> values)
    => Pagination<K,V>._(
        isLast: values.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        map: _map.appendMany(values),
      );
  Pagination<K,V> where(bool Function(V) test) =>
    Pagination<K,V>._(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
      map: _map.where(test)
    );
  Pagination<K,V> addInOrder(V value) =>
    isOutOfPagination(value)
      ? this
      : Pagination<K,V>._(
          isLast: isLast,
          loadingNext: loadingNext,
          loadingPrev: loadingPrev,
          isDescending: isDescending,
          recordsPerPage: recordsPerPage,
          map: _map.addOneInOrder(value),
        );

  bool isOutOfPagination(V value) =>
    !isLast &&
    (
      _map.values.isEmpty ||
      isDescending
        ? value.id.compareTo(lastId) < 0
        : value.id.compareTo(lastId) > 0
    );
}