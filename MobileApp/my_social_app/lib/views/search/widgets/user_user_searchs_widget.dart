import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
import 'package:my_social_app/views/search/widgets/user_user_search_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';

class UserUserSearchsWidget extends StatelessWidget {
  final Iterable<UserUserSearchState> userUserSearchs;
  const UserUserSearchsWidget({
    super.key,
    required this.userUserSearchs
  });

  @override
  Widget build(BuildContext context) 
    => AppColumn(children: userUserSearchs.map((e) => UserUserSearchWidget(userUserSearch: e)));
}