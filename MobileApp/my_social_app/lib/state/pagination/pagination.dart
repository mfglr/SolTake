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
      offset: ids.firstOrNull ?? 2147483647,
      take: recordsPerPage,
      isDescending: !isDescending
    );

  pagination.Page get next =>
    pagination.Page(
      offset: ids.lastOrNull ?? 2147483647,
      take: recordsPerPage,
      isDescending: isDescending
    );

  bool get hasAtLeastOnePage => ids.length >= recordsPerPage;
  bool get isReadyForNextPage => !isLast && !loadingNext;
  bool get noPage => isReadyForNextPage && !hasAtLeastOnePage;
  bool get isReadyForPrevPage => !loadingPrev;


  Iterable<int> merge(int id) => [id, ...ids.where((e) => e != id)];

  Pagination prependMany(Iterable<int> ids)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        ids: [...ids, ...this.ids]
      );
  Pagination appendMany(Iterable<int> ids)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        ids: [...this.ids,...ids]
      );

  Pagination startLoadingNext()
    => Pagination(
        isLast: isLast,
        loadingNext: true,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        ids: ids,
      );
  Pagination stopLoadingNext()
    => Pagination(
        isLast: isLast,
        loadingNext: false,
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
  Pagination stopLoadingPrev()
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        ids: ids,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination addNextPage(Iterable<int> ids)
    => Pagination(
        isLast: ids.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: [...this.ids, ...ids],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );

  Pagination addPrevPage(Iterable<int> ids)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: false,
        ids: [...ids.toList().reversed, ...this.ids],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination prependOne(int id){
    if(ids.any((e) => e == id)) return this;
    return Pagination(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      ids: [id, ...ids],
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
    );
  }
  Pagination appendOne(int id){
    if(ids.any((e) => e == id)) return this;
    return Pagination(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      ids: [...ids, id],
      isDescending: isDescending,
      recordsPerPage: recordsPerPage,
    );
  }
  Pagination prependOneAndRemovePrev(int id)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: [id, ...ids.where((e) => e != id)],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination prependOneAndRemoveOne(int addedOne,int removedOne)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        ids: [addedOne, ...ids.where((e) => e != removedOne)],
      );
  Pagination removeOne(int id)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        ids: ids.where((e) => e != id),
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination removeMany(Iterable<int> ids)
    => Pagination(
        isLast: isLast,
        loadingNext: loadingNext,
        loadingPrev: loadingPrev,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
        ids: this.ids.where((e) => !ids.any((id) => e == id))
      );
  Pagination addfirstPage(Iterable<int> ids)
    => Pagination(
        isLast: ids.length < recordsPerPage,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: ids,
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination appendLastPage(Iterable<int> ids)
    => Pagination(
        isLast: true,
        loadingNext: false,
        loadingPrev: loadingPrev,
        ids: [...this.ids, ...ids],
        isDescending: isDescending,
        recordsPerPage: recordsPerPage,
      );
  Pagination addInOrder(int id){
    if(!isLast && (ids.isEmpty || id < ids.last)) return this;
    return Pagination(
      isLast: isLast,
      loadingNext: loadingNext,
      loadingPrev: loadingPrev,
      ids: [...ids.takeWhile((e) => e > id),id,...ids.skipWhile((e) => e > id)],
      isDescending: isDescending,
      recordsPerPage: recordsPerPage
    );
  }

}