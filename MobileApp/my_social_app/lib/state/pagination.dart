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
  int? get firstValue => ids.firstOrNull;
  bool get hasAtLeastOnePage => ids.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loading;

  Pagination startLoading()
    => Pagination(
        isLast: isLast,
        loading: true,
        ids: ids,
        recordsPerPage: recordsPerPage,
      );
  Pagination appendNextPage(Iterable<int> nextIds)
    => Pagination(
        isLast: nextIds.length < recordsPerPage,
        loading: false,
        ids: [...ids, ...nextIds],
        recordsPerPage: recordsPerPage,
      );
  Pagination prependNextPage(Iterable<int> nextIds)
    => Pagination(
        isLast: nextIds.length < recordsPerPage,
        loading: false,
        ids: [...nextIds.toList().reversed, ...ids],
        recordsPerPage: recordsPerPage
      );
  Pagination prependOne(int newId)
    => Pagination(
        isLast: isLast,
        loading: loading,
        ids: [newId, ...ids],
        recordsPerPage: recordsPerPage,
      );
  Pagination appendOne(int newId)
    => Pagination(
        isLast: isLast,
        loading: loading,
        ids: [...ids, newId],
        recordsPerPage: recordsPerPage,
      );
  Pagination prependOneAndRemovePrev(int newId)
    => Pagination(
        isLast: isLast,
        loading: loading,
        ids: [newId, ...ids.where((e) => e != newId)],
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
  Pagination appendLastPage(Iterable<int> newIds)
    => Pagination(
        isLast: true,
        loading: false,
        ids: [...ids, ...newIds],
        recordsPerPage: recordsPerPage
      );
}