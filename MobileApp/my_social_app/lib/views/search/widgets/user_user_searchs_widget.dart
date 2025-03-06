import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
import 'package:my_social_app/views/search/widgets/user_user_search_widget.dart';

class UserUserSearchsWidget extends StatelessWidget {
  final Iterable<UserUserSearchState> userUserSearchs;
  const UserUserSearchsWidget({
    super.key,
    required this.userUserSearchs
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
        userUserSearchs
          .mapIndexed(
            (index,searchUser) => 
              index == userUserSearchs.length - 1
                ? UserUserSearchWidget(userUserSearch: searchUser)
                : Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: UserUserSearchWidget(userUserSearch: searchUser),
                  )
          )
          .toList(),
    );
  }
}