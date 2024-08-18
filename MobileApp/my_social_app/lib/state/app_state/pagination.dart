import 'package:flutter/material.dart';

@immutable
class Pagination{
  final bool isLast;
  final bool loading;
  final bool loadingPrev;
  final int recordsPerPage;
  final Iterable<int> ids;
  final Iterable<int> outliers;

  const Pagination({
    required this.isLast,
    required this.loading,
    required this.loadingPrev,
    required this.ids,
    required this.recordsPerPage,
    required this.outliers,
  });

  factory Pagination.init(recordsPerPage)
    => Pagination(
        isLast: false,
        loading: false,
        loadingPrev: false,
        ids: const [],
        recordsPerPage: recordsPerPage,
        outliers: const []
      );

  int? get lastValue => ids.lastOrNull;
  int? get firstValue => ids.firstOrNull;
  bool get hasAtLeastOnePage => ids.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loading;
  bool get isReadyForPrevPage => !loadingPrev;

  Pagination startLoading()
    => Pagination(
        isLast: isLast,
        loading: true,
        loadingPrev: loadingPrev,
        ids: ids,
        recordsPerPage: recordsPerPage,
        outliers: outliers
      );
  Pagination startLoadingPrev()
    => Pagination(
        isLast: isLast,
        loading: loading,
        loadingPrev: true,
        ids: ids,
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination addNextPage(Iterable<int> nextIds)
    => Pagination(
        isLast: nextIds.length < recordsPerPage,
        loading: false,
        loadingPrev: loadingPrev,
        ids: [...ids, ...nextIds],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination addNextPage0(Iterable<int> nextIds){
    final newIds = nextIds.where((newId) => !ids.any((id) => newId == id));
    return Pagination(
      isLast: nextIds.length < recordsPerPage,
      loading: false,
      loadingPrev: loadingPrev,
      ids: [...ids, ...newIds],
      recordsPerPage: recordsPerPage,
      outliers: outliers,
    );
  }
  Pagination addPrevPage(Iterable<int> nextIds)
    => Pagination(
        isLast: isLast,
        loading: loading,
        loadingPrev: false,
        ids: [...nextIds.toList().reversed, ...ids],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination prependOne(int newId)
    => Pagination(
        isLast: isLast,
        loading: loading,
        loadingPrev: loadingPrev,
        ids: [newId, ...ids],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination appendOne(int newId)
    => Pagination(
        isLast: isLast,
        loading: loading,
        loadingPrev: loadingPrev,
        ids: [...ids, newId],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination prependOneAndRemovePrev(int newId)
    => Pagination(
        isLast: isLast,
        loading: loading,
        loadingPrev: loadingPrev,
        ids: [newId, ...ids.where((e) => e != newId)],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination removeOne(int id)
    => Pagination(
        isLast: isLast,
        loading: loading,
        loadingPrev: loadingPrev,
        ids: ids.where((e) => e != id),
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination addfirstPage(Iterable<int> newIds)
    => Pagination(
        isLast: newIds.length < recordsPerPage,
        loading: false,
        loadingPrev: loadingPrev,
        ids: newIds,
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination appendLastPage(Iterable<int> newIds)
    => Pagination(
        isLast: true,
        loading: false,
        loadingPrev: loadingPrev,
        ids: [...ids, ...newIds],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
}