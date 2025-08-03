import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/app_state/users_state/action.dart';
import 'package:my_social_app/state/app_state/users_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/entity_container.dart';
import 'package:my_social_app/state/entity_state/entity_status.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_loading_page/user_loading_page.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_success_page/user_success_page.dart';

class UserPageByUserName extends StatefulWidget {
  final String userName;

  const UserPageByUserName({
    super.key,
    required this.userName
  });

  @override
  State<UserPageByUserName> createState() => _UserPageByUserNameState();
}

class _UserPageByUserNameState extends State<UserPageByUserName> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EntityContainer<UserState>>(
      onInit: (store) =>
        loadIfNotLoading(
          store,
          selectUserByUserName(store, widget.userName),
          LoadUserByUserNameAction(userName: widget.userName)
        ),
      converter: (store) => selectUserByUserName(store, widget.userName),
      builder: (context, container){
        if(container.status == EntityStatus.success){
          return UserSuccessPage(user: container.entity!);
        }
        else if(container.status == EntityStatus.loading){
          return const UserLoadingPage();
        }
        else{
          return const Scaffold();
        }
      }
    );
  }
}