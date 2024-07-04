import 'package:flutter/material.dart';
import 'package:my_social_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class FollowButtonWidget extends StatelessWidget {
  final bool isFollowed;
  const FollowButtonWidget({super.key,required this.isFollowed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        context.read<UserProvider>();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(isFollowed ? "Unfollow" : "follow",)
          ),
          Icon(isFollowed ? Icons.person_remove : Icons.person_add)
        ],
      )
      
    );
  }
}