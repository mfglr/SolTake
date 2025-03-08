import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/user_search_state/user_search_state.dart';

@immutable
class AddUserSearchsAction extends AppAction{
  final Iterable<UserSearchState> searchs;
  const AddUserSearchsAction({required this.searchs});
}

@immutable
class AddUserSearchAction extends AppAction{
  final UserSearchState search;
  const AddUserSearchAction({required this.search});
}

@immutable
class RemoveUserSearchAction extends AppAction{
  final int searchId;
  const RemoveUserSearchAction({required this.searchId});
}