import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';
import 'package:my_social_app/views/search_user/search_user_widget.dart';

class SearchUsersWidget extends StatelessWidget {
  final Iterable<SearchUserState> states;
  const SearchUsersWidget({
    super.key,
    required this.states
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
        states
          .mapIndexed(
            (index,state) => 
              index == states.length - 1
                ? SearchUserWidget(state: state)
                : Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: SearchUserWidget(state: state),
                  )
          )
          .toList(),
    );
  }
}