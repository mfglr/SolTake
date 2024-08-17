import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/pagination.dart';

@immutable
class MultiPagination{
  static const int defaultPagination = 0;
  late final Map<int,Pagination> paginations;

  MultiPagination(int recordPerPage){
    paginations = { defaultPagination: Pagination.init(recordPerPage) };
  }

  MultiPagination addPagination(int offset,int recordsPerPage){
    if(paginations[offset] != null) return this;
    final r = MultiPagination(recordsPerPage);
    r.paginations.addAll(paginations);
    r.paginations.addEntries([MapEntry(offset,Pagination.init(recordsPerPage))]);
    return r;
  }
}