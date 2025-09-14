import 'package:flutter/material.dart';
import 'package:my_social_app/state/search_users_state/search_user_state.dart';
import 'package:my_social_app/views/search/widgets/search_user_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';

class SearchUsersWidget extends StatelessWidget {
  final Iterable<SearchUserState> searchUsers;
  const SearchUsersWidget({
    super.key,
    required this.searchUsers
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: searchUsers.map((searchUser) => SearchUserWidget(searchUser: searchUser,))
    );
  }
}