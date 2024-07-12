import 'package:flutter/material.dart';
import 'package:my_social_app/state/ids.dart';

@immutable
class SearchState{
  final String key;
  final Ids users;
  const SearchState({required this.key,required this.users});
  
  SearchState search(String key, List<int> u) => SearchState(key: key, users: users.init(u));
  SearchState nextPage(List<int> u) => SearchState(key: key, users: users.nextPage(u));
  SearchState clear() => const SearchState(key: "", users: Ids(ids: [], isLast: false, lastId: null));
}