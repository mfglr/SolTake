import 'package:flutter/material.dart';

@immutable
class Pagination{
  final bool isLast;
  final bool loading;
  final int recordsPerPage;
  final Iterable<int> ids;

  const Pagination({
    required this.isLast,
    required this.loading,
    required this.ids,
    required this.recordsPerPage,

  });

  factory Pagination.init(recordsPerPage)
    => Pagination(
        isLast: false,
        loading: false,
        ids: const [],
        recordsPerPage: recordsPerPage,
      );

  int? get lastValue => ids.lastOrNull;

  bool get hasAtLeastOnePage => ids.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loading;

  

  Pagination startLoading()
    => Pagination(
        isLast: isLast,
        loading: true,
        ids: ids,
        recordsPerPage: recordsPerPage,
      );
  Pagination addNextPage(Iterable<int> nextIds)
    => Pagination(
        isLast: nextIds.length < recordsPerPage,
        loading: false,
        ids: [...ids, ...nextIds],
        recordsPerPage: recordsPerPage,
      );
  Pagination prependOne(int newId)
    => Pagination(
        isLast: isLast,
        loading: loading,
        ids: [newId, ...ids],
        recordsPerPage: recordsPerPage,
      );
  Pagination removeOne(int id)
    => Pagination(
        isLast: isLast,
        loading: loading,
        ids: ids.where((e) => e != id),
        recordsPerPage: recordsPerPage,
      );
  Pagination addfirstPage(Iterable<int> newIds)
    => Pagination(
        isLast: newIds.length < recordsPerPage,
        loading: false,
        ids: newIds,
        recordsPerPage: recordsPerPage
      );
  
  // Iterable<int> _getUniqIds(Iterable<int> newIds) => newIds.where((x) => !ids.any((id) => id == x));
  // Pagination appendOne(int newId)
  //   => Pagination(
  //       isLast: isLast,
  //       lastValue: ids.isEmpty ? newId : lastValue,
  //       loading: loading,
  //       recordsPerPage: recordsPerPage,
  //       ids: [...ids, newId]
  //     );
  // Pagination appendMany(Iterable<int> newIds)
  //   => Pagination(
  //       isLast: isLast,
  //       lastValue: ids.isNotEmpty ? newIds.last : lastValue,
  //       loading: loading,
  //       recordsPerPage: recordsPerPage,
  //       ids: [...ids, ...newIds]
  //     );
}