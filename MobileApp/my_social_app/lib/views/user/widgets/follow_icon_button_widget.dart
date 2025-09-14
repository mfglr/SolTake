import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/follows_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/users_state/user_state.dart';

class FollowIconButtonWidget extends StatelessWidget {
  final UserState user;
  const FollowIconButtonWidget({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if(user.isFollowed){
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(UnfollowAction(followed: user));
        }
        else{
          final store = StoreProvider.of<AppState>(context,listen: false);
          store.dispatch(FollowAction(followed: user));
        }
      },
      icon: Icon(user.isFollowed ? Icons.person_remove : Icons.person_add)
    );
  }
}