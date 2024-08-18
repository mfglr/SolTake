import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination.dart';

@immutable
class MultiPagination{
  static const int defaultPaginationOffset = -1;
  late final Map<int,Pagination> paginations;

  MultiPagination(int recordPerPage){
    paginations = { defaultPaginationOffset: Pagination.init(recordPerPage) };
  }
  
  MultiPagination _setPage(int offset,Pagination pagination){
    final r = MultiPagination(pagination.recordsPerPage);
    r.paginations.addAll(paginations);
    r.paginations.addEntries([MapEntry(offset, pagination)]);
    return r;
  }

  MultiPagination addPagination(int offset,int recordsPerPage){
    if(paginations[offset] != null) return this;
    return _setPage(offset, Pagination.init(recordsPerPage));
  }

  MultiPagination startLoading(int offset) => _setPage(offset, paginations[offset]!.startLoading());
  MultiPagination addNextPage(int offset,Iterable<int> ids) => _setPage(offset, paginations[offset]!.appendNextPage(ids));
  MultiPagination startLoadingPrev(int offset) => _setPage(offset, paginations[offset]!.startLoadingPrev());
  MultiPagination addPrevPage(int offset,Iterable<int> ids) => _setPage(offset, paginations[offset]!.addPrevPage(ids));
  MultiPagination prependOne(int offset,int id) => _setPage(offset, paginations[offset]!.prependOne(id));
  
  Iterable<int> selectIds(int offset) => paginations[offset]?.ids ?? [];
  Pagination selectPagination(int offset) => paginations[offset]!;
  Pagination get defaultPagination => paginations[defaultPaginationOffset]!;
  int? getNextOffset(int offset) => paginations[offset]!.lastValue ?? (offset != -1 ? offset + 1 : null);
}