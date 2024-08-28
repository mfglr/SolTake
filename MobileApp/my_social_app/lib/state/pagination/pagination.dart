import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination/page.dart' as pagination;

@immutable
class Pagination{
  final bool isLast;
  final bool loadingNext;
  final bool loadingPrev;
  final int recordsPerPage;
  final bool isDescending;
  final Iterable<int> ids;

  const Pagination({
    required this.isLast,
    required this.loadingNext,
    required this.loadingPrev,
    required this.isDescending,
    required this.recordsPerPage,
    required this.ids,
  });

  factory Pagination.init(int recordsPerPage,bool isDescending)
    => Pagination(
        isLast: false,
        loadingNext: false,
        loadingPrev: false,
        ids: const [],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  
  pagination.Page get prev => 
    pagination.Page(
      offset: ids.firstOrNull,
      take: recordsPerPage,
      isDescending: !isDescending
    );

  pagination.Page get next =>
    pagination.Page(
      offset: ids.lastOrNull,
      take: recordsPerPage,
      isDescending: isDescending
    );

  bool get hasAtLeastOnePage => ids.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loadingNext;
  bool get isReadyForPrevPage => !loadingPrev;

  Iterable<int> merge(int id) => [id, ...ids.where((e) => e != id)];

  Pagination startLoadingNext()
    => Pagination(
        isLast: isLast,
        loadingNext: true,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        ids: ids,
      );
  Pagination startLoadingPrev()
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: true,
        ids: ids,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination addNextPage(Iterable<int> nextIds)
    => Pagination(
        isLast: ids.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: [...ids, ...nextIds],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination addPrevPage(Iterable<int> prevIds)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        ids: [...prevIds.toList().reversed, ...ids],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination prependOne(int id)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: [id, ...ids],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination appendOne(int id)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: [...ids, id],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination prependOneAndRemovePrev(int id)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: [id, ...ids.where((e) => e != id)],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination removeOne(R one)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: ids.where((prop) => prop.key != one.key),
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination where(bool Function(R) predicate)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: ids.where(predicate),
        isDescending: isDescending,
        recordsPerPage: recordsPerPage
      );
  Pagination addfirstPage(Iterable<R> first)
    => Pagination(
        isLast: first.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: first,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination appendLastPage(Iterable<R> last)
    => Pagination(
        isLast: true,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: [...ids, ...last],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination addInOrder(R one){
    if(!isLast && (props.isEmpty || one.key.compareTo(props.last.key) < 0)) return this;
    return Pagination(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      ids: [
        ...ids.takeWhile((x) => x.key.compareTo(one.key) > 0),
        one,
        ...ids.skipWhile((x) => x.key.compareTo(one.key) > 0)
      ],
      isDescending: isDescending,
      recordsPerPage: recordsPerPage
    );
  }

}