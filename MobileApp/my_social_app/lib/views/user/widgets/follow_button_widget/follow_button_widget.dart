import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/action.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/views/user/widgets/follow_button_widget/follow_button_widget_constants.dart';

class FollowButtonWidget extends StatelessWidget {
  final UserState user;
  const FollowButtonWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        final store = StoreProvider.of<AppState>(context, listen: false);
        if(user.isFollowed){
          store.dispatch(UnfollowAction(followed: user));
        }
        else{
          store.dispatch(FollowAction(followed: user));
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(
              user.isFollowed ? 
                unfollow[getLanguage(context)]! : 
                follow[getLanguage(context)]!
              )
          ),
          Icon(user.isFollowed ? Icons.person_remove : Icons.person_add)
        ],
      )
    );
  }
}