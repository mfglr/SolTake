import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/pagination_state/base_pagination.dart';

@immutable
class KeyPagination<K extends Comparable> extends BasePagination<K>{
  final Iterable<K> values;
  @override
  Iterable<K> get keys => values.map((e) => e);
  
  const KeyPagination({
    required super.isLast,
    required super.loadingNext,
    required super.loadingPrev,
    required super.isDescending,
    required super.recordsPerPage,
    required this.values,
  });

  factory KeyPagination.init(int recordsPerPage,bool isDescending)
    => KeyPagination<K>(
        isLast: false,
        loadingNext: false,
        loadingPrev: false,
        values: const [],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  
  KeyPagination<K> addOne(K value)
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        values: isDescending ? [value, ...values] : [...values, value],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  KeyPagination<K> prependOne(K value)
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        values: [value, ...values],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  KeyPagination<K> appendOne(K value)
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        values: [...values, value],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  KeyPagination<K> addOneInOrder(K value) =>
    isOutOfPagination(value)
      ? this
      : KeyPagination(
          isLast: isLast,
          loadingNext: loadingNext,
          loadingPrev: loadingPrev,
          values: [
            ...values.takeWhile((e) => e.compareTo(value) > 0),
            value,
            ...values.skipWhile((e) => e.compareTo(value) > 0)
          ],
          isDescending: isDescending,
          recordsPerPage: recordsPerPage
        );
  KeyPagination<K> removeOne(K key)
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values.where((value) => value.compareTo(key) != 0)
      );

  KeyPagination<K> prependMany(Iterable<K> values)
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: [...values, ...this.values]
      );
  KeyPagination<K> appendMany(Iterable<K> values)
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: [...this.values,...values]
      );
  KeyPagination<K> removeMany(Iterable<K> ids)
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values.where((value) => !ids.any((id) => id.compareTo(value) == 0))
      );
  KeyPagination<K> startLoadingNext()
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: true,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values,
      );
  KeyPagination<K> stopLoadingNext()
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: false,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        values: values,
      );
  KeyPagination<K> addNextPage(Iterable<K> values)
    => KeyPagination<K>(
        isLast: values.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        values: [...this.values, ...values],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  KeyPagination<K> startLoadingPrev()
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: true,
        values: values,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  KeyPagination<K> stopLoadingPrev()
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        values: values,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  KeyPagination<K> addPrevPage(Iterable<K> values)
    => KeyPagination<K>(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        values: [...values.toList().reversed, ...this.values],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  
  KeyPagination<K> refreshPage(Iterable<K> values)
    => KeyPagination<K>(
        isLast: values.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        values: values,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  KeyPagination<K> appendLastPage(Iterable<K> values)
    => KeyPagination<K>(
        isLast: true,
        loadingNext: false,
        loadingPrev: loadingPrev,
        values: [...this.values, ...values],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );


  KeyPagination<K> clear() =>
    KeyPagination<K>(
      isLast: false,
      loadingNext: false,
      loadingPrev: false,
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
      values: const []
    );
}