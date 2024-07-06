import 'package:flutter/material.dart';
import 'package:my_social_app/providers/app_provider.dart';
import 'package:my_social_app/providers/user_state.dart';
import 'package:provider/provider.dart';

class FollowButtonWidget extends StatelessWidget {
  final UserState state;

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
  const FollowButtonWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        if(state.isRequested || state.isFollowed){
          await context.read<AppProvider>().cancelFollowRequest(state.id);
        }
        else{
          await context.read<AppProvider>().makeFollowRequest(state.id);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(_getButtonContent(state))
          ),
          Icon(_getIcon(state))
        ],
      )
    );
  }
}