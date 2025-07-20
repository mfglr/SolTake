import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/pagination_state/page.dart' as pagination;

@immutable
abstract class BasePagination<K extends Comparable>{
  
  final bool isLast;
  final bool loadingNext;
  final bool loadingPrev;
  final int recordsPerPage;
  final bool  isDescending;
  Iterable<K> get keys;

  const BasePagination({
    required this.isLast,
    required this.loadingNext,
    required this.loadingPrev,
    required this.recordsPerPage,
    required this.isDescending
  });
  

  bool get hasAtLeastOnePage => keys.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loadingNext;
  bool get noPage => isReadyForNextPage && !hasAtLeastOnePage;
  bool get isReadyForPrevPage => !loadingPrev;
  bool get isEmpty => isLast && keys.isEmpty;

  bool isOutOfPagination(K key) =>
    !isLast &&
    (
      keys.isEmpty ||
      isDescending
        ? key.compareTo(keys.last) < 0
        : key.compareTo(keys.last) > 0
    );

  pagination.Page<K> get prev =>
    pagination.Page<K>(
      offset: keys.firstOrNull,
      take: recordsPerPage,
      isDescending: !isDescending
    );

  pagination.Page<K> get next =>
    pagination.Page<K>(
      offset: keys.lastOrNull,
      take: recordsPerPage,
      isDescending: isDescending
    );

  pagination.Page<K> get first =>
    pagination.Page<K>(
      offset: null,
      take: recordsPerPage,
      isDescending: isDescending
    );
}