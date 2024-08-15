import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/follow_button_widget.dart';
import 'package:my_social_app/views/user/widgets/no_follows.dart';
import 'package:my_social_app/views/user/widgets/remove_follower_button_widget.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';

class UserFollowersPage extends StatelessWidget {
  final int userId;
  const UserFollowersPage({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState>(
      converter: (store) => store.state.userEntityState.entities[userId]!,
      builder: (context,profileUser) => Scaffold(
        appBar: AppBar(
          title: Text(
            "${profileUser.userName}' s Followers",
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
                if(profileUser.followers.isLast && profileUser.followers.ids.isEmpty){
                  return NoFollows(
                    user: profileUser,
                    message: "No Followers"
                  );
                }
                return UserItemsWidget(
                  users : users,
                  pagination: profileUser.followers,
                  rigthButtonBuilder: (user) => StoreConnector<AppState,int>(
                    converter: (store) => store.state.accountState!.id,
                    builder: (context,accountId){
                      if(accountId == profileUser.id) return RemoveFollowerButtonWidget(user: user);
                      if(accountId != user.id) return FollowButtonWidget(user: user);
                      return const SpaceSavingWidget();
                    }
                  ),
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