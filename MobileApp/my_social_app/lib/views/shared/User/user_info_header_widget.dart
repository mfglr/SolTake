import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/models/states/user_state.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';

class UserInfoHeaderWidget extends StatelessWidget {
  final UserState state;
  const UserInfoHeaderWidget({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UserImageWidget(state: state, diameter: 100),
              Text(
                style: const TextStyle( fontWeight: FontWeight.bold ),
                state.formatName(10)
              ),
            ]
          ),
        ),
        
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: (){},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.numberOfPosts.toString(),
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                    const Text(
                      "Posts",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
                
              TextButton(
                onPressed: () async {
                  await Navigator.of(context).pushNamed(userFollowersRoute,arguments: state.id);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.numberOfFollowers.toString(),
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                    const Text(
                      "Followers",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
          
              TextButton(
                onPressed: () async {
                  await Navigator.of(context).pushNamed(userFollowedsRoute,arguments: state.id);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.numberOfFolloweds.toString(),
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                    const Text(
                      "Followings",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              )
              
            ],
          ),
        ),
      ],
    );
  }
}