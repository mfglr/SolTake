import 'package:flutter/material.dart';

@immutable
class Pagination{
  final bool isLast;
  final bool loadingNext;
  final bool loadingPrev;
  final int recordsPerPage;
  final Iterable<int> ids;
  final Iterable<int> outliers;

  const Pagination({
    required this.isLast,
    required this.loadingNext,
    required this.loadingPrev,
    required this.ids,
    required this.recordsPerPage,
    required this.outliers,
  });

  Iterable<int> _filterOutliers(Iterable<int> nextIds) => nextIds.where((newId) => !outliers.any((outlier) => outlier == newId)); 

  factory Pagination.init(recordsPerPage)
    => Pagination(
        isLast: false,
        loadingNext: false,
        loadingPrev: false,
        ids: const [],
        recordsPerPage: recordsPerPage,
        outliers: const []
      );

  Iterable<int> get data => [...outliers,...ids];
  int? get lastValue => ids.lastOrNull;
  int? get firstValue => ids.firstOrNull;
  bool get hasAtLeastOnePage => data.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loadingNext;
  bool get isReadyForPrevPage => !loadingPrev;

  Pagination startLoadingNext()
    => Pagination(
        isLast: isLast,
        loadingNext: true,
        loadingPrev: loadingPrev,
        ids: ids,
        recordsPerPage: recordsPerPage,
        outliers: outliers
      );
  Pagination startLoadingPrev()
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: true,
        ids: ids,
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination addNextPage(Iterable<int> nextIds)
    => Pagination(
        isLast: nextIds.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: [...ids, ..._filterOutliers(nextIds)],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination addPrevPage(Iterable<int> nextIds)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        ids: [..._filterOutliers(nextIds).toList().reversed, ...ids],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination prependOne(int newId)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: [newId, ...ids],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination appendOne(int newId)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: [...ids, newId],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination prependOneAndRemovePrev(int newId)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: [newId, ...ids.where((e) => e != newId)],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination removeOne(int id)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: ids.where((e) => e != id),
        recordsPerPage: recordsPerPage,
        outliers: outliers.where((e) => e != id),
      );
  Pagination addfirstPage(Iterable<int> newIds)
    => Pagination(
        isLast: newIds.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: _filterOutliers(newIds),
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination appendLastPage(Iterable<int> newIds)
    => Pagination(
        isLast: true,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: [...ids, ..._filterOutliers(newIds)],
        recordsPerPage: recordsPerPage,
        outliers: outliers,
      );
  Pagination prependToOutliers(int id)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: ids.where((e) => e != id),
        recordsPerPage: recordsPerPage,
        outliers: [id, ...outliers.where((e) => e != id)]
      );
}