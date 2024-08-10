import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/pagination.dart';

@immutable
class SearchState{
  final String key;
  final Pagination users;
  const SearchState({required this.key,required this.users});
  
  SearchState getFirstPageUsers(String key)
    => SearchState(key: key, users: users.startLoading());
  SearchState addFirstPageUsers(String key, Iterable<int> userIds)
    => SearchState(key: key, users: users.addfirstPage(userIds));
  SearchState addNextPageUsers(Iterable<int> userIds)
    => SearchState(key: key, users: users.appendNextPage(userIds));
  SearchState clear()
    => SearchState(key: "", users: Pagination.init(usersPerPage));
}