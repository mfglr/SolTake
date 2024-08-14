import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/widgets/no_follows.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';

class UserFollowersPage extends StatelessWidget {
  final int userId;
  const UserFollowersPage({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState>(
      converter: (store) => store.state.userEntityState.entities[userId]!,
      builder: (context,user) => Scaffold(
        appBar: AppBar(
          title: Text(
            "${user.userName}' s Followers",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: StoreConnector<AppState,Iterable<UserState>>(
          onInit: (store) => store.dispatch(GetNextPageUserFollowersIfNoPageAction(userId: userId)),
          converter: (store) => store.state.userEntityState.getFollowers(userId),
          builder: (context,users) => Container(
            margin: const EdgeInsets.all(5),
            child: Builder(
              builder: (context) {
                if(user.followers.isLast && user.followers.ids.isEmpty){
                  return NoFollows(
                    user: user,
                    message: "No Followers"
                  );
                }
                return UserItemsWidget(
                  users : users,
                  removeFollowerButton: true,
                  pagination: user.followers,
                  onScrollBotton: (){
                    final store = StoreProvider.of<AppState>(context,listen: false);
                    store.dispatch(GetNextPageUserFollowersIfReadyAction(userId: userId));
                  },
                );
              }
            )
          )
        )
      ),
    );
  }
}