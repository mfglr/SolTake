import 'package:flutter/material.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';

class FollowButtonWidget extends StatelessWidget {
  final UserState user;
  
  const FollowButtonWidget({super.key, required this.user});

  String _getButtonContent(UserState state){
    return state.isRequested ? 
      "Cancel request" : 
      state.isFollowed ? 
        "Unfollow" :
        "Follow";
  }

  IconData _getIcon(UserState state){
    return state.isRequested || state.isFollowed ? Icons.person_remove : Icons.person_add;
  }


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        if(user.isRequested || user.isFollowed){
          store.dispatch(CancelFollowRequestAction(userId: user.id));
        }
        else{
          store.dispatch(MakeFollowRequestAction(userId: user.id));
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(_getButtonContent(user))
          ),
          Icon(_getIcon(user))
        ],
      )
    );
  }
}