import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/user/user_items_widget.dart';

class UserFollowersPage extends StatelessWidget {
  const UserFollowersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context)!.settings.arguments as int;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Followers"),
      ),
      body: StoreConnector<AppState,List<UserState>>(
        onInit: (store){
          store.dispatch(LoadFollowersIfNoUsersAction(userId: userId));
        },
        converter: (store) => store.state.userEntityState.getFollowers(userId),
        builder: (context,users) => Container(
          margin: const EdgeInsets.all(5),
          child: UserItemsWidget(state : users)
        )
      )
    );
  }
}