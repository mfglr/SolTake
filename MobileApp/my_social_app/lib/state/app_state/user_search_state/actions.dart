import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/search_state/user_search_state.dart';

@immutable
class AddUserSearchsAction extends redux.Action{
  final Iterable<UserSearchState> searchs;
  const AddUserSearchsAction({required this.searchs});
}

@immutable
class AddUserSearchAction extends redux.Action{
  final UserSearchState search;
  const AddUserSearchAction({required this.search});
}

@immutable
class RemoveUserSearchAction extends redux.Action{
  final int searchId;
  const RemoveUserSearchAction({required this.searchId});
}