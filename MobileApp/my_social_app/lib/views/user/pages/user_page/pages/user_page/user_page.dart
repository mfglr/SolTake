import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/app_state/users_state/action.dart';
import 'package:my_social_app/state/app_state/users_state/selectors.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_container.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_status.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_loading_page/user_loading_page.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_success_page/user_success_page.dart';

class UserPage extends StatefulWidget {
  final int? userId;
  final String? userName;

  const UserPage({
    super.key,
    this.userId,
    this.userName
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EntityContainer<UserState>>(
      onInit: (store) =>
        widget.userId != null
          ? loadIfNotLoading(store, selectUserById(store, widget.userId!), LoadUserByIdAction(id: widget.userId!))
          : loadIfNotLoading(store, selectUserByUserName(store, widget.userName!), LoadUserByIdAction(id: widget.userId!)),

      converter: (store) =>
        widget.userId != null
         ? selectUserById(store, widget.userId!)
         : selectUserByUserName(store, widget.userName!),

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