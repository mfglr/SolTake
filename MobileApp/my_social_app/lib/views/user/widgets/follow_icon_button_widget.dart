import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';

class FollowIconButtonWidget extends StatelessWidget {
  final UserState user;
  const FollowIconButtonWidget({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if(user.isFollowed){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(UnfollowUserAction(followedId: user.id));
        }
        else{
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(FollowUserAction(followedId: user.id));
        }
      },
      icon: Icon(user.isFollowed ? Icons.person_remove : Icons.person_add)
    );
  }
}