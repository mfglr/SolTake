import 'package:flutter/material.dart';

@immutable
abstract class PaginationData<T>{
  final T paginationProperty;
  const PaginationData({required this.paginationProperty});
}

@immutable
class Pagination{
  final bool isLast;
  final bool loadingNext;
  final bool loadingPrev;
  final int recordsPerPage;
  final Iterable<int> ids;

  const Pagination({
    required this.isLast,
    required this.loadingNext,
    required this.loadingPrev,
    required this.ids,
    required this.recordsPerPage,
  });


  factory Pagination.init(recordsPerPage)
    => Pagination(
        isLast: false,
        loadingNext: false,
        loadingPrev: false,
        ids: const [],
        recordsPerPage: recordsPerPage,
      );

  int? get lastValue => ids.lastOrNull;
  int? get firstValue => ids.firstOrNull;
  bool get hasAtLeastOnePage => ids.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loadingNext;
  bool get isReadyForPrevPage => !loadingPrev;

  Iterable<int> merge(int id) => [id, ...ids.where((e) => e != id)];

  Pagination startLoadingNext()
    => Pagination(
        isLast: isLast,
        loadingNext: true,
        loadingPrev: loadingPrev,
        ids: ids,
        recordsPerPage: recordsPerPage,
      );
  Pagination startLoadingPrev()
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: true,
        ids: ids,
        recordsPerPage: recordsPerPage,
      );
  Pagination addNextPage(Iterable<int> nextIds)
    => Pagination(
        isLast: nextIds.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: [...ids, ...nextIds],
        recordsPerPage: recordsPerPage,
      );
  Pagination addPrevPage(Iterable<int> nextIds)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        ids: [...nextIds.toList().reversed, ...ids],
        recordsPerPage: recordsPerPage,
      );
  Pagination prependOne(int newId)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: [newId, ...ids],
        recordsPerPage: recordsPerPage,
      );
  Pagination appendOne(int newId)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: [...ids, newId],
        recordsPerPage: recordsPerPage,
      );
  Pagination prependOneAndRemovePrev(int newId)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: [newId, ...ids.where((e) => e != newId)],
        recordsPerPage: recordsPerPage,
      );
  Pagination removeOne(int id)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: ids.where((e) => e != id),
        recordsPerPage: recordsPerPage,
      );
  Pagination addfirstPage(Iterable<int> newIds)
    => Pagination(
        isLast: newIds.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: newIds,
        recordsPerPage: recordsPerPage,
      );
  Pagination appendLastPage(Iterable<int> newIds)
    => Pagination(
        isLast: true,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: [...ids, ...newIds],
        recordsPerPage: recordsPerPage,
      );
  Pagination addInOrder(int id){
    if(!isLast && (ids.isEmpty || id < ids.last)) return this;
    return Pagination(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      ids: [...ids.takeWhile((x) => x > id),id,...ids.skipWhile((x) => x > id)], 
      recordsPerPage: recordsPerPage
    );
  }

}