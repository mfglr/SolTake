import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/base_pagination.dart';
import 'package:my_social_app/state/entity_state/page.dart' as pagination;

@immutable
class KeyPagination<K extends Comparable> extends BasePagination{
  final Iterable<K> _keys;

  const KeyPagination._({
    required super.isLast,
    required super.loadingNext,
    required super.loadingPrev,
    required super.isDescending,
    required super.recordsPerPage,
    required Iterable<K> keys,
  }): _keys = keys;

  @override
  int get length => _keys.length;
  @override
  bool get isItemsEmpty => _keys.isEmpty;
  

  factory KeyPagination.init(int recordsPerPage, bool isDescending)
    => KeyPagination<K>._(
        isLast: false,
        loadingNext: false,
        loadingPrev: false,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: const {}
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

  K? get firstId => _keys.firstOrNull;
  K? get lastId => _keys.lastOrNull;
  UnmodifiableListView<K> get keys => UnmodifiableListView(_keys);

  KeyPagination<K> clear() =>
    KeyPagination<K>._(
      isLast: false,
      loadingNext: false,
      loadingPrev: false,
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
      keys: const []
    );
  KeyPagination<K> prependMany(Iterable<K> keys)
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: [...keys, ..._keys]
      );
  KeyPagination<K> appendMany(Iterable<K> keys)
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: [..._keys, ...keys]
      );
  KeyPagination<K> startNext()
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: true,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: _keys,
      );
  KeyPagination<K> stopNext()
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: false,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: _keys,
      );
  KeyPagination<K> addNext(Iterable<K> keys)
    => KeyPagination<K>._(
        isLast: keys.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: [..._keys, ...keys]
      );
  KeyPagination<K> startLoadingPrev()
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: true,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: _keys,
      );
  KeyPagination<K> stopLoadingPrev()
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: _keys,
      );
  KeyPagination<K> addPrev(Iterable<K> keys)
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: [...keys, ..._keys]
      );
  KeyPagination<K> addOne(K key)
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: isDescending
          ? [key, ..._keys]
          : [..._keys, key],
      );
  KeyPagination<K> prependOne(K key)
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: [key, ..._keys]
      );
  KeyPagination<K> appendOne(K key)
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: [..._keys, key],
      );
  KeyPagination<K> removeOne(K key)
    => KeyPagination<K>._(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: _keys.where((e) => e.compareTo(key) != 0)
      );
  KeyPagination<K> refresh(Iterable<K> keys)
    => KeyPagination<K>._(
        isLast: keys.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        keys: keys,
      );
  KeyPagination<K> addInOrder(K key) =>
    isOutOfPagination(key)
      ? this
      : KeyPagination<K>._(
          isLast: isLast,
          loadingNext: loadingNext,
          loadingPrev: loadingPrev,
          isDescending: isDescending,
          recordsPerPage: recordsPerPage,
          keys: [
            ..._keys.takeWhile((e) => e.compareTo(key) > 0),
            key,
            ..._keys.skipWhile((e) => e.compareTo(key) > 0)
          ],
        );
  bool isOutOfPagination(K key) =>
    !isLast &&
    (
      _keys.isEmpty ||
      isDescending
        ? key.compareTo(lastId) < 0
        : key.compareTo(lastId) > 0
    );
    
      
}