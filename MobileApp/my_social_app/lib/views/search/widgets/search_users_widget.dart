import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';
import 'package:my_social_app/views/search/widgets/search_user_widget.dart';

class SearchUsersWidget extends StatelessWidget {
  final Iterable<SearchUserState> searchUsers;
  const SearchUsersWidget({
    super.key,
    required this.searchUsers
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
        searchUsers
          .mapIndexed(
            (index,searchUser) => 
              index == searchUsers.length - 1
                ? SearchUserWidget(searchUser: searchUser)
                : Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: SearchUserWidget(searchUser: searchUser),
                  )
          )
          .toList(),
    );
  }
}