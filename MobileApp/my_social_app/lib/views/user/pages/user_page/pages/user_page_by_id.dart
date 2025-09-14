import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/state/users_state/action.dart';
import 'package:my_social_app/state/users_state/selectors.dart';
import 'package:my_social_app/packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/packages/entity_state/entity_container.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_loading_page/user_loading_page.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_success_page/user_success_page.dart';

class UserPageById extends StatefulWidget {
  final int userId;

  const UserPageById({
    super.key,
    required this.userId,
  });

  @override
  State<UserPageById> createState() => _UserPageByIdState();
}

class _UserPageByIdState extends State<UserPageById> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EntityContainer<int,UserState>>(
      onInit: (store) =>
        loadIfNotLoading(
          store,
          selectUserById(store, widget.userId),
          LoadUserByIdAction(id: widget.userId)
        ),
      converter: (store) => selectUserById(store, widget.userId),
      builder: (context, container){
        if(container.isLoadSuccess){
          return UserSuccessPage(user: container.entity!);
        }
        return const UserLoadingPage();
      }
    );
  }
}